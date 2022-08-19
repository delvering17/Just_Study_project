<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="CommunityApplyDeleteReg" method="post">
  <table border="" width="100%">
    <input type="hidden" name="as_mem_id" value="${param.as_mem_id }"/>
    <tr>
      <td>암호</td>
      <td><input type="text" name="password"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="삭제" />
        <a href="CommunityApplyDetail?as_id=${param.as_id }">뒤로</a>
      </td>
    </tr>
  </table>
</form>
