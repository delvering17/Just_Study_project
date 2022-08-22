<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    #headline {
        width: 1330px;
        height: 40px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-top: 15px;
        padding-left: 20px;
        margin-top: 50px;
        margin-left: 239px;
        position: fixed;
        flex-direction: row;
    }

    #headline > b {
        width: 100px;
        font-size: 20px;
    }

    #headline > input {
        float: right;
        margin: 0px 10px 50px 0px;

    }

    #main {
        width: 2000px;
        height: 2000px;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    #main > div:first-of-type > input[type=button] {
        padding: 5px 3px 5px 3px;
        border-radius: 5px;
        border: 0;
        background: rgb(138, 169, 238);
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }

    #main > div:nth-of-type(2) {
        margin: 10px 0px 0px 0px;

    }

    #main > div:nth-of-type(2) > select {
        height: 25px;
        border-radius: 4px;
    }

    #main > div:nth-of-type(2) > button {
        width: 25px;
        height: 25px;
    }

    table {
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 140px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2),
    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(7),
    tr:first-of-type > th:nth-of-type(8) {
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(6) {
        width: 250px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }
</style>

<script>
    window.onload = function(){

    $(".imgDelete").click(function (){
        if(confirm("정말 삭제하시겠습니까?")){
            $(".admin-modify-form").attr("action", "AdminNewsImgDelete")
            $(".admin-modify-form").submit()
        }
    })

    }

</script>
<script>
    <%
        if(request.getAttribute("msg") != null){%>
    alert("<%=request.getAttribute("msg")%>")
    <%}%>
</script>

<div class="wrapper">

    <div id="headline">
        <b>뉴스 수정</b>
    </div>

    <div id="main">
        <form action="AdminNewsModifyReg" method="post" enctype="multipart/form-data" class="admin-modify-form">
            <input type="hidden" name="news_id" value="${dto.news_id}">
            <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                <tr>
                    <td>타이틀</td>
                    <td colspan="3"><input type="text" name="news_title" value="${dto.news_title}">
                </tr>
                <tr>
                    <th>뉴스 사진</th>
                    <c:choose>
                        <c:when test="${dto.news_img != null}">
                    <td colspan="3">
                            <input type="button" value="파일 삭제" class="imgDelete"/>
                            <input type="hidden" name="news_img" value="${dto.news_img}">
                            <img src="<c:url value="/img/news/${dto.news_img}"/>"/>
                    </td>
                        </c:when>
                        <c:otherwise>
                            <td colspan="3">
                                <input type="file" name="news_img" value="">
                            </td>
                        </c:otherwise>
                    </c:choose>
                </tr>

                <tr>
                    <td>내용</td>
                    <td colspan="3"><textarea name="news_content" cols="50" rows="10">${dto.news_content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="4"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>
    </div>
</div>

