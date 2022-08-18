<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    .community-list-area{
      width: 100%;
      height: 100%;

      display: flex;
    }

    .community-ul{
      width: 80%;
      height: 100%;
      margin: 0 auto;

      display: block;
      /* TODO 고쳐야함 리스트 가운데 정렬 */
    }

    .community-ul > li{
      width: 100px;
      height: 100px;
      margin: 10px;
      float: left;
      background: black;
      list-style: none;
    }

    .community-img{
      width: 350px;
      height: 450px;
      margin-left: 100px;
      margin-top: 50px;
      border: solid 1px lightgray;


    }
    .make-study-img{
      width: 100px;
      height: 100px;
      background: #ffa;
      margin: 0 auto;
      display: block;
    }

  </style>
</head>
<body>

<div class="community-list-area">
  <ul class="community-ul">
    <c:forEach items="${mainData}" var="dto" varStatus="no">
    <li>${dto.mstudy}
      <div class="community-img">
        <p style="margin-left: 30px; margin-top: 30px; font-weight: bold">강남점</p>
        <div class="make-study-img"></div>
        <p style="margin-top: 20px; text-align: center; font-weight: bold; font-size: 1.2rem">월화 같이 공부하실분</p>
        <hr style="width: 90%; height: 0.5px; margin-left: 5%; margin-top: 10%; background: lightgray">
          <%--                </div>--%>
          <%--                <div class="community-info">--%>
        <div class="community-text">
          <p>기타,영어,공부</p>
          <p>모집인원: </p> <p>5명</p>
        </div>
          <%--<hr>--%>
        <div class="ing">
          <p>신청하기</p>
        </div>

      </div>
        <%--                </div>--%>
    </li>
    </c:forEach>
  </ul>
</div>

</body>
</html>
