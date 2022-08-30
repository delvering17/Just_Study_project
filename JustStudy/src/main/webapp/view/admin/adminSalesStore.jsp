<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="model_p.AdminReservDTO" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
    $("#r3").attr("checked", true)

    $(".admin-template-header>b").html("지점별 매출")
</script>

<style>

    input[name=admin-sales-store-start], input[name=admin-sales-store-end],
    select[name=admin-sales-store-month], select[name=admin-sales-store-year] {
        display: none;
    }

    input[type=radio][value=day]:checked + input + input + input + input[name=admin-sales-store-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input[name=admin-sales-store-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input + input[name=admin-sales-store-end],
    input[type=radio][value=month]:checked + input + input + input + select,
    input[type=radio][value=month]:checked + input + input + input + select + select,
    input[type=radio][value=year]:checked + input + input + select {
        display: inline-block;
    }

    .admin-sales-store-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-sales-store-table {
        width: 1101px;
/*        border: 1px solid rgb(122, 115, 115);*/
        margin-top: 10px;
        table-layout: fixed;
        word-break: break-all;
    }

    .admin-sales-store-table th {
        width: 100px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-sales-store-table th:nth-of-type(1),
    .admin-sales-store-table th:nth-of-type(3){
        width: 150px;
    }

    .admin-sales-store-table th:nth-of-type(2),
    .admin-sales-store-table th:nth-of-type(4),
    .admin-sales-store-table th:nth-of-type(5),
    .admin-sales-store-table th:nth-of-type(6),
    .admin-sales-store-table th:nth-of-type(7),
    .admin-sales-store-table th:nth-of-type(8),
    .admin-sales-store-table th:nth-of-type(9),
    .admin-sales-store-table th:nth-of-type(10){
        width: 100px;
    }

    .admin-sales-store-table td {
/*        border: 1px solid rgb(97, 88, 88);*/
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding: 5px 5px 5px 5px;
    }



    .admin-sales-store-table tr:first-of-type {
        height: 50px;
        padding: 10px;
        color: white;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-sales-store-table tr:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726);
    }

    .admin-sales-store-table-td{
        border: 1px solid rgb(97, 88, 88);
    }

    select[name=branch] {
        width: 150px;
    }

    .admin-sales-store-total{
        text-align: right;
        font-size: 1rem;
        width: fit-content;
        float: right;
        padding-left: 60px;
        font-weight: bold;
    }

    .admin-sales-store-total:nth-of-type(1){
        color: red;
    }

    #admin-sales-store-align-right{
        text-align: right;
    }

</style>

<%
    ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");
    System.out.println(branchList.size());
%>

<div class="admin-sales-store-main">

    <div>
        <form action="AdminSalesStore" style="border-collapse: collapse" class="admin-sales-store-form">
            <select name="city">
                <option>전체</option>
                <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
                    <option>${city}</option>
                </c:forTokens>
            </select>

            <select name="branch">
                <option>전체</option>
            </select>

            <input type="radio" name="admin-sales-store-period" value="day"/>일일
            <input type="radio" name="admin-sales-store-period" value="dayBetweenDay"/>일간
            <input type="radio" name="admin-sales-store-period" value="month"/>월간
            <input type="radio" name="admin-sales-store-period" value="year"/>연간

            <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" var="today"/>

            <input type="date" name="admin-sales-store-start" value="${today}"/>
            <input type="date" name="admin-sales-store-end" value="${today}"/>

            <select name="admin-sales-store-year">
                <option>2021</option>
                <option>2022</option>
            </select>
            <select name="admin-sales-store-month">
                <c:forEach var="month" begin="1" end="12" step="1">
                    <option>${month}</option>
                </c:forEach>
            </select>

            <div>
                <select name="admin-sales-store-filter">
                    <option value="mem_userid">사용자ID</option>
                    <option value="mem_realname">사용자이름</option>
                    <option value="mem_nickname">사용자닉네임</option>
                </select>
                <input type="text" name="admin-sales-store-word"/>
                <button type="button" class="admin-sales-store-search"><i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </form>
    </div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-sales-store-table">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>지역</th>
            <th>지점명</th>
            <th>룸타입</th>
            <th>이용일자</th>
            <th>이용시간</th>
            <th>상태</th>
            <th>결제금액</th>
        </tr>
        <form action="">
            <c:choose>
                <c:when test="${salesStoreList.size() != 0}">
                    <c:forEach items="${salesStoreList}" var="salesStoreList">
                        <tr>
                            <td class="admin-sales-store-table-td">${salesStoreList.mem_userid}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.mem_realname}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.mem_nickname}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.city}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.branch}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.room}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.useDate}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.time}</td>
                            <td class="admin-sales-store-table-td">${salesStoreList.status}</td>
 <%--                           <td id="admin-sales-store-align-right">${salesStoreList.pay}</td>--%>
                            <td class="admin-sales-store-table-td" id="admin-sales-store-align-right"><fmt:formatNumber value="${salesStoreList.pay }" type="number"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="10">
                            <div class="admin-sales-store-total"><fmt:formatNumber value="${storeTotalPay }" type="number"/></div>
                            <div class="admin-sales-store-total">총 매출: </div>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="10">일치하는 항목이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>

        </form>
    </table>
</div>
<script type="text/javascript">

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

    $("input[name=admin-sales-store-period]").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-sales-store-period")%>"){
            value.setAttribute("checked", true)
        }
    })

    $("input[name=admin-sales-store-start]").val("<%=request.getParameter("admin-sales-store-start")%>")
    $("input[name=admin-sales-store-end]").val("<%=request.getParameter("admin-sales-store-end")%>")

    $("select[name=admin-sales-store-year] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-sales-store-year")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-sales-store-month] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-sales-store-month")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-sales-store-filter] > option").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-sales-store-filter")%>"){
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

    $("input[name=admin-sales-store-start]").change(function () {
        if ($("input[name=admin-sales-store-start]").val() > $("input[name=admin-sales-store-end]").val()) {
            $("input[name=admin-sales-store-end]").val($("input[name=admin-sales-store-start]").val())
        }
    })

    $("input[name=admin-sales-store-end]").change(function () {
        if ($("input[name=admin-sales-store-start]").val() > $("input[name=admin-sales-store-end]").val()) {
            $("input[name=admin-sales-store-start]").val($("input[name=admin-sales-store-end]").val())
        }
    })

    $(".admin-sales-store-search").click(function () {

        let checkNull = true;
        switch ($("input[name=admin-sales-store-period]:checked").val()) {
            case "day":
                if ($("input[name=admin-sales-store-start]").val() == "") {
                    checkNull = false;
                }
                break;
            case "dayBetweenDay":
                if ($("input[name=admin-sales-store-start]").val() == "" || $("input[name=admin-sales-store-end]").val() == "") {
                    checkNull = false;
                }
                break;
        }

        if (checkNull) {
            $(".admin-sales-store-form").submit()
        } else {
            alert("날짜를 선택해주세요.");
        }
    })


</script>