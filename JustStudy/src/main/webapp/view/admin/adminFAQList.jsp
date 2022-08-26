<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-22
  Time: 오전 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .admin-faq-list-bg{
        width: 100%;
        height: fit-content;
    }

    .admin-faq-list-headline {
        width: 1330px;
        height: 40px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-top: 15px;
        padding-left: 20px;
        margin-top: 50px;
        margin-left: 239px;
        position: fixed;
        flex-direction: row;
    }

    .admin-faq-list-headline > b {
        width: 100px;
        font-size: 20px;
    }

    .admin-faq-list-main {
        width: 2000px;
        height: fit-content;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    .admin-faq-list-table {
        width: 40%;
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

    .admin-faq-list-table tr:first-of-type{
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-faq-list-table th:nth-of-type(1),
    .admin-faq-list-table th:nth-of-type(5){
        width: 7%;
    }
    .admin-faq-list-table th:nth-of-type(2){
        width: 16%;
    }
    .admin-faq-list-table th:nth-of-type(3),
    .admin-faq-list-table th:nth-of-type(4){
        width: 35%;
    }

</style>

<div class="admin-faq-list-bg">

    <div class="admin-faq-list-headline">
        <b>FAQ</b>
    </div>

    <div class="admin-faq-list-main">
        <div>
            <input type="text">
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
            <button class="admin-faq-insert">추가</button>
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

</div>
<script type="text/javascript">
    $(".admin-faq-insert").click(function (){
        location.href="AdminFAQInsert";

    })

    $("input[value=삭제]").click(function (){
        if(confirm("정말 삭제하시겠습니까?")){
            $(".admin-faq-list-form").submit()
        }
    })

</script>
