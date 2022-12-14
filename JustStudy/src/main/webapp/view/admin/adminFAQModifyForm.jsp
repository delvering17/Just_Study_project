<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-22
  Time: 오전 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
    $(".admin-template-header>b").html("FAQ 수정")
    $(".admin-template-header>div").append("<input type=button class='admin-faq-modify' value='저장'/>")
</script>
<style type="text/css">

    .admin-faq-modify-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-faq-modify-table {
        height: 400px;
        border: 1px solid rgb(97, 88, 88);
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .admin-faq-modify-table > tbody > tr > th {
        width: 80px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-faq-modify-table th {
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .admin-faq-modify-table td {
        width: 400px;
        padding: 5px 0px 5px 10px;
        font-size: 13px;
        border: 1px solid rgb(97, 88, 88);
    }

    .admin-faq-modify-table tr:nth-of-type(1),
    .admin-faq-modify-table tr:nth-of-type(2) {
        height: 15%;
    }

    input[name=faq-category] {
        margin-left: 10px;
    }

    input[name=faq-question] {
        width: 300px;
        height: 30px;
    }
</style>

<div class="admin-faq-modify-main">

    <form action="AdminFAQModifyReg" class="admin-faq-modify-action" method="get">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-faq-modify-table">
            <input type="hidden" name="faq-id" value="${faqDTO.id}"/>
            <tr>
                <th>분류</th>
                <td>
                    <input type="radio" name="faq-category" value="usage" checked/>이용방법
                    <input type="radio" name="faq-category" value="studyroom"/>스터디룸 예약
                    <input type="radio" name="faq-category" value="pay"/>결제
                    <input type="radio" name="faq-category" value="etc"/>기타
                </td>
            </tr>
            <tr>
                <th>질문</th>
                <td><input type="text" name="faq-question" value="${faqDTO.question}"/></td>
            </tr>
            <tr>
                <th>답변</th>
                <td><textarea name="faq-answer" rows="17" cols="50">${faqDTO.answer}</textarea></td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    $("input[name=faq-category]").each(function (key, value) {
        if (value.getAttribute("value") == "${faqDTO.category}") {
            value.setAttribute("Checked", true)
        }
    });

    $(".admin-faq-modify").click(function () {
        $(".admin-faq-modify-action").submit()
    })

</script>
