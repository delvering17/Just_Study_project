<%@ page import="model_p.MemberDTO" %>
<%@ page import="model_p.ReviewDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
          <%=reviewDTO.getMemId()%>
        </td>
      </tr>
      <tr>
        <td>주문번호</td>
        <td><%=reviewDTO.getReservId()%>
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
          <%=reviewDTO.getStar()%>
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
          <a href="MyReservationList">목록으로</a>
          <a href="MypageReviewDelete?reservId=<%=reviewDTO.getReservId()%>">삭제</a>
        </td>
      </tr>
    </table>
</div>