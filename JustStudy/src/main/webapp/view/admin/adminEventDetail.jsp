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

<script>
    $("#r5").attr("checked", true)
    <%
        if(request.getAttribute("msg") != null){%>
    alert("<%=request.getAttribute("msg")%>")
    <%}%>
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
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

<div id="main">
    <form name="myform" id="event-detail-form" method="post" enctype="multipart/form-data" onclick="return check()">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <input type="hidden" name="id" value="${eventDTO.id}">
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
                    <input type="hidden" name="reg_date" value="${eventDTO.reg_date_sdf}">
                    ${eventDTO.reg_date_sdf}
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>

                    <c:choose>
                        <c:when test="${eventDTO.img == null}">
                            <input type="file" name="img">
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="파일 삭제" id="imgDelete" onclick="deleteImgFile()"/>
                            <input type="hidden" name="img" value="${eventDTO.img}"/>
                            <img src="<c:url value="/img/event/${eventDTO.img}"/> ">
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <c:choose>
                        <c:when test="${eventDTO.img == null}">
                            <input type="file" name="content">
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="파일 삭제" id="imgDelete" onclick="deleteContentFile()"/>
                            <input type="hidden" name="content" value="${eventDTO.img}"/>
                            <img src="<c:url value="/img/event/${eventDTO.img}"/> ">
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
        </table>
        <button type="submit" formaction="AdminEventModifyReg?id=${eventDTO.id}" formmethod="post"
                formenctype="multipart/form-data">수정
        </button>
        <button type="submit" formaction="AdminEventDeleteReg" formmethod="get">삭제</button>
    </form>
    <input type='button' class='admin-event-list' value='목록으로' />
</div>

<script type="text/javascript">

    $(".admin-template-header>b").html("이벤트 목록")

    $(".admin-event-list").click(function () {
        location.href = "AdminEventList"
    })

    function deleteContentFile() {
        if (confirm("이미지 파일을 삭제하시겠습니까?")) {
            $("#event-detail-form").attr("action", "AdminEventImgDelete")

            $("#event-detail-form").submit()
        }
    }

    function deleteImgFile() {
        if (confirm("이미지 파일을 삭제하시겠습니까?")) {
            $("#event-detail-form").attr("action", "AdminEventContentDelete")

            $("#event-detail-form").submit()
        }
    }

    function check() {
        const f = document.myform;
        if (f.title.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }
        if (f.event_startdate.value == "") {
            alert("시작날짜를 입력해주세요");
            f.event_startdate.focus();
            return false;
        }
        if (f.event_enddate.value == "") {
            alert("마감날짜를 입력해주세요");
            f.event_enddate.focus();
            return false;
        }
        if (f.img.value == "") {
            alert("파일을 첨부해주세요");
            f.img.focus();
            return false;
        }
        if (f.content.value == "") {
            alert("파일을 첨부해주세요");
            f.content.focus();
            return false;
        }
    }
</script>
