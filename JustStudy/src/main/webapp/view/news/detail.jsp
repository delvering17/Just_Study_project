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
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .news-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin: 0 auto;
        background: black;
    }

    #news-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink{
        width: 80%;
        height: 100px;
        margin: 0 auto;
        text-align: center;
        border: 1px solid #000;
    }


    .news-title-area{
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/

        padding-top: 60px;
        margin-top: 60px;
    }

    .news-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin-left: 10%;
        background: black;
    }

    #news-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .news-list-area{
        width: 80%;
        height: 100%;
        background: #ffa;
        display: flex;
        margin-left: 10%;
        margin-top: 50px;
        margin-bottom: 2%;
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
        width: 80%;
        height: 150px;
        padding: 35px 80px;
        position: relative;
        text-align: center;
        margin-left: 10%;

    }

    .event-status > div{
        width: 150px;
        height: 70px;
        background: aqua;
        border: solid 1px #000;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }



    textarea{
        font-size: 1rem;
        outline: none;
        /*vertical-align: middle;*/
    }

    #news-img{
        width: 300px;
        height: 300px;
        border: 1px solid #000;
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
<hr style="width: 80%; height: 1px; margin-left: 10%; background: lightgray">

<div id="news-img">
    <img id="news-fileup-img" src="<c:url value="/img/news/" />${dto.news_img}" alt="">
</div>

<div class="news-list-area">
<%--    <div class="event-upload-img">  TODO 이미지 파일 업로드 되는 위치
        <img style="width: 100%" src="<%=request.getContextPath()%>/img/background.jpeg">
    </div>--%>
    ${dto.news_content}
</div>


<div class="listlink">
    <a href="NewsPage">목록으로</a>
    <a href="NewsModifyForm?id=${dto.news_id }">수정</a>
    <a href="NewsDeleteForm?id=${dto.news_id }">삭제</a>
</div>

