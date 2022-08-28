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

<form action="AdminNewsInsertReg" name="myform" method="post" enctype="multipart/form-data" onsubmit="return check()">

  <table border="" style="margin: 0 auto; padding-top: 100px">
    <tr>
      <td>타이틀</td>
      <td colspan="3"><input type="text" name="news_title"></td>
    </tr>
    <tr>
        <td>썸네일 이미지 첨부</td>
        <td><input type="file" name="news_thumbnail_img"/></td>
    </tr>
    <tr>
      <td>이미지 첨부</td>
      <td><input type="file" name="news_img"/></td>
    </tr>
    <tr>
      <td>내용</td>
      <td colspan="3"><textarea name="news_content" cols="50" rows="10"></textarea></td>
    </tr>
    <tr>
      <td colspan="4"><input type="submit" value="등록"></td>
    </tr>
  </table>

</form>

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