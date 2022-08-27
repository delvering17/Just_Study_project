<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script type="text/javascript">
    $("#r5").attr("checked", true)
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

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 50px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2),
    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(7),
    tr:first-of-type > th:nth-of-type(8) {
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(6) {
        width: 250px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }
</style>

<div id="main">
    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
        <tr>
            <th>문의 일자</th>
            <th>제목</th>
            <th>작성자</th>
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