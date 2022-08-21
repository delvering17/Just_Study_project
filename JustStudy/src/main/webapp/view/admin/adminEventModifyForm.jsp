<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="EventModifyReg" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${eventDTO.id}">

    <table>
        <tr>
            <td>제목</td>
            <td colspan="3"><input type="text" name="title" value="${eventDTO.title}"></td>
        </tr>
        <tr>
            <td>이벤트 기간</td>
              <td><input type="date" name="event_startdate" value="${eventDTO.event_startdate}"></td>
              <td> ~ <input type="date" name="event_enddate" value="${eventDTO.event_enddate}"></td>
        </tr>
        <tr>
            <td>이미지 첨부</td>
            <c:choose>
                <c:when test="${eventDTO.img != null}">
                    <td colspan="3"><input type="file" name="img" value="${eventDTO.img}"></td>
                </c:when>
                <c:otherwise>
                    <td colspan="3"><input type="file" name="img" value=""></td>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10">${eventDTO.content}</textarea></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <input type="submit" value="수정" />
                <a href="AdminEventDetail?id=${eventDTO.id}">뒤로가가</a>
            </td>
        </tr>
    </table>

</form>
