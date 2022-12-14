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
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    tr:first-of-type > th:first-of-type{
        width: 100px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2){
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

  /*  .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }*/
</style>

<div id="main">
    <form name="myform" id="event-insert-form">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title">
                </td>
            </tr>
            <tr>
                <th>이벤트 시작일</th>
                <td>
                    <input type="date" id="event_startdate" name="event_startdate">
                </td>
            </tr>
            <tr>
                <th>이벤트 종료일</th>
                <td>
                    <input type="date" id="event_enddate" name="event_enddate">
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <input type="file" name="content">
                </td>
            </tr>
        </table>
    </form>
</div>

<script>

    $(".admin-template-header>b").html("이벤트 추가")

    $(".admin-template-header>div").append("<input type=button class='admin-event-add' onclick='goEventInsert()' value='추가'/>")
    $(".admin-template-header>div").append("<input type=button class='admin-event-list' value='목록으로'/>")

    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset() * 60000;
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("event_startdate").setAttribute("min", today);
    document.getElementById("event_enddate").setAttribute("min", today);





    function goEventInsert() {
        const f = document.myform;


        var startDate = $("input[name='event_startdate']").val();
        var startDateArr = startDate.split('-');

        var endDate = $("input[name='event_enddate']").val();
        var endDateArr = endDate.split('-');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1] - 1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1] - 1, endDateArr[2]);


        if (f.title.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        } else if (f.event_startdate.value == "") {
            alert("시작날짜를 입력해주세요");
            f.event_startdate.focus();
            return false;
        } else if (f.event_enddate.value == "") {
            alert("마감날짜를 입력해주세요");
            f.event_enddate.focus();
            return false;
        } else if (startDateCompare.getTime() > endDateCompare.getTime()) {
            alert("시작날짜와 종료날짜를 확인해 주세요.");
            return false;
        } else if (f.img.value == "") {
            alert("이미지 파일을 첨부해주세요");
            return false;
        } else if (f.content.value == "") {
            alert("내용 파일을 첨부해주세요");
            return false;
        } else if(!/^.+\.(jpe?g|gif|png)$/i.test(f.img.value)){
            alert("썸네일 사진 파일 형식을 맞춰주세요")
            return false;
        } else if(!/^.+\.(jpe?g|gif|png)$/i.test(f.content.value)){
            alert("내용 사진 파일 형식을 맞춰주세요")
            return false;
        } else {
            $("#event-insert-form").attr("action", "AdminEventInsertReg");
            $("#event-insert-form").attr("method", "post");
            $("#event-insert-form").attr("enctype", "multipart/form-data");
            $("#event-insert-form").submit();
        }

    }

    $(".admin-event-list").click(function () {
        location.href = "AdminEventList"
    })

</script>