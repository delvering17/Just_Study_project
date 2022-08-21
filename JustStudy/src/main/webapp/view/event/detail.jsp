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
<%
   EventDTO dto = new EventDTO();
%>

<style>

    .event-title-area{
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin: 0 auto;
        background: black;
    }

    #event-title{
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


    .event-title-area{
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/

        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin-left: 10%;
        background: black;
    }

    #event-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .event-list-area{
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



    .event-status{
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
    #event-img{
        width: 300px;
        height: 300px;
        border: 1px solid #000;
    }
    #event-content{
        width: 70%;
        height: 90%;
        border: 1px solid #000;
    }


</style>


<%--<div class="header"></div>--%>


<%--<div style="text-align: center">
    <a style="background: #ffa" href="CommunityModifyForm?id=${dto.id }">수정</a>
    <a style="background: #ffa" href="CommunityDeleteForm?id=${dto.id }">삭제</a>
</div>--%>

<div class="event-title-area">
    <p id="event-title">이벤트</p>
    <hr class="title-line">
</div>

<div class="event-status">
    <h2> ${dto.title} </h2>
   <p class="date" style="margin-top: 30px"> ${dto.event_startdate_sdf}~${dto.event_enddate_sdf}</p>

</div>
<hr style="width: 80%; height: 1px; margin-left: 10%; background: lightgray">


<div class="event-list-area">
    <div id="event-img">
        <img id="event-fileup-img" src="<c:url value="/img/event/" />${dto.img}" alt="">
    </div>
    <div id="event-content">
        ${dto.content}
    </div>

</div>


<div class="listlink">
    <a href="EventPage">목록으로</a>
    <a href="EventModifyForm?id=${dto.id }">수정</a>
    <a href="EventDeleteForm?id=${dto.id }">삭제</a>
</div>
    </tr>
</table>




