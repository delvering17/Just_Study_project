<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .main{
        width: 100%;

        border: solid 1px #000;

    }

    .notice-title-area{
        width: 100%;
        height: 200px;
        border: solid 1px #000;
        text-align: center;
        padding-top: 60px;
        margin-top: 60px;

    }
    #notice-title{
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


    }

    .event-info{
        width: 300px;
        height: 150px;
        border: solid 1px #000;

    }

    .event-text{
        width: 300px;
        height: 75px;
        /*border: solid 1px #000;*/

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

    .tabmenu li.on a{
        background:#001f2e;
        font-family:'NotoSansKR-Bold';
        color:#fff;
        border-color:#001f2e
    } /*메뉴 버튼 3개 클릭 시 변경*/
</style>

<div class="main">

    <div class="notice-title-area">
        <p id="notice-title">뉴스</p>
        <a href="NewsInsertForm" style="align-items: center">글쓰기</a>
    </div>

    <div class="event-list-area">


        <ul class="event-ul">
            <c:forEach items="${mainData}" var="dto" varStatus="no">

                        <li class="event-li filter-active filter-ing">${dto.news_id}
                            <div class="event-img">
                                <img src="<c:url value="/img/news/${dto.news_img}"/>" alt="">
                            </div>
                            <div class="event-info">
                                <div class="event-text">
                                    <a href="NewsDetail?id=${dto.news_id}" style="width: 50px; height: 50px; border: 1px solid #000" ><i class="fa-solid fa-bars"></i></a>
                                    <p>${dto.news_title}</p>
                                </div>
                                <hr>
                                <div class="event-date">
                                    <p>${dto.news_reg_date_sdf}</p>
                                </div>
                            </div>
                        </li>
            </c:forEach>
        </ul>
    </div>


   <%-- <div class="notice-area">

        <div class="notice-subject" style="width: 80%; margin: 0 auto; background: #ffa"></div>
        <ul class="notice-ul">
            <c:forEach items="${mainData}" var="dto" varStatus="no">
                <li class="notice-li">${dto.id}
                    <div class="notice-num">
                        <p>${dto.id}</p>
                    </div>
                    <div class="notice-title">
                        <p>${dto.title}<a href="NewsDetail?id=${dto.id}" /></p>
                    </div>
                    <div class="notice-date">
                        <p>${dto.reg_date}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>

    </div>--%>


</div>
