<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-18
  Time: 오전 7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  <c:if test="${msg!=null }">
  alert("${msg}")
  </c:if>
</script>
<form action="CommunityDeleteReg" method="post">
  <table border="" width="100%">
    <input type="hidden" name="id" value="${param.id }"/>
    <tr>
      <td>암호</td>
      <td><input type="text" name="pw"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="삭제" />
        <a href="CommunityDetail?id=${param.id }">뒤로</a>
      </td>
    </tr>
  </table>
</form>
