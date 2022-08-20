<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="EventModifyReg" method="post">

    <table>
        <tr>
            <td>타이틀</td>
            <td colspan="3"><input type="text" name="title" value="${dto.title}"></td>
        </tr>
        <tr>
            <td>이벤트 기간</td>
              <td><input type="date" name="event_startdate" value="${dto.event_startdate}"></td>
              <td> ~ <input type="date" name="event_enddate" value="${dto.event_enddate}"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10">${dto.conetnt}</textarea></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <input type="submit" value="수정" />
                <a href="EventPage">목록으로</a>
            </td>
        </tr>
    </table>

</form>
