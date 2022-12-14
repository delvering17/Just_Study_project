<%@ page import="model_p.AdminReservDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-17
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
    $("#r4").attr("checked", true)

    $(".admin-template-header>b").html("예약 목록")
</script>

<style>
    .admin-reserv-list-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-reserv-list-table {
        width: 1122px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
        table-layout: fixed;
        word-break: break-all;
    }

    .admin-reserv-list-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-reserv-list-table th:nth-of-type(1){
        width: 30px;
    }
    .admin-reserv-list-table th:nth-of-type(2),
    .admin-reserv-list-table th:nth-of-type(4){
        width: 125px;
    }

    .admin-reserv-list-table th:nth-of-type(3),
    .admin-reserv-list-table th:nth-of-type(5),
    .admin-reserv-list-table th:nth-of-type(8),
    .admin-reserv-list-table th:nth-of-type(9),
    .admin-reserv-list-table th:nth-of-type(10){
        width: 89px;
    }

    .admin-reserv-list-table th:nth-of-type(6),
    .admin-reserv-list-table th:nth-of-type(7),
    .admin-reserv-list-table th:nth-of-type(11),
    .admin-reserv-list-table th:nth-of-type(12) {
        width: 50px;
    }

    .admin-reserv-list-table th:nth-of-type(13),
    .admin-reserv-list-table th:nth-of-type(14){
        width: 77px;
    }
    .admin-reserv-list-table th:nth-of-type(15){
        width: 42px;
    }

    .admin-reserv-list-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding: 5px 5px 5px 5px;
    }

    .admin-reserv-list-table tr:first-of-type {
        height: 50px;
        padding: 10px;
        color: white;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-reserv-list-table tr:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726);
    }

    input[name=admin-reserv-list-start], input[name=admin-reserv-list-end],
    select[name=admin-reserv-list-month], select[name=admin-reserv-list-year] {
        display: none;
    }

    input[type=radio][value=day]:checked + input + input + input + input[name=admin-reserv-list-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input[name=admin-reserv-list-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input + input[name=admin-reserv-list-end],
    input[type=radio][value=month]:checked + input + input + input + select,
    input[type=radio][value=month]:checked + input + input + input + select + select,
    input[type=radio][value=year]:checked + input + input + select {
        display: inline-block;
    }

    select[name=branch] {
        width: 150px;
    }

    #admin-sales-store-align-right{
        text-align: right;
    }

</style>

<div class="admin-reserv-list-main">

    <div>
        <form action="AdminReservListSearch" method="post" class="admin-reserv-list-form">
            <select name="city">
                <option>전체</option>
                <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
                    <option>${city}</option>
                </c:forTokens>
            </select>

            <select name="branch">
                <option>전체</option>
            </select>

            <input type="radio" name="admin-reserv-list-period" value="day"/>일일
            <input type="radio" name="admin-reserv-list-period" value="dayBetweenDay"/>일간
            <input type="radio" name="admin-reserv-list-period" value="month"/>월간
            <input type="radio" name="admin-reserv-list-period" value="year"/>연간

            <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" var="today"/>

            <input type="date" name="admin-reserv-list-start" value="${today}"/>
            <input type="date" name="admin-reserv-list-end" value="${today}"/>

            <select name="admin-reserv-list-year">
                <option>2021</option>
                <option>2022</option>
            </select>
            <select name="admin-reserv-list-month">
                <c:forEach var="month" begin="1" end="12" step="1">
                    <option>${month}</option>
                </c:forEach>
            </select>

            <div>
                <select name="admin-reserv-list-filter">
                    <option value="id">ID</option>
                    <option value="orderId">주문번호</option>
                    <option value="resDate">주문일자</option>
                    <option value="mem_userid">사용자ID</option>
                    <option value="mem_realname">사용자이름</option>
                    <option value="mem_nickname">사용자닉네임</option>
                    <option value="room">룸타입</option>
                    <option value="useDate">이용일자</option>
                    <option value="time">시간</option>
                    <option value="headcount">인원수</option>
                    <option value="pay">결제금액</option>
                    <option value="status">상태</option>
                </select>
                <input type="text" name="admin-reserv-list-word"/>
                <button type="button" class="admin-reserv-list-search"><i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </form>
    </div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-reserv-list-table">
        <tr>
            <th>ID</th>
            <th>주문번호</th>
            <th>주문일자</th>
            <th>사용자아이디</th>
            <th>닉네임</th>
            <th>이름</th>
            <th>지역</th>
            <th>지점명</th>
            <th>룸타입</th>
            <th>이용일자</th>
            <th>시간</th>
            <th>인원수</th>
            <th>결제금액</th>
            <th>상태</th>
            <th></th>
        </tr>
        <%
            ArrayList<AdminReservDTO> totalList = (ArrayList<AdminReservDTO>) request.getAttribute("totalList");

            if (totalList.size() != 0) {
                for (AdminReservDTO adminReservDTO : totalList) {%>
        <form action="AdminReservationCancelForm">
            <tr>
                <input type="hidden" name="id" value="<%=adminReservDTO.getId()%>"/>
                <td><%=adminReservDTO.getId()%>
                </td>
                <td><%=adminReservDTO.getOrderId()%>
                </td>
                <td><%=adminReservDTO.getResDate()%>
                </td>
                <td><%=adminReservDTO.getMem_userid()%>
                </td>
                <td><%=adminReservDTO.getMem_nickname()%>
                </td>
                <td><%=adminReservDTO.getMem_realname()%>
                </td>
                <td><%=adminReservDTO.getCity()%>
                </td>
                <td><%=adminReservDTO.getBranch()%>
                </td>
                <td><%=adminReservDTO.getRoom()%>
                </td>
                <td><%=adminReservDTO.getUseDate()%>
                </td>
                <td><%=adminReservDTO.getTime().replaceAll(", ", "<br/>")%>
                </td>
                <td><%=adminReservDTO.getHeadcount()%>
                </td>
                <td id="admin-sales-store-align-right"><fmt:formatNumber value="<%=adminReservDTO.getPay()%>" type="number"/>
                </td>
                <td><%=adminReservDTO.getStatus()%>
                </td>
                <td>
                    <%if (adminReservDTO.getStatus().equals("결제완료")) {%>
                    <input type="submit" value="취소"/>
                    <%} else if (adminReservDTO.getStatus().equals("관리자취소")) {%>
                    <%=adminReservDTO.getCancelReason()%>
                    <%}%>
                </td>
            </tr>
        </form>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="15">일치하는 항목이 없습니다.</td>
        </tr>
        <%}%>
    </table>
</div>

<script type="text/javascript">

    <%ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");%>

    $("select[name=city] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("city")%>"){
            value.setAttribute("selected", true)
        }

        $("select[name=branch]").html("<option>전체</option>")
        <%for(BranchDTO branchDTO : branchList){%>
        if ($("select[name=city]").val() == "<%=branchDTO.getCity()%>") {
            $("select[name=branch]").append("<option><%=branchDTO.getName()%></option>")
        }
        <%}%>
    })

    $("select[name=branch] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("branch")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("input[name=admin-reserv-list-period]").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-reserv-list-period")%>"){
            value.setAttribute("checked", true)
        }
    })

    $("input[name=admin-reserv-list-start]").val("<%=request.getParameter("admin-reserv-list-start")%>")
    $("input[name=admin-reserv-list-end]").val("<%=request.getParameter("admin-reserv-list-end")%>")

    $("select[name=admin-reserv-list-year] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-reserv-list-year")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-reserv-list-month] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-reserv-list-month")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-reserv-list-filter] > option").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-reserv-list-filter")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=city]").change(function () {
        $("select[name=branch]").html("<option>전체</option>")
        <%for(BranchDTO branchDTO : branchList){%>
        if ($("select[name=city]").val() == "<%=branchDTO.getCity()%>") {
            $("select[name=branch]").append("<option><%=branchDTO.getName()%></option>")
        }
        <%}%>
    })

    $("input[name=admin-reserv-list-start]").change(function () {
        if ($("input[name=admin-reserv-list-start]").val() > $("input[name=admin-reserv-list-end]").val()) {
            $("input[name=admin-reserv-list-end]").val($("input[name=admin-reserv-list-start]").val())
        }
    })

    $("input[name=admin-reserv-list-end]").change(function () {
        if ($("input[name=admin-reserv-list-start]").val() > $("input[name=admin-reserv-list-end]").val()) {
            $("input[name=admin-reserv-list-start]").val($("input[name=admin-reserv-list-end]").val())
        }
    })

    $(".admin-reserv-list-search").click(function () {

        let checkNull = true;
        switch ($("input[name=admin-reserv-list-period]:checked").val()) {
            case "day":
                if ($("input[name=admin-reserv-list-start]").val() == "") {
                    checkNull = false;
                }
                break;
            case "dayBetweenDay":
                if ($("input[name=admin-reserv-list-start]").val() == "" || $("input[name=admin-reserv-list-end]").val() == "") {
                    checkNull = false;
                }
                break;
        }

        if (checkNull) {
            $(".admin-reserv-list-form").submit()
        } else {
            alert("날짜를 선택해주세요.");
        }
    })
</script>