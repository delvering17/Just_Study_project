<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  .txt-wrapper p{
    font-weight: bold;
    font-size: 1rem;
    padding: 2%;
    float: left;
  }

</style>

<form action="NewsInsertReg" method="post">

    <table>
        <tr>
            <td>타이틀</td>
            <td colspan="3"><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>이벤트 기간</td>
            <td><input type="date" name="event_startdate"></td>
            <td> ~ <input type="date" name="event_enddate"></td>
            <td></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit" value="등록"></td>
        </tr>
    </table>

</form>
