<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="EventDeleteReg">
  <input type="hidden" name="id" value="${param.id }"/>
  <table border="" width="100%">
<%--    <tr>
      <td>암호</td>
      <td><input type="text" name="pw"/></td>
    </tr>--%>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="삭제" />
      </td>
    </tr>
  </table>
</form>
