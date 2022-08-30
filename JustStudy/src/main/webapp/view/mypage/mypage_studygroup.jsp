<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ApplyStudyDTO" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-19
  Time: 오전 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .mypage-studygroup-bg {
        width: 800px;
        background: #F5F5F5;

    }

    .mypage-studygroup-top {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        font-size: 1rem;
    }

    .mypage-studygroup-top > p {
        /* font-size: 1.2rem; */
        width: 20px;
        font-size: 1.2rem;
        vertical-align: middle;
        margin-block-start: 1em;
    }

    .top-dateselect-wrapper {
        width: 300px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .mypage-studygroup-period {
        width: 60px;
        height: 40px;
        border: 1px solid #a9a8a8;
        background: rgba(0, 0, 0, 0);
        text-align: center;
        line-height: 40px;
    }

    input[name=period]:checked + .mypage-studygroup-period {
        background: lightgray;
    }

    .mypage-studygroup-top-datepicker {
        width: 150px;
        height: 40px;
    }

    #submit-find {
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .mypage-studygroup-main {
        width: 100%;
    }

    .mypage-studygroup-menu {
        width: 800px;
        height: 50px;
        margin-top: 20px;
    }

    .mypage-studygroup-menu > label > p {
        width: fit-content;
        height: fit-content;
        line-height: 50px;
        margin-left: 10px;
        margin-right: 20px;
        float: left;
        font-size: 1.2rem;
        color: gray;
    }

    input[name=mypage-studygroup-type]:checked + label > p {
        font-weight: bold;
        color: black;
    }

    .mypage-studygroup-table {
        width: 800px;
        margin-top: 20px;
        margin-bottom: 30px;
        table-layout: fixed;
        word-break: break-all;
        border-top: 1px solid black;
    }

    .mypage-studygroup-table > tbody > tr > td {
        height: 60px;
        padding: 10px 0px 10px 0px;
        text-align: center;
    }

    .mypage-studygroup-table > tbody > tr:nth-of-type(1) {
        font-weight: bold;
    }

    .mypage-studygroup-table > tbody > tr {
        border-bottom: 1px solid lightgray;
    }

    .mypage-studygroup-list-detail {
      text-decoration: none;
      color: black;
    }

    .mypage-studygroup-list-detail:hover {
      color: rgb(173, 153, 126);

    }

    .mypage-studygroup-table td:nth-of-type(1) {
        width: 50px;
    }

    .mypage-studygroup-table td:nth-of-type(2) {
        width: 130px;
    }

    .mypage-studygroup-table td:nth-of-type(4),
    .mypage-studygroup-table td:nth-of-type(5),
    .mypage-studygroup-table td:nth-of-type(8){
        width: 100px;
    }

    .mypage-studygroup-table td:nth-of-type(3),
    .mypage-studygroup-table td:nth-of-type(6),
    .mypage-studygroup-table td:nth-of-type(7),
    .mypage-studygroup-table td:nth-of-type(9) {
        width: 80px;
    }

</style>

<div class="mypage-studygroup-bg">
    <div class="mypage-studygroup-top">
        <div class="top-dateselect-wrapper">

            <label for="all"><input type="radio" class="input-radio" name="period" id="all" hidden>
                <div class="mypage-studygroup-period">전체</div>
            </label>
            <label for="today"><input type="radio" class="input-radio" name="period" id="today" hidden>
                <div class="mypage-studygroup-period">오늘</div>
            </label>
            <label for="day7"><input type="radio" class="input-radio" name="period" id="day7" hidden>
                <div class="mypage-studygroup-period">7일</div>
            </label>
            <label for="month"><input type="radio" class="input-radio" name="period" id="month" hidden>
                <div class="mypage-studygroup-period">1개월</div>
            </label>
            <label for="month3"><input type="radio" class="input-radio" name="period" id="month3" hidden>
                <div class="mypage-studygroup-period">3개월</div>
            </label>
        </div>

        <input class="mypage-studygroup-top-datepicker" id="datepicker-before" max="" type="date">
        <p>&#126;</p>
        <input class="mypage-studygroup-top-datepicker" id="datepicker-after" type="date">
        <button class="mypage-studygroup-period" id="submit-find" onclick="goFind()">조회</button>

    </div>
    <div class="mypage-studygroup-main">

        <div class="mypage-studygroup-menu">
            <input type="radio" name="mypage-studygroup-type" id="maked" hidden><label for="maked"><p>커뮤니티 개설내역</p>
        </label>
            <input type="radio" name="mypage-studygroup-type" id="apply" hidden><label for="apply"><p>커뮤니티 신청내역</p>
        </label>
        </div>

        <table class="mypage-studygroup-table">
            <tr>
                <td>ID</td>
                <td>제목</td>
                <td>지점</td>
                <td>시작일</td>
                <td>종료일</td>
                <td>모집인원</td>
                <td>구분</td>

                <td id="td_regDate">신청일자</td>
                <td>상태</td>
            </tr>

            <c:forEach items="${studygroupList}" var="studygroup" varStatus="no">
                <form action="<c:url value="/community/CommunityApplyDetail"/>" class="mypage-studygroup-review-form">
                    <input type="hidden" name="as_id" value="${myApplyList[no.index].as_id}">
                    <tr>
                        <td>${studygroup.id}</td>
                        <td>
                            <a class=mypage-studygroup-list-detail href="<c:url value="/community/CommunityDetail?id=${studygroup.id}"/>">${studygroup.title}</a>
                        </td>

                        <td>${studygroup.location}</td>
                        <td>${studygroup.startdate}</td>
                        <td>${studygroup.enddate}</td>
                        <td>${studygroup.people}</td>
                        <td>${studygroup.studykind}</td>
                        <td>${studygroup.regDate}</td>

                        <c:choose>
                            <c:when test="${param.type == 'maked'}">
                                <td>${studygroup.status}</td>
                            </c:when>
                            <c:when test="${param.type == 'apply'}">
                                <c:choose>
                                    <c:when test="${myApplyList[no.index].as_state == 1}">
                                        <td>
                                            <input type="submit" value="대기중"/>
                                        </td>
                                    </c:when>
                                    <c:when test="${myApplyList[no.index].as_state == 2}">
                                        <td>
                                            <input type="submit" value="승인"/>
                                        </td>
                                    </c:when>
                                    <c:when test="${myApplyList[no.index].as_state == 3}">
                                        <td>
                                            <input type="submit" value="반려"/>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>

</div>

<script type="text/javascript">


    // datepicker 오늘 날짜 제한
    let now_utc = Date.now()
    let timeOff = new Date().getTimezoneOffset() * 60000;
    let today = new Date(now_utc - timeOff).toISOString().split("T")[0];

    let inputarr = document.querySelectorAll('.input-radio')
    inputarr.forEach(function (item) {
        item.setAttribute("max", today);
    })

    $('.mypage-studygroup-top-datepicker').change(function () {
        const inputRadio = document.querySelectorAll('.input-radio');
        inputRadio.forEach(function (item) {
            item.checked = false;
        })
    });

    $('.input-radio').change(function () {
        const topDatePicker = document.querySelectorAll('.mypage-studygroup-top-datepicker');
        topDatePicker.forEach(function (item) {
            item.value = '';
        })
    });

    $('#datepicker-before').change(function () {
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');
        if (datepickerBefore.value > datepickerAfter.value) {
            datepickerAfter.value = datepickerBefore.value
        }
        // datepickerAfter.setAttribute("min", datepickerBefore.value);
        datepickerAfter.setAttribute("value", datepickerBefore.value);
    });

    $('#datepicker-after').change(function () {
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');
        if (datepickerAfter.value < datepickerBefore.value) {
            datepickerBefore.value = datepickerAfter.value
        }
        // datepickerBefore.setAttribute("max", datepickerAfter.value);
        datepickerBefore.setAttribute("value", datepickerAfter.value);
    });


    // 활용해서 a의 nowPage 자체를 넘기기

    function goFind() {

        let find_url = "?type=${param.type}";

        let input_radio = $("input[name=period]:checked").attr("id");
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');

        if (input_radio != null) {
            find_url += "&date_period=" + input_radio;

        }

        if (datepickerBefore.value !== '') {
            find_url += "&date_before=" + datepickerBefore.value + "&";
            find_url += "date_after=" + datepickerAfter.value;
        }

        location.href = find_url

    }


    const datepickerBefore = document.querySelector('#datepicker-before');
    datepickerBefore.setAttribute("max", today);
    let datepickerAfter = document.querySelector('#datepicker-after');
    datepickerAfter.setAttribute("max", today);


    <c:if test="${date_period != null}" >

    switch ('${date_period}') {
        case "all":

            let find_all = document.querySelector('#all');
            find_all.checked = true;
            break;
        case "today":

            let find_today = document.querySelector('#today');
            find_today.checked = true;
            break;

        case "day7":
            let find_day7 = document.querySelector('#day7');
            find_day7.checked = true;
            break;

        case "month":
            let find_month = document.querySelector('#month');
            find_month.checked = true;
            break;

        case "month3":
            let find_month3 = document.querySelector('#month3');
            find_month3.checked = true;
            break;
    }
    </c:if>

    <c:if test="${date_before != null}" >
    let datepicker_before = document.querySelector('#datepicker-before');
    datepicker_before.value = '${date_before}';
    let datepicker_after = document.querySelector('#datepicker-after');
    datepicker_after.value = '${date_after}';
    </c:if>


    if ('${param.type}' === 'maked') {
        $('#td_regDate').empty()
        $('#td_regDate').html('개설 일자')

    } else {
        $('#td_regDate').empty()
        $('#td_regDate').html('신청 일자')

    }


    $("input[name=mypage-studygroup-type]").each(function (key, value) {
        if (value.getAttribute("id") == "${param.type}") {
            value.setAttribute("checked", true);
        }
    })

    $("input[name=mypage-studygroup-type]").change(function () {

        let find_url = "?type=" + $("input[name=mypage-studygroup-type]:checked").attr("id");

        let input_radio = $("input[name=period]:checked").attr("id");
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');

        if (input_radio != null) {
            find_url += "&date_period=" + input_radio;

        }

        if (datepickerBefore.value !== '') {
            find_url += "&date_before=" + datepickerBefore.value + "&";
            find_url += "date_after=" + datepickerAfter.value;
        }

        location.href = find_url

    })


</script>
