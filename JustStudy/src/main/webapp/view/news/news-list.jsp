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
    }

    .news-title-area{
        width: 1100px;
        height: 200px;
        text-align: center;
        padding-top: 60px;
        margin: 0 auto;
    }
    #news-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .news-list-area{
        width: 1400px;
       margin: 0 auto;
        display: flex;
    }

    .news-ul{
        width: 1300px;
        margin: 0 auto;
        padding-left: 170px;
        display: block;
        list-style: none;

    }

    .news-ul > li{
        margin: 10px;
        float: left;
        list-style: none;
    }

    .news-img{
        width: 300px;
        height: 300px;

    }
    .news-img img{
        width: 300px;
        height: 300px;
        margin: 0 auto;
        border-radius: 7px;
    }

    .news-info{
        width: 300px;
        height: 150px;


    }

    .news-text{
        width: 300px;
        height: 75px;
        /*border: solid 1px #000;*/

    }
    .news-text >p{
        font-weight: bold;
    }
    .news-date >p{
        text-align: center;
    }


    .news-status > div{
        width: 150px;
        height: 70px;
        background: white;
        border: solid 0.5px lightgray;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }
    a{
        text-decoration: none;
    }
    a:link{
        color: black;
    }
    a:visited{
        color: black;
    }
    a:hover{
        color: purple;
    }
    a:active{
        color: black;
    }

    .tabmenu li.on a{
        background:#001f2e;
        font-family:'NotoSansKR-Bold';
        color:#fff;
        border-color:#001f2e
    } /*메뉴 버튼 3개 클릭 시 변경*/
</style>

<div class="main">

    <div class="news-title-area">
        <p id="news-title">뉴스</p>
    </div>

    <div class="news-list-area">


        <ul class="news-ul">
            <c:forEach items="${mainData}" var="dto" varStatus="no">

                        <li class="news-li filter-active filter-ing" value="${dto.news_id}">
                            <div class="news-img">
                                <a href="NewsDetail?id=${dto.news_id}"><img src="<c:url value="/img/news/${dto.news_thumbnail_img}"/>" alt=""/></a>
                            </div>
                            <div class="news-info">
                                <div class="news-text">
                                    <a href="NewsDetail?id=${dto.news_id}"><p>${dto.news_title}</p></a>
                                </div>
                                <hr>
                                <div class="news-date">
                                    <p>${dto.news_reg_date_sdf}</p>
                                </div>
                            </div>
                        </li>
            </c:forEach>
        </ul>
    </div>


</div>
