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
</script>
<style>

    .admin-news-detail-bg {
        width: 100%;
        height: 100%;
    }

    .admin-news-detail-headline {
        width: 100%;
        height: 50px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-left: 20px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .admin-news-detail-headline > b {
        width: fit-content;
        font-size: 20px;
        line-height: 50px;
    }

    .admin-news-detail-main{
      width: 100%;
      height: 100%;
      padding: 20px 20px;
      overflow: auto;
    }

    .news-title-area {
        width: 100%;
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
        width: 80%;
        height: 100px;
        margin: 0 auto;
        text-align: center;
        border: 1px solid #000;
    }


    .news-title-area {
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/

        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line {
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin-left: 10%;
        background: black;
    }


    .news-list-area {
        width: 80%;
        height: 100%;
        background: #ffa;
        display: flex;
        margin-left: 10%;
        margin-top: 50px;
        margin-bottom: 2%;
    }


    .news-ul > li {
        margin: 10px;
        float: left;
        list-style: none;
    }


    .news-status {
        width: 80%;
        height: 150px;
        padding: 35px 80px;
        position: relative;
        text-align: center;
        margin-left: 10%;

    }

    .news-status > div {
        width: 150px;
        height: 70px;
        background: aqua;
        border: solid 1px #000;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }


    textarea {
        font-size: 1rem;
        outline: none;

    }

    .news-img {
        width: 300px;
        height: 300px;
        border: 1px solid #000;
    }

    .news_content {
        width: 70%;
        height: 90%;
        border: 1px solid #000;
    }

</style>
<div class="admin-news-detail-bg">

    <div class="admin-news-detail-headline">
        <b>뉴스 > 상세보기</b>
    </div>

    <div class="admin-news-detail-main">
        <div class="news-title-area">
            <p id="news-title">뉴스</p>
            <hr class="title-line">
        </div>

        <div class="news-status">
            <h2> ${dto.news_title} </h2>
            <p class="date" style="margin-top: 30px"> ${dto.news_reg_date_sdf}</p>

        </div>
        <hr style="width: 80%; height: 1px; margin-left: 10%; background: lightgray">


        <div class="news-list-area">
            <div class="news-img">
                <img id="news-fileup-img" src="<c:url value="/img/news/" />${dto.news_img}" alt="">
            </div>
            <div class="news_content">
                ${dto.news_content}
            </div>
        </div>


        <div class="listlink">
            <a href="AdminNewsList">목록으로</a>
            <a href="AdminNewsModifyForm?id=${dto.news_id}">수정</a>
            <a href="AdminNewsDeleteReg?id=${dto.news_id}">삭제</a>

        </div>
    </div>
</div>
