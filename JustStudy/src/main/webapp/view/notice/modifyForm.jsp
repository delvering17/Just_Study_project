<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" name="id">

<form action="NoticeModifyReg" method="post">

  <table>
    <tr>
      <td>타이틀</td>
      <td colspan="3"><input type="text" name="title"></td>
    </tr>
    <%--        <tr>
                <td>작성 날짜</td>
                <td> <input type="date"/> </td>
            </tr>--%>
    <tr>
      <td>내용</td>
      <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
    </tr>
    <tr>
      <td colspan="4"><input type="submit" value="등록"></td>
    </tr>
  </table>

</form>
