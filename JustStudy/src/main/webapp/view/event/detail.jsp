<%@ page import="model_p.EventDTO" %><%--
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
    .event-detail-wrapper {

    }

    .event-title-area{
        width: 1100px;
        height: 200px;
        padding-top: 100px;
        margin: 0 auto;

    }

    .event-line{
        width: 1100px;
        height: 3px;
        margin: 10px auto;
        background: black;
    }
    .event-under-line{
        width: 1100px;
        height: 1px;
        margin: 0 auto;
        background: lightgray;
    }

    #event-title{

        font-weight: bold;
        text-align: center;
    }
    .btn-wrapper {
        width: 100%;
        height: 100px;
    }
    .listlink{
        width: 100px;
        height: 40px;
        margin: 40px auto;
        border: 1px solid #000;
        border-radius: 7px;
        display: flex;
        flex-direction: row;

    }

    .listlink > a {
        width: 120px;
        justify-content: center;
        text-align: center;
        margin: auto 0;
        color: black;
        text-decoration: none;
    }

    .event-ul > li{
        /*width: 100px;*/
        /*height: 100px;*/
        margin: 10px;
        float: left;
        /*background: black;*/
        list-style: none;
    }



    .event-status{
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

    #event-img{
        width: 600px;
        margin: 0 auto;

    }

    #event-img>img{
        width: 100%;
        margin: 0 auto;
    }

</style>
<div class="event-detail-wrapper">
    <div class="event-title-area">
        <h1 id="event-title">이벤트</h1>
        <hr class="event-line">
    </div>

    <div class="event-status">
        <h2> ${dto.title} </h2>
        <p class="date" style="margin-top: 30px">${dto.event_startdate_sdf}~${dto.event_enddate_sdf}</p>

    </div>
    <hr class="event-under-line">

    <div id="event-img">
        <img id="event-fileup-img"   src="<c:url value="/img/event/" />${dto.content}" alt="">
    </div>
    <div class="btn-wrapper">
        <div class="listlink">
            <a href="EventPage">목록으로</a>
        </div>
    </div>
</div>
