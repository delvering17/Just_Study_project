<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script type="text/javascript">
    $("#r5").attr("checked", true)
    $(".admin-template-header>b").html("1:1 문의 목록")
</script>
<style>

    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    #main > div:first-of-type > input[type=button] {
        padding: 5px 3px 5px 3px;
        border-radius: 5px;
        border: 0;
        background: rgb(138, 169, 238);
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }

    #main > div:nth-of-type(2) {
        margin: 10px 0px 0px 0px;

    }

    #main > div:nth-of-type(2) > select {
        height: 25px;
        border-radius: 4px;
    }

    #main > div:nth-of-type(2) > button {
        width: 25px;
        height: 25px;
    }

    table {
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    .admin-inquiry-list-table {
        width: 801px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 50px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(1),
    tr:first-of-type > th:nth-of-type(2){
        width: 140px;
        height: 30px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(6),
    tr:first-of-type > th:nth-of-type(7) {
        width: 80px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }


    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }


    .admin-inquiry-list-table {
        width: 1117px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
        table-layout: fixed;
        word-break: break-all;
    }

    .admin-inquiry-list-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-inquiry-list-table th:nth-of-type(1){
        width: 25px;
    }
    .admin-inquiry-list-table th:nth-of-type(2),
    .admin-inquiry-list-table th:nth-of-type(4){
        width: 125px;
    }

    .admin-inquiry-list-table th:nth-of-type(3),
    .admin-inquiry-list-table th:nth-of-type(5),
    .admin-inquiry-list-table th:nth-of-type(8),
    .admin-inquiry-list-table th:nth-of-type(9),
    .admin-inquiry-list-table th:nth-of-type(10){
        width: 89px;
    }

    .admin-inquiry-list-table th:nth-of-type(6),
    .admin-inquiry-list-table th:nth-of-type(7),
    .admin-inquiry-list-table th:nth-of-type(11),
    .admin-inquiry-list-table th:nth-of-type(12) {
        width: 50px;
    }

    .admin-inquiry-list-table th:nth-of-type(13),
    .admin-inquiry-list-table th:nth-of-type(14){
        width: 77px;
    }
    .admin-inquiry-list-table th:nth-of-type(15){
        width: 42px;
    }

    .admin-inquiry-list-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding: 5px 5px 5px 5px;
    }

    .admin-inquiry-list-table tr:first-of-type {
        height: 50px;
        padding: 10px;
        color: white;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-inquiry-list-table tr:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726);
    }

    input[name=admin-inquiry-list-start], input[name=admin-inquiry-list-end],
    select[name=admin-inquiry-list-month], select[name=admin-inquiry-list-year] {
        display: none;
    }

    input[type=radio][value=day]:checked + input + input + input + input[name=admin-inquiry-list-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input[name=admin-inquiry-list-start],
    input[type=radio][value=dayBetweenDay]:checked + input + input + input + input[name=admin-inquiry-list-end],
    input[type=radio][value=month]:checked + input + input + input + select,
    input[type=radio][value=month]:checked + input + input + input + select + select,
    input[type=radio][value=year]:checked + input + input + select {
        display: inline-block;
    }

    select[name=branch] {
        width: 150px;
    }


</style>

<div id="main">


    <div>
        <form action="AdminInquiryListSearch" method="post" class="admin-inquiry-list-form">
            <select name="city">
                <option>전체</option>
                <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
                    <option>${city}</option>
                </c:forTokens>
            </select>

            <select name="branch">
                <option>전체</option>
            </select>

            <input type="radio" name="admin-inquiry-list-period" value="day"/>일일
            <input type="radio" name="admin-inquiry-list-period" value="dayBetweenDay"/>일간
            <input type="radio" name="admin-inquiry-list-period" value="month"/>월간
            <input type="radio" name="admin-inquiry-list-period" value="year"/>연간

            <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" var="today"/>

            <input type="date" name="admin-inquiry-list-start" value="${today}"/>
            <input type="date" name="admin-inquiry-list-end" value="${today}"/>

            <select name="admin-inquiry-list-year">
                <option>2021</option>
                <option>2022</option>
            </select>
            <select name="admin-inquiry-list-month">
                <c:forEach var="month" begin="1" end="12" step="1">
                    <option>${month}</option>
                </c:forEach>
            </select>

            <div>
                <select name="admin-inquiry-state-search">
                    <option>미답변</option>
                    <option>답변</option>
                </select>
                <select name="admin-inquiry-list-filter">
                    <option value="inquiry_title">제목</option>
                    <option value="inquiry_writer">회원번호</option>
                    <option value="inquiry_category">카테고리</option>
                    <option value="inquiry_type">종류</option>
                </select>
                <input type="text" name="admin-inquiry-list-word"/>

                <button type="button" class="admin-inquiry-list-search"><i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </form>
    </div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-inquiry-list-table">
        <tr>
            <th>문의 일자</th>
            <th>제목</th>
            <th>회원번호</th>
            <th>카테고리</th>
            <th>종류</th>
            <th>지점</th>
            <th>답변 상태</th>
        </tr>
        <c:forEach items="${inquiryUnansweredDTO}" var="inquiryUnanswered">
            <tr>
                <td>${inquiryUnanswered.inquiry_date}</td>
                <td>
                    <a href="AdminInquiryDetail?inquiry_id=${inquiryUnanswered.inquiry_id}">${inquiryUnanswered.inquiry_title}</a>
                </td>
                <td>${inquiryUnanswered.inquiry_writer}</td>
                <td>${inquiryUnanswered.inquiry_category}</td>
                <td>${inquiryUnanswered.inquiry_type}</td>
                <td>${inquiryUnanswered.inquiry_branch}</td>
                <c:choose>
                    <c:when test="${inquiryUnanswered.inquiry_state == 1}">
                        <td>미답변</td>
                    </c:when>
                    <c:otherwise>
                        <td>답변</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>

        <c:forEach items="${arr_inquiryDTO}" var="inquiryDTO">
            <tr>
                <td>${inquiryDTO.inquiry_date}</td>
                <td><a href="AdminInquiryDetail?inquiry_id=${inquiryDTO.inquiry_id}">${inquiryDTO.inquiry_title}</a>
                </td>
                <td>${inquiryDTO.inquiry_writer}</td>
                <td>${inquiryDTO.inquiry_category}</td>
                <td>${inquiryDTO.inquiry_type}</td>
                <td>${inquiryDTO.inquiry_branch}</td>
                <c:choose>
                    <c:when test="${inquiryDTO.inquiry_state == 1}">
                        <td>미답변</td>
                    </c:when>
                    <c:otherwise>
                        <td>답변</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    $(".admin-store-delete").click(function () {
        alert($("input[name=branch]:checked").attr("id"))

    })
</script>
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

    $("input[name=admin-inquiry-list-period]").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-inquiry-list-period")%>"){
            value.setAttribute("checked", true)
        }
    })

    $("input[name=admin-inquiry-list-start]").val("<%=request.getParameter("admin-inquiry-list-start")%>")
    $("input[name=admin-inquiry-list-end]").val("<%=request.getParameter("admin-inquiry-list-end")%>")

    $("select[name=admin-inquiry-list-year] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-inquiry-list-year")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-inquiry-list-month] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-inquiry-list-month")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-inquiry-list-filter] > option").each(function (key, value){
        if(value.getAttribute("value") == "<%=request.getParameter("admin-inquiry-list-filter")%>"){
            value.setAttribute("selected", true)
        }
    })

    $("select[name=admin-inquiry-state-search] > option").each(function (key, value){
        if(value.innerHTML == "<%=request.getParameter("admin-inquiry-state-search")%>"){
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

    $("input[name=admin-inquiry-list-start]").change(function () {
        if ($("input[name=admin-inquiry-list-start]").val() > $("input[name=admin-inquiry-list-end]").val()) {
            $("input[name=admin-inquiry-list-end]").val($("input[name=admin-inquiry-list-start]").val())
        }
    })

    $("input[name=admin-inquiry-list-end]").change(function () {
        if ($("input[name=admin-inquiry-list-start]").val() > $("input[name=admin-inquiry-list-end]").val()) {
            $("input[name=admin-inquiry-list-start]").val($("input[name=admin-inquiry-list-end]").val())
        }
    })

    $(".admin-inquiry-list-search").click(function () {

        let checkNull = true;
        switch ($("input[name=admin-inquiry-list-period]:checked").val()) {
            case "day":
                if ($("input[name=admin-inquiry-list-start]").val() == "") {
                    checkNull = false;
                }
                break;
            case "dayBetweenDay":
                if ($("input[name=admin-inquiry-list-start]").val() == "" || $("input[name=admin-inquiry-list-end]").val() == "") {
                    checkNull = false;
                }
                break;
        }

        if (checkNull) {
            $(".admin-inquiry-list-form").submit()
        } else {
            alert("날짜를 선택해주세요.");
        }
    })
</script>