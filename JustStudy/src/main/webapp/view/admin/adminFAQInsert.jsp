<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-22
  Time: 오전 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
  $("#r5").attr("checked", true)
</script>
<style type="text/css">
  .admin-faq-insert-bg{
    width: 100%;
    height: fit-content;
  }

  .admin-faq-insert-headline {
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

  .admin-faq-insert-headline > b {
    width: 100px;
    font-size: 20px;
  }

  .admin-faq-insert-main {
    width: 2000px;
    height: fit-content;
    margin: 0px 0px 0px 220px;
    padding: 120px 20px 20px 40px;
  }

  .admin-faq-insert-table {
    height: 400px;
    border: 1px solid rgb(97, 88, 88);
    margin-top: 10px;
    margin-bottom: 10px;
  }

  .admin-faq-insert-table > tbody > tr > th {
    width: 80px;
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  .admin-faq-insert-table th {
    padding: 10px;
    background: rgba(83, 104, 167, 0.856);
    color: white;
  }

  .admin-faq-insert-table td {
    width: 400px;
    padding: 5px 0px 5px 10px;
    font-size: 13px;
    border: 1px solid rgb(97, 88, 88);
  }

  .admin-faq-insert-table tr:nth-of-type(1),
  .admin-faq-insert-table tr:nth-of-type(2){
    height: 15%;
  }

  input[name=faq-category]{
    margin-left: 10px;
  }

  input[name=faq-question]{
    width: 300px;
    height: 30px;
  }
</style>

<div class="admin-faq-insert-bg">
  <div class="admin-faq-insert-headline">
    <b>FAQ > 추가</b>
  </div>

  <div class="admin-faq-insert-main">

    <form action="AdminFAQInsertReg" method="get">
      <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-faq-insert-table">
        <tr>
          <th>분류</th>
          <td>
            <input type="radio" name="faq-category" value="usage" checked/>이용방법
            <input type="radio" name="faq-category" value="studyroom"/>스터디룸 예약
            <input type="radio" name="faq-category" value="pay"/>결제
            <input type="radio" name="faq-category" value="etc"/>기타
          </td>
        </tr>
        <tr>
          <th>질문</th>
          <td><input type="text" name="faq-question"/></td>
        </tr>
        <tr>
          <th>답변</th>
          <td><textarea name="faq-answer" rows="17" cols="50"></textarea></td>
        </tr>
      </table>
      <input type="submit" value="저장"/>
    </form>
  </div>
</div>