<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-21
  Time: 오후 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .customer-faq-bg {
        width: 100%;
        height: fit-content;
        background: #F5F5F5;
        padding-top: 100px;
        padding-bottom: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 700px;
    }

    .customer-faq-bg > h1 {
        width: fit-content;
        height: fit-content;
        margin-bottom: 30px;
        font-weight: bold;
    }

    .customer-faq-bg .customer-faq-category{
        width: 100%;
        height: 50px;
        background: #e7e7e7;
        border-top: 1px solid lightgray;
        margin-bottom: 50px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
    }

    .customer-faq-bg .customer-faq-category label{
        margin: 0px 30px;
    }

    .customer-faq-bg input[name=faq-category]:checked + div{
        font-weight: bolder;
    }

    .customer-faq-list{
        width: 70%;
        height: fit-content;
        border-top: 1px solid lightgray;
        padding: 20px 0px;
    }

    .customer-faq-question{
        width: 100%;
        height: 70px;
        padding: 0px 100px;
        line-height: 70px;
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .fa-circle-question{
        height: 100%;
        font-size: 3rem;
        margin-right: 20px;
    }

    .customer-faq-question p{
        width: fit-content;
        font-size: 1.5rem;
        font-weight: bold;
        display: inline-block;
    }

    .customer-faq-answer{
        width: 100%;
        height: fit-content;
        padding: 20px 100px;
    }

</style>



<div class="customer-faq-bg">
    <h1>자주 하는 질문</h1>
    <div class="customer-faq-category">
        <label><input type="radio" name="faq-category" id="usage" hidden><div>이용방법</div></label>
        <label><input type="radio" name="faq-category" id="studyroom" hidden><div>스터디룸 예약</div></label>
        <label><input type="radio" name="faq-category" id="pay" hidden><div>결제</div></label>
        <label><input type="radio" name="faq-category" id="etc" hidden><div>기타</div></label>
    </div>

    <c:forEach items="${faqList}" var="faq" varStatus="no">
        <div class="customer-faq-list">
            <div class="customer-faq-question"><i class="fa-solid fa-circle-question"></i><p>${faq.question}</p></div>
            <div class="customer-faq-answer">${faq.answerBr}</div>
        </div>
    </c:forEach>

</div>

<script type="text/javascript">

        $("input[name=faq-category]").each(function (key, value){
            if(value.getAttribute("id") == "${param.category}"){
                value.setAttribute("checked", true)
            }
        })

        $("input[name=faq-category]").change(function (){
            location.href = "Faq?category="+$("input[name=faq-category]:checked").attr("id")
        })

</script>