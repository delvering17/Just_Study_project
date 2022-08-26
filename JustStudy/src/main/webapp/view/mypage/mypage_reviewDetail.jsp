<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model_p.MemberDTO" %>
<%@ page import="model_p.ReviewDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .mypage-review-detail-bg .mypage-review-detail-table td {
    width: fit-content;
    height: fit-content;
  }

</style>

<%
  ReviewDTO reviewDTO = (ReviewDTO) request.getAttribute("reviewDTO");
%>

<div class="mypage-review-detail-bg">
    <table class="mypage-review-detail-table" border="">
      <tr>
        <td>작성자</td>
        <td>
          <%=reviewDTO.getUserNickname()%>
        </td>
      </tr>
      <tr>
        <td>지역</td>
        <td>${reservationDTO.city}
        </td>
      </tr>
      <tr>
        <td>지점</td>
        <td>${reservationDTO.branch}
        </td>
      </tr>
      <tr>
        <td>룸타입</td>
        <td>${reservationDTO.room}
        </td>
      </tr>
      <tr>
        <td>이용일자</td>
        <td>${reservationDTO.useDate}
        </td>
      </tr>
      <tr>
        <td>시간</td>
        <td>${reservationDTO.time}
        </td>
      </tr>
      <tr>
      <tr>
        <td>작성일자</td>
        <td><%=reviewDTO.getReviewDate()%>
        </td>
      </tr>
      <tr>
        <td>별점</td>
        <td>
          <c:forEach var="i" begin="1" end="${reviewDTO.star}" step="1">
            <i class="fa-solid fa-star"></i>
          </c:forEach>
          <c:forEach var="i" begin="${reviewDTO.star}" end="4" step="1">
            <i class="fa-regular fa-star"></i>
          </c:forEach>
        </td>
      </tr>
      <tr>
        <td>내용</td>
        <td>
          <%=reviewDTO.getContent()%>
        </td>
      </tr>
      <tr>
        <td>
          <a href="MyReservationList?type=done&period=all">목록으로</a>
          <a href="MypageReviewDelete?reservId=<%=reviewDTO.getReservId()%>">삭제</a>
        </td>
      </tr>
    </table>
</div>