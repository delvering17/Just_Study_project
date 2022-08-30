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
    $(".admin-template-header>b").html("이벤트 상세보기")
    $(".admin-template-header>div").append("<input type='button' class='admin-event-update' value='수정' />")
    $(".admin-template-header>div").append("<input type='button' class='admin-event-delete' value='삭제' />")
    $(".admin-template-header>div").append("<input type='button' class='admin-event-list' value='목록으로' />")
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    #main {
        width: 100%;
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
        width: 1000px;
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
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    /*tr:first-of-type > th:nth-of-type(2),*/
    /*tr:first-of-type > th:nth-of-type(3),*/
    /*tr:first-of-type > th:nth-of-type(4),*/
    /*tr:first-of-type > th:nth-of-type(5),*/
    /*tr:first-of-type > th:nth-of-type(7),*/
    /*tr:first-of-type > th:nth-of-type(8) {*/
    /*    width: 140px;*/
    /*    background: rgba(83, 104, 167, 0.856);*/
    /*    color: #fff;*/
    /*}*/

    /*tr:first-of-type > th:nth-of-type(6) {*/
    /*    width: 250px;*/
    /*    background: rgba(83, 104, 167, 0.856);*/
    /*    color: #fff;*/
    /*}*/

    td {
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }


    .event-detail-table th {
        width: 100px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .input-title {
        width: 500px;
        height: 40px;

    }

    input {

    }
    .example-img {
        width: 400px;

    }

    .td-content {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        padding: 20px ;
    }

    .td-content > * {
        margin: 10px auto;
    }
</style>

<div id="main">
    <form name="myform" id="event-detail-form" method="post" enctype="multipart/form-data" onclick="return check()">
        <table class="event-detail-table" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <input class="input-title" type="hidden" name="id" value="${eventDTO.id}">
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" class="input-title" name="title" value="${eventDTO.title}">
                </td>
            </tr>
            <tr>
                <th>이벤트 시작일</th>
                <td>
                    <input type="date" class="input-title" id="event_startdate" name="event_startdate" value="${eventDTO.event_startdate_sdf}">
                </td>
            </tr>
            <tr>
                <th>이벤트 종료일</th>
                <td>
                    <input type="date" class="input-title" id="event_enddate" name="event_enddate" value="${eventDTO.event_enddate_sdf}">
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
                <td class="td-content">

                    <c:choose>
                        <c:when test="${eventDTO.img == null}">
                            <input type="file" name="img">
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="파일 삭제" id="imgDelete" onclick="deleteImgFile()"/>
                            <input type="hidden" name="img" value="${eventDTO.img}"/>
                            <img class="example-img" src="<c:url value="/img/event/${eventDTO.img}"/> ">
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td class="td-content">
                    <c:choose>
                        <c:when test="${eventDTO.content == null}">
                            <input type="file" name="content">
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="파일 삭제" id="imgDelete" onclick="deleteContentFile()"/>
                            <input type="hidden" name="content" value="${eventDTO.content}"/>
                            <img class="example-img"  src="<c:url value="/img/event/${eventDTO.content}"/> ">
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">

    $(".admin-event-list").click(function () {
        location.href = "AdminEventList"
    })

    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset() * 60000;
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("event_startdate").setAttribute("min", today);
    document.getElementById("event_enddate").setAttribute("min", today);

    $("#subbtn").click(function () {

        var startDate = $("input[name='event_startdate']").val();
        var startDateArr = startDate.split('-');

        var endDate = $("input[name='event_enddate']").val();
        var endDateArr = endDate.split('-');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);

        if (startDateCompare.getTime() > endDateCompare.getTime()) {

            alert("시작날짜와 종료날짜를 확인해 주세요.");

            return false;
        }

        $("#subbtn").focus();
    });

    function deleteContentFile() {
        if (confirm("이미지 파일을 삭제하시겠습니까?")) {
            $("#event-detail-form").attr("action", "AdminEventImgContentDelete")

            $("#event-detail-form").submit()
        }
    }

    function deleteImgFile() {
        if (confirm("이미지 파일을 삭제하시겠습니까?")) {
            $("#event-detail-form").attr("action", "AdminEventImgDelete")

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

    $(".admin-event-update").click(function () {
        $("#event-detail-form").attr("action", "AdminEventModifyReg?id=${eventDTO.id}")
        $("#event-detail-form").submit()
    })

    $(".admin-event-delete").click(function () {
        $("#event-detail-form").attr("action", "AdminEventDeleteReg?id=${eventDTO.id}")
        $("#event-detail-form").submit()
    })
</script>
