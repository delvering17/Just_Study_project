<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-19
  Time: 오후 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .main{
        width: 100%;
    }

    .event-title-area{
        width: 1100px;
        height: 200px;
        text-align: center;
        padding-top: 100px;
        margin: 0 auto;
    }
    #event-title{

        font-weight: bold;
        text-align: center;
    }

    .event-list-area{
        width: 1400px;
        margin: 0 auto;
        display: flex;
    }

    .event-ul{
        width: 1300px;
        margin: 0 auto;
        height: 100%;
        padding-left: 170px;
        display: block;
        list-style: none;

    }

    .event-ul > li{
        margin: 10px;
        float: left;
        list-style: none;
    }

    .event-img{
        width: 300px;
        height: 300px;

    }
    .event-img img{
        width: 300px;
        height: 300px;
        margin: 0 auto;
        border-radius: 7px;
    }

    .event-info{
        width: 300px;
        height: 200px;


    }

    .event-text{
        width: 300px;
        height: 50px;
        /*border: solid 1px #000;*/
        text-align: center;

    }
    .event-text >p{
        font-weight: bold;
    }
    .event-date p{
        text-align: center;
    }


    .event-status > div{
        width: 150px;
        height: 70px;
        background: white;
        border: solid 1px lightgray;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }

    .main a{
        text-decoration: none;
    }

    .main a:link{
        color: black;
    }

    .main a:visited {
        color: black;
    }

    .main a:hover{
        color: purple;
    }

    .main a:active{
        color: black;
    }

    .tabmenu {
        width: 600px;
        list-style: none;
        font-size: 1.5rem;
        display: flex;
        flex-direction: row;
        margin: 60px auto;

    }

    .tabmenu > li {
        width: 200px;
        height: 70px;
        border: 1px solid #aaa;
        border-radius: 7px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #bbbbbb;

    }

    .tabmenu li.on {
        /*background:#001f2e;*/
        font-family:'NotoSansKR-Bold';
        /*color:#fff;*/
        border-color:#001f2e;
        font-weight: 600;
    } /*메뉴 버튼 3개 클릭 시 변경*/



</style>

<div class="main">

    <div class="event-title-area">
        <h1 id="event-title">이벤트</h1>
    </div>
    <div class="event-status">
        <ul class="tabmenu">
            <li class="on"><a href="#none" data-filter=".filter-active" data-sca="" >전체</a></li>
            <li class=""><a href="#none" data-filter=".filter-ing" data-sca="ing" >진행중</a></li><%--진행중--%>
            <li class=""><a href="#none" data-filter=".filter-close" data-sca="close" >마감</a></li><%--마감--%>
        </ul>
    </div>
    <div class="event-list-area">
        <ul class="event-ul">
            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>

            <c:forEach items="${mainData}" var="dto" varStatus="no">
                <c:choose>
                    <c:when test="${today < dto.event_enddate}">
                        <li class="event-li filter-active filter-ing" value="${dto.id}">
                            <div class="event-img">
                                <a href="EventDetail?id=${dto.id}"><img src="<c:url value="/img/event/${dto.img}"/>" alt=""></a>
                            </div>
                            <div class="event-info">
                                <div class="event-text">
                                    <a href="EventDetail?id=${dto.id}"><p>${dto.title}</p></a>
                                </div>
                                <hr>
                                <div class="ing">

                                </div>
                                <div class="event-date">
                                    <p>이벤트 진행중 <a href="EventDetail?id=${dto.id}" /></p>
                                    <p>${dto.event_startdate_sdf} ~ ${dto.event_enddate_sdf}</p>
                                </div>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="event-li filter-active filter-close" value="${dto.id}">
                            <div class="event-img">
                                <a href="EventDetail?id=${dto.id}"><img src="<c:url value="/img/event/${dto.img}"/>" alt=""></a>
                            </div>
                            <div class="event-info">
                                <div class="event-text">
                                    <a href="EventDetail?id=${dto.id}"><p>${dto.title}</p></a>
                                </div>
                                <hr>
                                <div class="ing">

                                </div>
                                <div class="event-date">
                                    <p>이벤트마감</p>
                                    <p>${dto.event_startdate_sdf} ~ ${dto.event_enddate_sdf}</p>

                                </div>
                            </div>
                        </li>
                </c:otherwise>

            </c:choose>
        </c:forEach>
        </ul>
    </div>
</div>

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script type="text/javascript">
    $(document).ready( function() {

        $('.event-ul').isotope({
            itemSelector: '.event-li',
        });

// filter items on button click
        $('.tabmenu').on( 'click', 'li', function() {
            var filterValue = $(this).children().attr('data-filter');
            $('.event-ul').isotope({ filter: filterValue });
            $('.tabmenu > li').removeClass('on');
            $(this).addClass('on');
        });
    })

</script>