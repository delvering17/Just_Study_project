<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/15
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<style>

    .mypage-inquiry {
        width: 900px;
        height: 100%;
        background: #F5F5F5;

    }

    .inquiry-top {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        font-size: 1rem;
        /* text-align: center; */
    }

    .inquiry-top button {
        border: 1px solid #a9a8a8;
        background: rgba(0, 0, 0, 0);
    }

    .inquiry-top > p{
        /* font-size: 1.2rem; */
        width: 150px;
        font-size: 1.2rem;
        vertical-align: middle;
        margin-block-start: 1em;
        text-align: center;
    }

    .inquiry-top > #inquiry-date-wave {
        width: 50px;
        text-align: center;
    }

    .top-dateselect-wrapper {
        width: 220px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .btn-inquiry {
        width: 60px;
        height: 40px;
    }

    #submit-find {
        margin-top: 12px;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .inquiry-top > .top-datepicker {
        width: 150px;
        height: 40px;
    }

    .inquiry-items {
        display: flex;
        flex-direction: row;
    }

    .inquiry-bottom {
        width: 500px;
        background: #ff0;
        margin: 0 auto;

    }

    .inquiry-bottom > a {
        width: 40px;
        /*background: #fff;*/
    }

    .inquiry-bottom > .inquiry-bottom-button {
        width: 60px;
        background: rgb(28, 63, 90);
        color: white;
    }


    .mypage-inquiry-main {
        width: 100%;
    }

    .mypage-inquiry-table {
        margin-top: 20px;
        margin-bottom: 30px;
        table-layout: fixed;
        word-break: break-all;
        border-top: 1px solid black;
    }
    .mypage-inquiry-table > tbody > tr > td {
        height: 60px;
        padding: 10px 0px 10px 0px;
        text-align: center;
    }

    .mypage-inquiry-table > tbody > tr > td:nth-of-type(1) {
        width: 40%;
    }

    .mypage-inquiry-table > tbody > tr > td:nth-of-type(2),
    .mypage-inquiry-table > tbody > tr > td:nth-of-type(3),
    .mypage-inquiry-table > tbody > tr > td:nth-of-type(5) {
        width: 10%;
    }

    .mypage-inquiry-table > tbody > tr > td:nth-of-type(4) {
        width: 30%;
    }

    .mypage-inquiry-table > tbody > tr:nth-of-type(1) {
        font-weight: bold;
    }

    .mypage-inquiry-table > tbody > tr {
        border-bottom: 1px solid lightgray;
    }


</style>
<div class="mypage-inquiry">
    <div class="inquiry-top">
        <p>문의일자 조회</p>
        <div class="top-dateselect-wrapper">

            <input type="radio" class="input-radio" name="date-period" id="find-today" value="today"/>
            <input type="radio" class="input-radio" name="date-period" id="find-day7" value="day7"/>
            <input type="radio" class="input-radio" name="date-period" id="find-month" value="month" />
            <input type="radio" class="input-radio" name="date-period" id="find-month3" value="month3" />

<%--                <input type="radio" class="input-radio" name="find_group" id="find-today" value="today" hidden/>--%>
<%--                <input type="radio" class="input-radio" name="find_group" id="find-day7" value="day7" hidden/>--%>
<%--                <input type="radio" class="input-radio" name="find_group" id="find-month" value="month" hidden/>--%>
<%--                <input type="radio" class="input-radio" name="find_group" id="find-month3" value="month3" hidden/>--%>
            <label for="find-today"><div class="find-button">오늘</div></label>
            <label for="find-day7"><div class="find-button">7일</div></label>
            <label for="find-month"><div class="find-button">1개월</div></label>
            <label for="find-month3"><div class="find-button">3개월</div></label>
        </div>
        <input class="top-datepicker" id="datepicker-before" max="" type="date">
        <p id="inquiry-date-wave">&#126;</p>
        <input class="top-datepicker" id="datepicker-after" type="date">
            <button class="btn-inquiry" onclick="goFind()">조회</button>
    </div>

    <div class="mypage-inquiry-main">
        <table class="mypage-inquiry-table">
            <tr>
                <td>문의제목</td>
                <td>카테고리</td>
                <td>종류</td>
                <td>문의일자</td>
                <td>문의상태</td>
            </tr>
            <c:forEach items="${arr_inquiryDTO}" var="inquiryDTO" varStatus="no">
                <tr>
                    <input type=hidden name="reservId" value="${myreserv.id}"/>
                    <td><a id="btn-Detail" onclick="goDetail(${inquiryDTO.inquiry_id})">${inquiryDTO.inquiry_title}</a></td>
                    <td>${inquiryDTO.inquiry_category}</td>
                    <td>${inquiryDTO.inquiry_type}</td>
                    <td>${inquiryDTO.inquiry_date_String}}</td>
                    <c:choose>
                        <c:when test="${inquiryDTO.inquiry_state eq 1}">
                            <td>미답변</td>
                        </c:when>
                        <c:otherwise>
                            <td>답변 완료</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            <c:if test="${arr_inquiryDTO.size() eq 0}">
                <tr>
                    <td colspan="5">일치하는 항목이 없습니다.</td>
                </tr>
            </c:if>
        </table>
    </div>
    <div class="inquiry-bottom">
    <c:if test="${firstPage > 1}">
        <a class="inquiry-bottom-button" onclick="goPageFind(${firstPage - 1})" >이전</a>
    </c:if>
    <c:forEach begin="${firstPage}" end="${endPage}" var="i">
        <c:choose>
            <c:when test="${i == nowPage}">
                [${i}]
            </c:when>
            <c:otherwise>
                <a onclick="goPageFind(${i})" >${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endPage < totalPage}">
        <a type="submit" class="inquiry-bottom-button" onclick="goPageFind(${endPage + 1})" >다음</a>
    </c:if>
        <br/>
    <button class="btn-inquiry" id="submit-find" onclick="goInquiryInsert()">문의하기</button>

    </div>
