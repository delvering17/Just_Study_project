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


<div class="wrapper">

    <div id="headline">
        <b>이벤트 추가</b>
    </div>
    <div id="main">
        <form action="AdminEventInsertReg" name="myform" id="event-detail-form" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="title" >
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
             <button type="submit" id="subbtn" >추가</button>
        </form>
        <a href="AdminEventList">목록으로</a>
    </div>
</div>

<script>

    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("event_startdate").setAttribute("min", today);
    document.getElementById("event_enddate").setAttribute("min", today);


    $("#subbtn").click(function(){

        var startDate = $( "input[name='event_startdate']" ).val();
        var startDateArr = startDate.split('-');

        var endDate = $( "input[name='event_enddate']" ).val();
        var endDateArr = endDate.split('-');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {

            alert("시작날짜와 종료날짜를 확인해 주세요.");

            return false;
        }

        $("#subbtn").focus();
    });


    function check(){
        const f = document.myform;
        if(f.title.value == ""){
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }
        if(f.event_startdate.value == ""){
            alert("시작날짜를 입력해주세요");
            f.event_startdate.focus();
            return false;
        }
        if(f.event_enddate.value == ""){
            alert("마감날짜를 입력해주세요");
            f.event_enddate.focus();
            return false;
        }
        if(f.img.value == ""){
            alert("이미지 파일을 첨부해주세요");
            f.img.focus();
            return false;
        }
        if(f.content.value == ""){
            alert("내용 파일을 첨부해주세요");
            f.content.focus();
            return false;
        }
    }

</script>