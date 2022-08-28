<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    .news-title-area{
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .news-line{
        width: 1100px;
        height: 3px;
        margin: 10px auto;
        background: black;
    }
    .news-under-line{
        width: 1100px;
        height: 1px;
        margin: 0 auto;
        background: lightgray;
    }

    #news-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink{
        width: 1100px;
        height: 50px;
        margin: 20px auto;
        padding-top: 13px;
        text-align: center;
        border: 1px solid #000;
    }


    .news-title-area{
        width: 100%;
        height: 200px;
        padding-top: 60px;
        margin-top: 60px;
    }

    .news-list-area{
        width: 1100px;
        height: 100%;
        background: #f8f5f5;
        display: flex;
        margin: 20px auto;
        border: solid 1px #000;
    }

    .event-ul > li{
        /*width: 100px;*/
        /*height: 100px;*/
        margin: 10px;
        float: left;
        /*background: black;*/
        list-style: none;
    }



    .news-status{
        width: 1100px;
        height: 150px;
        position: relative;
        text-align: center;
        margin: 0 auto;
        padding-top: 20px;

    }


    textarea{
        font-size: 1rem;
        outline: none;
    }

    #news-img{
        width: 1100px;

        margin: 0 auto;
        border: 1px solid #000;
    }

    #news-img>img{
        margin: 0 auto;
    }

</style>



<div class="news-title-area">
    <p id="news-title">뉴스</p>
    <hr class="news-line">
</div>

<div class="news-status">
    <h2> ${dto.news_title} </h2>
   <p class="date" style="margin-top: 30px"> ${dto.news_reg_date_sdf}</p>

</div>
<hr class="news-under-line">

<div id="news-img">
    <img id="news-fileup-img" src="<c:url value="/img/news/" />${dto.news_img}" alt="">
</div>

<div class="news-list-area">
    ${dto.news_contentBr}
</div>


<div class="listlink">
    <input type='button' class='admin-news-list' value='목록으로' />
</div>

<script>

    $(".admin-news-list").click(function () {
        location.href = "NewsPage"
    })
</script>