</div>

<script type="text/javascript">




    // datepicker 오늘 날짜 제한
    let now_utc = Date.now()
    let timeOff = new Date().getTimezoneOffset()*60000;
    let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    let inputarr = document.querySelectorAll('.top-datepicker')
    inputarr.forEach(function (item) {
        item.setAttribute("max", today);
    } )

    $('.top-datepicker').change(function () {

        const inputRadio = document.querySelectorAll('.input-radio');
        inputRadio.forEach(function (item) {
            item.checked = false;
        } )

    });

    $('.input-radio').change(function () {
        const topDatePicker = document.querySelectorAll('.top-datepicker');
        topDatePicker.forEach(function (item) {
            item.value = '';
        } )
    });

    $('#datepicker-before').change(function () {
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');
        if(datepickerBefore.value > datepickerAfter.value) {
            datepickerAfter.value = datepickerBefore.value
        }
        // datepickerAfter.setAttribute("min", datepickerBefore.value);
        datepickerAfter.setAttribute("value", datepickerBefore.value);
    });

    $('#datepicker-after').change(function () {
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');
        if(datepickerAfter.value < datepickerBefore.value) {
            datepickerBefore.value = datepickerAfter.value
        }
        // datepickerBefore.setAttribute("max", datepickerAfter.value);
        datepickerBefore.setAttribute("value", datepickerAfter.value);
    });



    // 활용해서 a의 nowPage 자체를 넘기기

    function goFind(i){

            let find_url = "?";

            let input_radio = $("input[name=date-period]:checked").attr('value');
            let datepickerBefore = document.querySelector('#datepicker-before');
            let datepickerAfter = document.querySelector('#datepicker-after');

            if(input_radio != null){
                find_url += "date_period=" + input_radio;
            }
            if(datepickerBefore.value !== ''){
                find_url += "date_before=" + datepickerBefore.value+"&";
                find_url += "date_after=" + datepickerAfter.value;
            }

            location.href = find_url

    }

    function goPageFind(i){

        let find_url = "?";

        let input_radio = $("input[name=date-period]:checked").attr('value');
        let datepickerBefore = document.querySelector('#datepicker-before');
        let datepickerAfter = document.querySelector('#datepicker-after');

        if(input_radio != null){
            find_url += "date_period=" + input_radio;
        }
        if(datepickerBefore.value !== ''){
            find_url += "date_before=" + datepickerBefore.value+"&";
            find_url += "date_after=" + datepickerAfter.value;
        }

        location.href = find_url + "&nowPage=" + i;
    }

    function goDetail(i) {

        let detail_url ="MypageInquiryDetail?inquiry_id="+ i+"&nowPage=${nowPage}"

        if($("input[name=date-period]:checked").attr('value') != null) {

            detail_url += "&date_period=" +  $("input[name=date-period]:checked").attr('value')

        } else {
            let datepickerBefore = document.querySelector('#datepicker-before');
            let datepickerAfter = document.querySelector('#datepicker-after');

            detail_url += "&date_before=" + datepickerBefore.value+"&";
            detail_url += "date_after=" + datepickerAfter.value;

        }

        location.href = detail_url

    }



        const datepickerBefore = document.querySelector('#datepicker-before');
        datepickerBefore.setAttribute("max", today);
        let datepickerAfter = document.querySelector('#datepicker-after');
        datepickerAfter.setAttribute("max", today);

        <c:if test="${date_period != null}" >

            switch ('${date_period}') {
                case "today":

                    let find_today = document.querySelector('#find-today');
                    find_today.checked = true;
                    break;

                case "day7":
                    let find_day7 = document.querySelector('#find-day7');
                    find_day7.checked = true;
                    break;

                case "month":
                    let find_month = document.querySelector('#find-month');
                    find_month.checked = true;
                    break;

                case "month3":
                    let find_month3 = document.querySelector('#find-month3');
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


    function goInquiryInsert() {
        location.href = "MypageInquiryInsertForm";
    }


</script>