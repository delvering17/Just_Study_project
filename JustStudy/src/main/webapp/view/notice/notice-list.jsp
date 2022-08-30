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

    .notice-title-area{
        width: 1100px;
        height: 200px;
        text-align: center;
        padding-top: 100px;
        margin: 0 auto;
    }
    #notice-title{
        font-weight: bold;
        text-align: center;
    }
    .title-line {
        width: 1100px;
        height: 3px;
        margin: 10px auto;
        background: black;

    }

    .notice-area{
        width: 1100px;
        margin: 0px auto;
        padding-bottom: 100px;

    }


   table{
       width: 1100px;

   }

   #list > th:nth-of-type(1){
       width: 800px;
       height: 70px;
       text-align: center;
       font-size: 1.7rem;
   }
   #list > th:nth-of-type(2){
       width: 300px;
       height: 70px;
       text-align: center;
       font-size: 1.7rem;
   }
/*    #list > th:nth-of-type(3){
        width: 250px;
        height: 70px;
        text-align: center;
        font-size: 1.7rem;
    }*/

    #info > td:nth-of-type(1){
        width: 900px;
        height: 70px;
        border: 3px solid #d4d2d2;
        border-left: none;
        border-right: none;
        text-align: center;
    }
    #info > td:nth-of-type(2){
        width: 200px;
        height: 70px;
        border: 3px solid #d4d2d2;
        border-left: none;
        border-right: none;
        text-align: center;
    }
/*    #info > td:nth-of-type(3){
        width: 250px;
        height: 70px;
        border: 2px solid #d4d2d2;
        border-left: none;
        border-right: none;
        text-align: center;
    }*/
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

</style>

<div class="main">

    <div class="notice-title-area">
        <h1 id="notice-title">공지사항</h1>
    </div>
    <hr class="title-line">

    <div class="notice-area">
      <%--  <div class="notice-subject" style="width: 80%; margin: 0 auto; background: #ffa"></div>--%>
        <table >

            <tr id="list">
                <th>제목</th>
                <th>등록일</th>
            </tr>
            <c:forEach items="${mainData}" var="dto" varStatus="no">
            <tr id="info">
                <td><a href="NoticeDetail?id=${dto.id}" /><p>${dto.title}</p></td>
                <td>${dto.reg_date_sdf}</td>
            </tr>
            </c:forEach>
        </table>

<%--        <ul class="notice-ul">
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
        </ul>--%>
    </div>

</div>
