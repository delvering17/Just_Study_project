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
        height: 100%;
        /*border: solid 1px #000;*/

    }

    .event-title-area{
        width: 100%;
        height: 150px;
        /*border: solid 1px #000;*/
        text-align: center;
        padding-top: 60px;
        margin-top: 60px;

    }
    #event-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .event-list-area{
        width: 100%;
        height: 100%;
        /*background: #ffa;*/
        display: flex;
    }

    .event-ul{
        width: 80%;
        height: 100%;
        margin-left: 180px;
        /*border: solid 1px #000;*/
        display: block;
        padding-left: 300px;    /* TODO 고쳐야함 리스트 가운데 정렬 */
    }

    .event-ul > li{
        /*width: 100px;*/
        /*height: 100px;*/
        margin: 10px;
        float: left;
        /*background: black;*/
        list-style: none;
    }

    .event-img{
        width: 300px;
        height: 300px;
        border: solid 1px #000;
        background-image: url("<%=request.getContextPath()%>/img/event/event_poster.png");

    }

    .event-info{
        width: 300px;
        height: 150px;
        border: solid 1px #000;

    }

    .event-info-btn{
        float: right;
        margin: 5px;

    }

    .event-text{
        width: 300px;
        height: 75px;
        /*border: solid 1px #000;*/

    }
    .ing{
        width: 60px;
        height: 30px;
        float: right;
        margin: 10px;
        padding-top: 3px;
        border: solid 1px #000;
        text-align: center;
    }

    .event-status{
        width: 100%;
        height: 150px;
        /*border: solid 1px #000;*/
        padding-left: 38%;

    }

    .event-status > div{
        width: 150px;
        height: 70px;
        background: white;
        border: solid 0.5px lightgray;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }
    .admin-write{
        width: 100px;
        height: 50px;
        border: 1px solid #000;
    }
    .tabmenu li.on a{
        background:#001f2e;
        font-family:'NotoSansKR-Bold';
        color:#fff;
        border-color:#001f2e
    } /*메뉴 버튼 3개 클릭 시 변경*/
</style>

<div class="main">

    <div class="event-title-area">
        <p id="event-title">이벤트</p>
    </div>

    <div class="event-status">
        <ul class="tabmenu">
            <li class="on"><a href="#none" data-filter=".filter-active" data-sca="" >전체</a></li>
            <li class=""><a href="#none" data-filter=".filter-ing" data-sca="ing" >진행중</a></li><%--진행중--%>
            <li class=""><a href="#none" data-filter=".filter-close" data-sca="close" >마감</a></li><%--마감--%>


        </ul>
        <%--<div>전체</div>
        <div>진행중</div>
        <div>마감</div>--%>
    </div>


    <div class="event-list-area">


        <ul class="event-ul">
            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>

            <c:forEach items="${mainData}" var="dto" varStatus="no">
                <c:choose>
                    <c:when test="${today < dto.event_enddate}">

                <li class="event-li filter-active filter-ing">${dto.id}
                    <div class="event-img">
                        이벤트 이미지
                    </div>
                    <div class="event-info">
                        <div class="event-text">
                           <a href="EventDetail?id=${dto.id}" style="width: 50px; height: 50px; border: 1px solid #000" ><i class="fa-solid fa-bars"></i></a>
                            <%--<button class="event-info-btn"></button>--%>
                            <p>${dto.title}</p>
                        </div>
                        <hr>
                        <div class="event-date">
                            <p>${dto.event_startdate} ~ ${dto.event_enddate}</p>
                            <div class="ing">
                                <p>상시 <a href="EventDetail?id=${dto.id}" /></p>
                            </div>
                        </div>
                    </div>
                </li>
                    </c:when>
                    <c:otherwise>
                        <li class="event-li filter-active filter-close">${dto.id}
                            <div class="event-img">
                                이벤트 이미지
                            </div>
                            <div class="event-info">
                                <div class="event-text">
                                    <a d="close-event" href="#" style="width: 50px; height: 50px; border: 1px solid #000" ><i class="fa-solid fa-bars"></i></a>
                                        <%--<button class="event-info-btn"></button>--%>
                                    <p>${dto.title}</p>
                                </div>
                                <hr>
                                <div class="event-date">
                                    <p>${dto.event_startdate} ~ ${dto.event_enddate}</p>
                                    <div class="ing">
                                        <p>이벤트마감</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </div>

    <div class="admin-write">
        <a href="EventInsertForm" style=" background: #ffa; ">새 글쓰기</a>
    </div>

</div>

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script>
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
