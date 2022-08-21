<%@ page import="model_p.EventDTO" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
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
        width: 400px;
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
        width: 50px;
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

<script type="text/javascript">
    window.onload = function (){
        $(".admin-store-delete").click(function (){
            alert($("input[name=branch]:checked").attr("id"))

        })
    }

</script>
<div class="wrapper">

    <div id="headline">
        <b>이벤트 상세보기</b>
    </div>
    <div id="main">
        <form>
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title" value="${eventDTO.title}">
                </td>
            </tr>
            <tr>
                <th>이벤트 시작일</th>
                <td>
                    <input type="date" name="event_startdate" value="${eventDTO.event_startdate_sdf}">
                </td>
            </tr>
            <tr>
                <th>이벤트 종료일</th>
                <td>
                    <input type="date" name="event_enddate" value="${eventDTO.event_enddate_sdf}">
                </td>
            </tr>
            <tr>
                <th>게시일</th>
                <td>
                    ${eventDTO.event_reg_date_sdf}
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>
                    <input type="file" name="img" value="${eventDTO.img}">
                    <img src="<c:url value="/img/event/" />${eventDTO.img}" alt="">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" cols="30" rows="10">${eventDTO.content}</textarea>

                </td>
            </tr>
        </table>
            <button type="submit" formaction="AdminEventModifyReg?id=${eventDTO.id}" formmethod="post" formenctype="multipart/form-data">수정</button>
            <button type="submit" href="AdminInquiryList" formmethod="get">삭제</button>
        </form>
        <a href="AdminEventList">목록으로</a>
    </div>
</div>

<script type="text/javascript">
</script>

