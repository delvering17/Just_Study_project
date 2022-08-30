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
  .mypage-review-detail-bg{
    width: fit-content;
    height: fit-content;
  }

  .review-detail-form-items {
    display: flex;
  }

  .review-detail-form-items > p:nth-of-type(2n+1) {
    width: 100px;
    height: 40px;
    font-size: 1.2rem;
    line-height: 40px;
  }

  .review-detail-form-items > p:nth-of-type(2n) {
    width: 200px;
    height: 40px;
    margin-right: 20px;
    line-height: 40px;
  }
  .review-detail-form-items .btn-detail{
    width: 100px;
    height: 40px;
    border: 0;
    background: rgb(28, 63, 90);
    color: aliceblue;
  }

  #review-detail-confirm-wrapper {
    width: 400px;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: space-around;
  }

  #review-detail-confirm-wrapper > .btn-detail{
    width:150px;
  }

</style>

<%
  ReviewDTO reviewDTO = (ReviewDTO) request.getAttribute("reviewDTO");
%>

<div class="mypage-review-detail-bg">
  <h1>후기 조회</h1>
  <hr>
  <ul>
    <li class="review-detail-form-items">
      <p>작성자</p>
      <p>${reviewDTO.userNickname}</p>
    </li>
    <li class="review-detail-form-items">
      <p>지역</p>
      <p>${reservationDTO.city}</p>
      <p>지점명</p>
      <p>${reservationDTO.branch}</p>
    </li>
    <li class="review-detail-form-items">
      <p>룸타입</p>
      <p>${reservationDTO.room}</p>
    </li>
    <li class="review-detail-form-items">
      <p>이용일자</p>
      <p>${reservationDTO.useDate}</p>
      <p>시간</p>
      <p>${reservationDTO.time}</p>
    </li>
    <li class="review-detail-form-items">
      <p>별점</p>
      <p>
      <c:forEach var="i" begin="1" end="${reviewDTO.star}" step="1">
        <i class="fa-solid fa-star"></i>
      </c:forEach>
      <c:forEach var="i" begin="${reviewDTO.star}" end="4" step="1">
        <i class="fa-regular fa-star"></i>
      </c:forEach>
      </p>
    </li>
    <li class="review-detail-form-items">
      <p>내용</p>
      <p>${reviewDTO.content}</p>
    </li>
    <li class="review-detail-form-items">
      <p></p>
      <div id="review-detail-confirm-wrapper">
        <button type="button" class="btn-detail mypage-review-delete">후기 삭제</button>
        <button type="button" class="btn-detail mypage-review-list">이용 내역</button>
      </div>
    </li>
  </ul>
</div>

<script type="text/javascript">
  $(".mypage-review-list").click(function (){
    location.href = "MyReservationList?type=done&period=all"
  })

  $(".mypage-review-delete").click(function (){
    if(confirm("정말 삭제하시겠습니까?")){
      location.href = "MypageReviewDelete?reservId=${reviewDTO.reservId}"
    }
  })

</script>