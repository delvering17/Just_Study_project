<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ReviewDTO" %>
<%@ page import="model_p.ReservationDTO" %>
<%@ page import="model_p.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<script type="text/javascript">
  if(<%=((ArrayList<ArrayList>) request.getAttribute("totalList")).size() == 0%>){
    alert("조회 내역이 없습니다.")
    location.href = "AdminStoreReview"
  }
</script>

<style>
  .admin-store-review-headline {
    width: 1330px;
    height: 40px;
    background: #fff;
    border-bottom: 1px solid rgb(184, 177, 177);
    padding-top: 15px;
    padding-left: 20px;
    margin-top: 50px;
    margin-left: 239px;
    position: fixed;
    flex-direction: row;
  }

  .admin-store-review-headline > b {
    width: 100px;
    font-size: 20px;
  }

  .admin-store-review-main{
    width: 2000px;
    height: fit-content;
    margin: 0px 0px 0px 220px;
    padding: 120px 20px 20px 40px;
  }

  .admin-store-review-table {
    width: 60%;
    border: 1px solid rgb(122, 115, 115);
    margin-top: 10px;
    table-layout: fixed;
    word-break: break-all;
  }

  .admin-store-review-table th {
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  .admin-store-review-table tr:first-of-type{
    height: 50px;
    padding: 10px;
    color: white;
    background: rgba(83, 104, 167, 0.856);
  }

  .admin-store-review-table th:nth-of-type(1),
  .admin-store-review-table th:nth-of-type(2){
    width: 5%;
  }

  .admin-store-review-table th:nth-of-type(3),
  .admin-store-review-table th:nth-of-type(11){
    width: 17%;
  }

  .admin-store-review-table th:nth-of-type(4),
  .admin-store-review-table th:nth-of-type(5),
  .admin-store-review-table th:nth-of-type(6),
  .admin-store-review-table th:nth-of-type(7),
  .admin-store-review-table th:nth-of-type(8),
  .admin-store-review-table th:nth-of-type(9),
  .admin-store-review-table th:nth-of-type(10){
    width: 8%;
  }



  .admin-store-review-table td {
    border: 1px solid rgb(97, 88, 88);
    text-align: center;
    font-size: 13px;
    height: 30px;
    padding: 5px 5px 5px 5px;
  }

</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<ArrayList> totalList = (ArrayList<ArrayList>) request.getAttribute("totalList");%>

<div class="admin-store-review-bg">
  <div class="admin-store-review-headline">
    <b>이용 후기</b>
  </div>

  <div class="admin-store-review-main">

    <div>
      <form action="AdminStoreReview" class="admin-store-review-search-form">
        <select name="filter">
          <option value="orderId">주문번호</option>
          <option value="mem_userId">사용자ID</option>
          <option value="mem_realname">사용자이름</option>
          <option value="city">지역</option>
          <option value="branch">지점명</option>
          <option value="useDate">이용일자</option>
          <option value="content">내용</option>
        </select>
        <input type="text" name="word">
        <button type="button" class="admin-store-review-search"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-review-table">
      <tr>
        <th>ID</th>
        <th>예약ID</th>
        <th>주문번호</th>
        <th>사용자ID</th>
        <th>사용자이름</th>
        <th>지역</th>
        <th>지점</th>
        <th>룸타입</th>
        <th>이용일자</th>
        <th>시간</th>
        <th>내용</th>
      </tr>

      <%
        for(ArrayList review : totalList){%>
          <tr>
            <td><%=((ReviewDTO)review.get(0)).getId()%></td>
            <td><%=((ReviewDTO)review.get(0)).getReservId()%></td>
            <td><%=((ReservationDTO)review.get(2)).getOrderId()%></td>
            <td><%=((MemberDTO)review.get(1)).getMem_userid()%></td>
            <td><%=((MemberDTO)review.get(1)).getMem_realname()%></td>
            <td><%=((ReservationDTO)review.get(2)).getCity()%></td>
            <td><%=((ReservationDTO)review.get(2)).getBranch()%></td>
            <td><%=((ReservationDTO)review.get(2)).getRoom()%></td>
            <td><%=((ReservationDTO)review.get(2)).getUseDate()%></td>
            <td><%=((ReservationDTO)review.get(2)).getTime()%></td>
            <td><%=((ReviewDTO)review.get(0)).getContent()%></td>
          </tr>
      <%}%>
    </table>
  </div>
</div>

<script type="text/javascript">
  $(".admin-store-review-search").click(function (){
    if($("input[name=word]").val().trim()==""){
      alert("검색어를 입력해주세요.")
    } else{
      $(".admin-store-review-search-form").submit()
    }
  })
</script>