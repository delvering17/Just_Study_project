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
        padding-top: 100px;
        margin: 0 auto;

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
        margin: 20px auto;
        background: lightgray;
    }

    #news-title{

        font-weight: bold;
        text-align: center;
    }

    .listlink{
        width: 1100px;
        height: 50px;
        margin: 0px auto;
        padding-bottom: 50px;
        padding-top: 13px;
        text-align: center;

    }

    .news-list-area{
        width: 1100px;
        display: flex;
        margin: 20px auto;

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
        width: 600px;
        margin: 0 auto;

    }

    #news-img>img{
        width: 100%;
        margin: 0 auto;
    }

</style>



<div class="news-title-area">
    <h1 id="news-title">뉴스</h1>
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
    <input type='button' class='news-list' value='목록으로' />
</div>

<script>

    $(".news-list").click(function () {
        location.href = "NewsPage"
    })
</script>
