<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-22
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="AdminNewsInsertReg" method="post" enctype="multipart/form-data">

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

