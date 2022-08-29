<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-22
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
    $(".admin-template-header>b").html("뉴스 목록")
    $(".admin-template-header>div").append("<input type='button' class='admin-news-modify' value='수정' />")
    $(".admin-template-header>div").append("<input type='button' class='admin-news-delete' value='삭제' />")
    $(".admin-template-header>div").append("<input type='button' class='admin-news-list' value='목록으로' />")

</script>
<style>

    .admin-news-detail-main {
        width: 1100px;
        height: fit-content;
        margin: 0 auto;
        padding: 20px 20px;
    }

    .news-title-area {
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    #news-title {
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink {
        width: 1100px;
        height: 50px;
        margin: 0 auto;
        padding-top: 13px;
        text-align: center;
    }
    .listlink>input{
        margin-left: 30px;
        font-weight: bold;
        width: 60px;
        height: 30px;
    }


    .news-title-area {
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line {
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

    .news-list-area {
        width: 1100px;
        height: 100%;
        display: flex;
        margin: 20px auto;
    }


    .news-ul > li {
        margin: 10px;
        float: left;
        list-style: none;
    }


    .news-status {
        width: 1100px;
        height: 150px;
        position: relative;
        text-align: center;
        margin: 0 auto;
        padding-top: 20px;

    }

    textarea {
        font-size: 1rem;
        outline: none;

    }

    .news-img {
        width: 1100px;
        height: 100%;
        margin: 30px auto;

    }
    .news-img>img{
        width: 1100px;
       margin: 0 auto;
        border-radius: 7px;

    }
    .news-img> p{
        text-align: center;
        font-weight: bold;
        padding-bottom: 20px;
        padding-top: 50px;
    }

    .news-thumbnail-img{
        width: 300px;
        height: 300px;
        margin: 30px auto;

    }
    .news-thumbnail-img>img{
        width: 300px;
        height: 300px;
        margin: 0 auto;
        border-radius: 7px;
    }
    .news-thumbnail-img> p {
        text-align: center;
        font-weight: bold;
        padding-bottom: 20px;
    }

    .news_content {
        width: 1100px;
        height: 100%;

    }

</style>

<div class="admin-news-detail-main">
    <div class="news-title-area">
        <p id="news-title">뉴스</p>
        <hr class="title-line">
    </div>

    <div class="news-status">
        <h2> ${dto.news_title} </h2>
        <p class="date" style="margin-top: 30px"> ${dto.news_reg_date_sdf}</p>

    </div>
    <hr class="news-under-line">

    <div class="news-thumbnail-img">
        <p>썸네일 이미지</p>
        <img id="news-fileup-thumbnail-img" src="<c:url value="/img/news/" />${dto.news_thumbnail_img}" alt="">
    </div>

    <div class="news-img">
        <p>본문 이미지</p>
        <img id="news-fileup-img" src="<c:url value="/img/news/" />${dto.news_img}" alt="">
    </div>

    <div class="news-list-area">
        <div class="news_content">
            ${dto.news_contentBr}
        </div>
    </div>
</div>
<script>


    $(".admin-news-list").click(function () {
        location.href = "AdminNewsList"
    })
    $(".admin-news-modify").click(function () {
        location.href = "AdminNewsModifyForm?id=${dto.news_id}"
    })
    $(".admin-news-delete").click(function () {
        location.href = "AdminNewsDeleteReg?id=${dto.news_id}"
    })

</script>