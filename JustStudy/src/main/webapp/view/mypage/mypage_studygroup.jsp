<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ApplyStudyDTO" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-19
  Time: 오전 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

  .mypage-studygroup-bg {
    width: 800px;
    background: #F5F5F5;

  }

  .mypage-studygroup-top {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
    font-size: 1rem;
  }

  .mypage-studygroup-top > p {
    /* font-size: 1.2rem; */
    width: 20px;
    font-size: 1.2rem;
    vertical-align: middle;
    margin-block-start: 1em;
  }

  .top-dateselect-wrapper {
    width: 300px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }

  .mypage-studygroup-period {
    width: 60px;
    height: 40px;
    border: 1px solid #a9a8a8;
    background: rgba(0, 0, 0, 0);
    text-align: center;
    line-height: 40px;
  }

  input[name=period]:checked + .mypage-studygroup-period {
    background: lightgray;
  }

  .mypage-studygroup-top-datepicker {
    width: 150px;
    height: 40px;
  }

  #submit-find {
    background: rgb(28, 63, 90);
    color: aliceblue;
  }

  .mypage-studygroup-main {
    width: 100%;
  }

  .mypage-studygroup-menu{
    width: 800px;
    height: 50px;
    margin-top: 20px;
  }

  .mypage-studygroup-menu > label > p {
    width: fit-content;
    height: fit-content;
    line-height: 50px;
    margin-left: 10px;
    margin-right: 20px;
    float: left;
    font-size: 1.2rem;
    color: gray;
  }

  input[name=mypage-studygroup-type]:checked + label > p{
    font-weight: bold;
    color: black;
  }

  .mypage-studygroup-table {
    width: 800px;
    margin-top: 20px;
    margin-bottom: 30px;
    table-layout: fixed;
    word-break: break-all;
    border-top: 1px solid black;
  }

  .mypage-studygroup-table > tbody > tr > td {
    height: 60px;
    padding: 10px 0px 10px 0px;
    text-align: center;
  }

  .mypage-studygroup-table > tbody > tr:nth-of-type(1){
    font-weight: bold;
  }

  .mypage-studygroup-table > tbody > tr{
    border-bottom: 1px solid lightgray;
  }

  .mypage-studygroup-table td:nth-of-type(1){
    width: 3%;
  }

  .mypage-studygroup-table td:nth-of-type(2){
    width: 19%;
  }

  .mypage-studygroup-table td:nth-of-type(3),
  .mypage-studygroup-table td:nth-of-type(4),
  .mypage-studygroup-table td:nth-of-type(5),
  .mypage-studygroup-table td:nth-of-type(6),
  .mypage-studygroup-table td:nth-of-type(7) {
    width: 12%;
  }

  .mypage-studygroup-table td:nth-of-type(8),
  .mypage-studygroup-table td:nth-of-type(9){
    width: 9%;
  }

</style>

<script type="text/javascript">
  window.onload = function (){
    $("#submit-find").click(function (){

      let start = new Date();
      let endDate = new Date();

      switch ($("input[name=period]:checked").attr("id")){
        case "all":
          start = null;
          break;
        case "today":
          start = new Date();
          break;
        case "sevenDays":
          start.setDate(new Date().getDate() - 6)
          break;
        case "oneMonth":
          start.setMonth(new Date().getMonth() - 1)
          start.setDate(new Date().getDate() + 1)
          break;
        case "threeMonths":
          start.setMonth(new Date().getMonth() - 3)
          start.setDate(new Date().getDate() + 1)
          break;
        case "mypick":
          const startPick = $(".mypage-studygroup-top-datepicker:first-of-type").val()
          start = new Date(startPick.split("-")[0], parseInt(startPick.split("-")[1]) - 1, parseInt(startPick.split("-")[2]))

          const endPick = $(".mypage-studygroup-top-datepicker:last-of-type").val()
          endDate = new Date(endPick.split("-")[0], parseInt(endPick.split("-")[1]) - 1, parseInt(endPick.split("-")[2]))

          break;
      }

    })

    $(".mypage-studygroup-top-datepicker").change(function (){
      $("input[id=mypick]").attr('checked', true);
    })

    $("input[name=mypage-studygroup-type]").each(function (key, value){
      if(value.getAttribute("id") == "${param.type}"){
        value.setAttribute("checked", true);
      }
    })

    $("input[name=mypage-studygroup-type]").change(function (){
      location.href = "MypageStudygroup?type="+$("input[name=mypage-studygroup-type]:checked").attr("id")
    })


  }
