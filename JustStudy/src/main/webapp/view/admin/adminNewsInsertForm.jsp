<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-22
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
  $("#r5").attr("checked", true)
</script>

<style>

  #main {
    width: 100%;
    height: fit-content;
    padding: 20px 20px;
  }

  #main > div:first-of-type > input[type=button] {
    padding: 5px 3px 5px 3px;
    border-radius: 5px;
    border: 0;
    background: rgb(138, 169, 238);
    color: #fff;
    cursor: pointer;
    margin-top: 10px;
  }

  #main > div:nth-of-type(2) {
    margin: 10px 0px 0px 0px;

  }

  #main > div:nth-of-type(2) > select {
    height: 25px;
    border-radius: 4px;
  }

  #main > div:nth-of-type(2) > button {
    width: 25px;
    height: 25px;
  }

  table {
    width: 600px;
    border: 1px solid rgb(122, 115, 115);
    margin-top: 10px;
  }

  th {
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  td {
    border: 1px solid rgb(97, 88, 88);
    text-align: center;
    font-size: 13px;
  }

  tr:first-of-type > th:first-of-type,
  tr:first-of-type > th:last-of-type {
    width: 100px;
    height: 50px;
    padding: 10px;
    color: #fff;
    background: rgba(83, 104, 167, 0.856);
  }

  tr:first-of-type > th:nth-of-type(2),
  tr:first-of-type > th:nth-of-type(3),
  tr:first-of-type > th:nth-of-type(4),
  tr:first-of-type > th:nth-of-type(5),
  tr:first-of-type > th:nth-of-type(7),
  tr:first-of-type > th:nth-of-type(8) {
    width: 140px;
    background: rgba(83, 104, 167, 0.856);
    color: #fff;
  }

  tr:first-of-type > th:nth-of-type(6) {
    width: 250px;
    background: rgba(83, 104, 167, 0.856);
    color: #fff;
  }

  td {
    height: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
  }

  .branch:nth-of-type(2n) {
    background: rgba(227, 233, 240, 0.726)
  }
  #submit-btn{
    width: 80px;
    height: 30px;
    font-weight: bold;
    margin-top: 20px;
  }

</style>

<div id="main">
<form action="AdminNewsInsertReg" name="myform" method="post" enctype="multipart/form-data" onsubmit="return check()">
  <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" >
    <tr>
      <th>타이틀</th>
      <td >
        <input type="text" name="news_title">
      </td>
    </tr>
    <tr>
        <th>썸네일 이미지 첨부</th>
        <td>
          <input type="file" name="news_thumbnail_img"/>
        </td>
    </tr>
    <tr>
      <th>이미지 첨부</th>
      <td>
        <input type="file" name="news_img"/>
      </td>
    </tr>
    <tr>
      <th>내용</th>
      <td>
        <textarea name="news_content" cols="50" rows="10"></textarea>
      </td>
    </tr>

  </table>
  <input id="submit-btn" type="submit" value="등록">
</form>
</div>
<script>
  $(".admin-template-header>b").html("뉴스 목록")

  function check(){
    const f = document.myform;
    if(f.news_title.value.trim() == ""){
      alert("빈칸을 입력해주세요");
      f.news_title.focus();
      return false;
    }

    if(f.news_thumbnail_img.value == ""){
      alert("파일 선택을 해주세요");
      f.news_thumbnail_img.focus();
      return false;
    }
    if(f.news_img.value == ""){
      alert("파일 선택을 해주세요");
      f.news_img.focus();
      return false;
    }
    if(f.news_content.value.trim() == ""){
      alert("빈칸을 입력해주세요");
      f.news_content.focus();
      return false;
    }

  }
</script>