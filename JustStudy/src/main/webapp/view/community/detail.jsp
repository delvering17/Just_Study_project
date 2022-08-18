<%@ page import="model_p.CommunityDTO" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CommunityDTO dto = new CommunityDTO();
%>

<table border="">
    <tr>
        <td width="100px">지역</td>
        <td  width="500px">${dto.location}</td>
    </tr>
    <tr>
        <td>기간</td>
        <td>${dto.startdate} ~ ${dto.enddate}</td>
    </tr>
    <tr>
        <td>타이틀</td>
        <td>${dto.title}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${dto.pname}</td>
    </tr>
    <tr>
        <td>모집인원</td>
        <td>${dto.people} 명</td>
    </tr>
    <tr>
        <td>스터디 구분</td>
        <td>${dto.studykind}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td>${dto.content}</td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="submit" value="등록" />
            <a href="CommunityPage">목록으로</a>
        </td>
    </tr>
</table>
