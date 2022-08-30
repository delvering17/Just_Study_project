<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-22
  Time: 오전 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
    $(".admin-template-header>b").html("FAQ")
    $(".admin-template-header>div").append("<input type=button class='admin-faq-insert' value='추가'/>")
</script>
<style type="text/css">

    .admin-faq-list-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-faq-list-main > div {
        display: flex;
        flex-direction: row;
    }

    .admin-faq-list-table {
        width: 700px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    .admin-faq-list-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-faq-list-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .admin-faq-list-table tr:first-of-type {
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-faq-list-table th:nth-of-type(1),
    .admin-faq-list-table th:nth-of-type(5) {
        width: 7%;
    }

    .admin-faq-list-table th:nth-of-type(2) {
        width: 16%;
    }

    .admin-faq-list-table th:nth-of-type(3),
    .admin-faq-list-table th:nth-of-type(4) {
        width: 35%;
    }

</style>

<div class="admin-faq-list-main">
    <div>
        <form action="AdminFAQListSearch">
            <select name="FAQSort">
                <option value="usage" selected>이용방법</option>
                <option value="studyroom">스터디룸 예약</option>
                <option value="pay">결제</option>
                <option value="etc">기타</option>
            </select>
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    </div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-faq-list-table">
        <tr>
            <th>ID</th>
            <th>분류</th>
            <th>질문</th>
            <th>답변</th>
            <th></th>
        </tr>

        <c:forEach items="${faqList}" varStatus="no" var="faq">
            <form action="AdminFAQModifyDelete" class="admin-faq-list-form">
                <input type="hidden" name="faqId" value="${faq.id}"/>
                <tr>
                    <td>${faq.id}</td>
                    <td>${faq.categoryKor}</td>
                    <td>${faq.question}</td>
                    <td>${faq.answerBr}</td>
                    <td>
                        <input type="submit" name="type" value="수정">
                        <input type="button" value="삭제">
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    $(".admin-faq-search").click(function () {
        location.href = "AdminFAQListSearch";

    })

    $(".admin-faq-insert").click(function () {
        location.href = "AdminFAQInsert";

    })

    $("input[value=삭제]").click(function () {
        if (confirm("정말 삭제하시겠습니까?")) {
            $(".admin-faq-list-form").eq($(this).index("input[type=button][value=삭제]")).submit()
        }
    })

</script>
