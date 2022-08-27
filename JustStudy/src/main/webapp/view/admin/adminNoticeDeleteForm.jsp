<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>

<form action="AdminNoticeDeleteReg">
    <input type="hidden" name="id" value="${param.id }"/>
    <table border="" style="margin: 0 auto; padding-top: 100px">
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="삭제" />
            </td>
        </tr>
    </table>
</form>
