<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="model_p.AdminReservDTO" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

  $("#r3").attr("checked", true)

  if(<%=((ArrayList<AdminReservDTO>) request.getAttribute("salesStoreList")).size() == 0%>){
    alert("조회 내역이 없습니다.")
    location.href = "AdminSalesStore?city=전체&branch=전체"
  }

</script>

<style>
  .admin-sales-store-bg{
    width: 100%;
    height: 100%;
  }

  .admin-sales-store-headline {
    width: 100%;
    height: 50px;
    background: #fff;
    border-bottom: 1px solid rgb(184, 177, 177);
    padding-left: 20px;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
  }

  .admin-sales-store-headline > b {
    width: fit-content;
    font-size: 20px;
    line-height: 50px;
  }

  input[name=admin-sales-store-start], input[name=admin-sales-store-end],
  select[name=admin-sales-store-month], select[name=admin-sales-store-year]{
    display: none;
  }

  input[type=radio][value=day]:checked+input+input+input+input[name=admin-sales-store-start],
  input[type=radio][value=dayBetweenDay]:checked+input+input+input[name=admin-sales-store-start],
  input[type=radio][value=dayBetweenDay]:checked+input+input+input+input[name=admin-sales-store-end],
  input[type=radio][value=month]:checked+input+input+input+select,
  input[type=radio][value=month]:checked+input+input+input+select+select,
  input[type=radio][value=year]:checked+input+input+select{
    display: inline-block;
  }

  .admin-sales-store-main{
    width: 100%;
    height: 100%;
    padding: 20px 20px;
    overflow: auto;
  }

  .admin-sales-store-table {
    width: 1000px;
    border: 1px solid rgb(122, 115, 115);
    margin-top: 10px;
  }

  .admin-sales-store-table th {
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  .admin-sales-store-table td {
    border: 1px solid rgb(97, 88, 88);
    text-align: center;
    font-size: 13px;
    height: 30px;
    padding: 5px 5px 5px 5px;
  }

  .admin-sales-store-table tr:first-of-type{
    height: 50px;
    padding: 10px;
    color: white;
    background: rgba(83, 104, 167, 0.856);
  }

  .admin-sales-store-table tr:nth-of-type(2n) {
    background: rgba(227, 233, 240, 0.726);
  }

  select[name=branch]{
    width: 150px;
  }
</style>

<%
  ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");
%>

<div class="admin-sales-store-bg">

  <div class="admin-sales-store-headline">
    <b>지점별 매출</b>
  </div>

  <div class="admin-sales-store-main">

    <div>
      <form action="AdminSalesStore" method="post" class="admin-sales-store-form">
        <select name="city">
          <option>전체</option>
          <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
            <option>${city}</option>
          </c:forTokens>
        </select>

        <select name="branch">
          <option>전체</option>
        </select>

        <input type="radio" name="admin-sales-store-period" value="day"/>일일
        <input type="radio" name="admin-sales-store-period" value="dayBetweenDay"/>일간
        <input type="radio" name="admin-sales-store-period" value="month"/>월간
        <input type="radio" name="admin-sales-store-period" value="year"/>연간

        <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" var="today"/>

        <input type="date" name="admin-sales-store-start" value="${today}"/>
        <input type="date" name="admin-sales-store-end" value="${today}"/>

        <select name="admin-sales-store-year">
          <option>2021</option>
          <option>2022</option>
        </select>
        <select name="admin-sales-store-month">
          <c:forEach var="month" begin="1" end="12" step="1">
            <option>${month}</option>
          </c:forEach>
        </select>

        <div>
          <select name="admin-sales-store-filter">
            <option value="mem_userid">사용자ID</option>
            <option value="mem_realname">사용자이름</option>
            <option value="mem_nickname">사용자닉네임</option>
          </select>
          <input type="text" name="admin-sales-store-word"/>
          <button type="button" class="admin-sales-store-search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
      </form>
    </div>

    <div>총 매출:${storeTotalPay}</div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-sales-store-table">
      <tr>
        <th>사용자ID</th>
        <th>사용자이름</th>
        <th>사용자닉네임</th>
        <th>지역</th>
        <th>지점명</th>
        <th>룸타입</th>
        <th>이용일자</th>
        <th>시간</th>
        <th>결제금액</th>
        <th>상태</th>
      </tr>
      <form action="">
        <c:forEach items="${salesStoreList}" var="salesStoreList">
          <tr>
            <td>${salesStoreList.mem_userid}</td>
            <td>${salesStoreList.mem_realname}</td>
            <td>${salesStoreList.mem_nickname}</td>
            <td>${salesStoreList.city}</td>
            <td>${salesStoreList.branch}</td>
            <td>${salesStoreList.room}</td>
            <td>${salesStoreList.useDate}</td>
            <td>${salesStoreList.time}</td>
            <td>${salesStoreList.pay}</td>
            <td>${salesStoreList.status}</td>
          </tr>
        </c:forEach>
      </form>
    </table>
  </div>
</div>
<script type="text/javascript">

    $("select[name=city]").change(function (){
      $("select[name=branch]").html("<option>전체</option>")
      <%for(BranchDTO branchDTO : branchList){%>
      if($("select[name=city]").val() == "<%=branchDTO.getCity()%>"){
        $("select[name=branch]").append("<option><%=branchDTO.getName()%></option>")
      }
      <%}%>
    })

    $("input[name=admin-sales-store-start]").change(function (){
      if($("input[name=admin-sales-store-start]").val() > $("input[name=admin-sales-store-end]").val()){
        $("input[name=admin-sales-store-end]").val($("input[name=admin-sales-store-start]").val())
      }
    })

    $("input[name=admin-sales-store-end]").change(function (){
      if($("input[name=admin-sales-store-start]").val() > $("input[name=admin-sales-store-end]").val()){
        $("input[name=admin-sales-store-start]").val($("input[name=admin-sales-store-end]").val())
      }
    })

    $(".admin-sales-store-search").click(function () {

      let checkNull = true;
      switch ($("input[name=admin-sales-store-period]:checked").val()) {
        case "day":
          if ($("input[name=admin-sales-store-start]").val() == "") {
            checkNull = false;
          }
          break;
        case "dayBetweenDay":
          if ($("input[name=admin-sales-store-start]").val() == "" || $("input[name=admin-sales-store-end]").val() == "") {
            checkNull = false;
          }
          break;
      }

      if (checkNull) {
        $(".admin-sales-store-form").submit()
      } else {
        alert("날짜를 선택해주세요.");
      }
    })


</script>