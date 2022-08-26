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

   .notice-ul{
       width: 80%;
       margin: 0 auto;
       border: 1px solid #000;
   }

   .notice-li{
        width: 80%;
       height: 50px;
   }
   .notice-num{
       width: 100px;
       height: 50px;
       border: 1px solid #000;
       float: left;
   }
   .notice-title{
       width: 300px;
       height: 50px;
       border: 1px solid #000;
       float: left
   }
   .notice-date{
       width: 100px;
       height: 50px;
       border: 1px solid #000;
       float: left
   }

</style>

<div class="main">

    <div class="notice-title-area">
        <p id="notice-title">공지사항</p>
    </div>
    <div class="notice-area">
        <div class="notice-subject" style="width: 80%; margin: 0 auto; background: #ffa"></div>
        <ul class="notice-ul">
            <c:forEach items="${mainData}" var="dto" varStatus="no">
                <li class="notice-li"><a href="NoticeDetail?id=${dto.id}" />
                    <div class="notice-num">
                        <p>${dto.id}</p>
                    </div>
                    <div class="notice-title">
                        <p>${dto.title}</p>
                    </div>
                    <div class="notice-date">
                        ${dto.reg_date_sdf}
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>