</script>

<div class="mypage-studygroup-bg">
  <div class="mypage-studygroup-top">
    <div class="top-dateselect-wrapper">
      <label for="all"><input type="radio" name="period" id="all" checked hidden>
        <div class="mypage-studygroup-period">전체</div>
      </label>
      <label for="today"><input type="radio" name="period" id="today" hidden>
        <div class="mypage-studygroup-period">오늘</div>
      </label>
      <label for="sevenDays"><input type="radio" name="period" id="sevenDays" hidden>
        <div class="mypage-studygroup-period">7일</div>
      </label>
      <label for="oneMonth"><input type="radio" name="period" id="oneMonth" hidden>
        <div class="mypage-studygroup-period">1개월</div>
      </label>
      <label for="threeMonths"><input type="radio" name="period" id="threeMonths" hidden>
        <div class="mypage-studygroup-period">3개월</div>
      </label>
    </div>

    <input class="mypage-studygroup-top-datepicker" type="date">
    <p>&#126;</p>
    <input class="mypage-studygroup-top-datepicker" type="date">
    <button type="submit" class="mypage-studygroup-period" id="submit-find">조회</button>

  </div>
  <label for="threeMonths"><input type="radio" name="period" id="mypick" hidden></label>

  <div class="mypage-studygroup-main">

    <div class="mypage-studygroup-menu">
      <input type="radio" name="mypage-studygroup-type" id="maked" hidden><label for="maked"><p>커뮤니티 개설내역</p></label>
      <input type="radio" name="mypage-studygroup-type" id="apply" hidden><label for="apply"><p>커뮤니티 신청내역</p></label>
    </div>

    <table class="mypage-studygroup-table">
      <tr>
        <td>ID</td>
        <td>제목</td>
        <td>등록일자</td>
        <td>지점</td>
        <td>시작일</td>
        <td>종료일</td>
        <td>모집인원</td>
        <td>구분</td>
        <td>상태</td>
      </tr>

      <c:forEach items="${studygroupList}" var="studygroup" varStatus="no">
        <form action="<c:url value="/community/CommunityApplyDetail"/>" class="mypage-studygroup-review-form">
          <input type="hidden" name="as_id" value="${myApplyList[no.index].as_id}">
          <tr>
            <td>${studygroup.id}</td>
            <td><a href="<c:url value="/community/CommunityDetail?id=${studygroup.id}"/>">${studygroup.title}</a></td>
            <td>${studygroup.regDate}</td>
            <td>${studygroup.location}</td>
            <td>${studygroup.startdate}</td>
            <td>${studygroup.enddate}</td>
            <td>${studygroup.people}</td>
            <td>${studygroup.studykind}</td>
            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:formatDate var = "today" value="${now}" pattern="yyyy-MM-dd"/>
            <c:choose>
              <c:when test="${param.type == 'maked'}">
                <c:choose>
                  <c:when test="${today < communityDTO.enddate}">
                    <td>모집중</td>
                  </c:when>
                  <c:otherwise>
                    <td>모집완료</td>
                  </c:otherwise>
                </c:choose>
              </c:when>
              <c:when test="${param.type == 'apply'}">
                <c:choose>
                  <c:when test="${myApplyList[no.index].as_state == 1}">
                    <td>
                      <input type="submit" value="대기중"/>
                    </td>
                  </c:when>
                  <c:when test="${myApplyList[no.index].as_state == 2}">
                    <td>
                      <input type="submit" value="승인"/>
                    </td>
                  </c:when>
                  <c:when test="${myApplyList[no.index].as_state == 3}">
                    <td>
                      <input type="submit" value="반려"/>
                    </td>
                  </c:when>
                </c:choose>
              </c:when>
            </c:choose>
          </tr>
        </form>
      </c:forEach>
    </table>
  </div>

</div>
