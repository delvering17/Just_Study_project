<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ReservationDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="reservation_p.Studyroom" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="model_p.MemberDTO" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-11
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
    .studyroom-reserv-bg {
        width: 100%;
        height: fit-content;
        background: #F5F5F5;
        padding-top: 100px;
        padding-bottom: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .studyroom-reserv-bg > h1 {
        width: fit-content;
        height: fit-content;
        margin-bottom: 50px;
        font-weight: bold;
    }

    .studyroom-reserv-select {
        width: 1184px;
        height: fit-content;
        margin-bottom: 30px;
    }

    .studyroom-reserv-city, .studyroom-reserv-branch, .studyroom-reserv-room {
        width: 250px;
        height: 500px;
        margin-right: 20px;
        display: inline-block;
    }

    .studyroom-reserv-time {
        width: 350px;
        height: 500px;
        display: inline-block;
    }

    .studyroom-reserv-wrapper > h4 {
        margin-bottom: 0px;
        font-size: 1.3rem;
        font-weight: bold;
        line-height: 70px;
        border-bottom: 1px solid black;
        letter-spacing: -1px;
    }

    .studyroom-reserv-wrapper > h4 > div {
        width: fit-content;
        font-size: 0.9rem;
        line-height: 70px;
        float: right;
        letter-spacing: -2px;
    }

    .studyroom-reserv-innerlist > label,
    .studyroom-reserv-innerlist-time > label
    {
        width: 100%;
    }

    .studyroom-reserv-innerlist > label > div,
    .studyroom-reserv-innerlist-time > div,
    .studyroom-reserv-innerlist-time > label > div {
        width: 100%;
        border-bottom: 1px solid lightgray;
        height: 60px;
        padding-left: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
    }

    .studyroom-reserv-innerlist > label > div,
    .studyroom-reserv-innerlist-time > label > div{
        cursor: pointer;
    }

    .studyroom-reserv-innerlist > input[type=radio]:checked + label > div {
        background: lightgray;
    }

    .studyroom-reserv-innerlist-time > div,
    .studyroom-reserv-innerlist-time > label > div {
        justify-content: left;
    }

    .studyroom-reserv-innerlist-time > label > div >div:last-of-type,
    .studyroom-reserv-innerlist-time > div > div:last-of-type{
        width: fit-content;
    }

    .studyroom-reserv-innerlist-time > input[type=checkbox]:checked + label > div {
        background: lightgray;
    }

    .studyroom-reserv-time > div:first-of-type {
        width: 350px;
        padding-left: 0px;
        line-height: 60px;
        text-align: center;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
    }

    .studyroom-reserv-time > div:first-of-type > div{
        width: fit-content;
        display: inline-block;
        margin: 0px 10px 0px 10px;
    }

    .studyroom-reserv-time > div > .fa-angle-left,
    .studyroom-reserv-time > div > .fa-angle-right{
        width: fit-content;
        cursor: pointer;
    }

    #datePicker {
        width: 60px;
        height: 60px;
        color: white;
        background: #060030;
        line-height: 60px;
        text-align: center;
        float: right;
        cursor: pointer;
    }

    .form-control{
        padding: 0px;
    }

    .studyroom-reserv-innerlist {
        overflow: auto;
        width: 100%;
        height: 429px;
    }

    .studyroom-reserv-innerlist-time {
        overflow: auto;
        height: 368px;
    }

    .studyroom-reserv-innerlist > label > div > div {
        width: 35px;
        height: 35px;
        margin-right: 20px;
        background: #002955;
        border-radius: 30px;
        color: white;
        text-align: center;
        line-height: 40px;
    }

    .studyroom-reserv-possible {
        width: 70px;
        height: 30px;
        margin-right: 20px;
        border-radius: 30px;
        background: #B1997A;
        line-height: 30px;
        text-align: center;
        color: white;
    }

    .studyroom-reserv-impossible {
        width: 70px;
        height: 30px;
        margin-right: 20px;
        border-radius: 30px;
        background: darkred;
        line-height: 30px;
        text-align: center;
        color: white;
    }

    .studyroom-reserv-impossible + div{
        color: gray;
    }

    .studyroom-reserv-selected {
        width: 1164px;
        height: 120px;
        margin-bottom: 60px;
        background: #EFEFEF;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-evenly;
    }

    .studyroom-reserv-selected > div:first-of-type {
        border-right: 1px solid lightgray;
    }

    .studyroom-reserv-selected > div {
        width: 280px;
    }

    .studyroom-reserv-selected > div > div > b {
        margin-left: 30px;
    }

    .studyroom-reserv-selected > div > div {
        line-height: 30px;
    }

    .fa-chevron-right {
        width: fit-content;
        color: gray;
    }

    .studyroom-reserv-headcount {
        width: 20px;
        height: 20px;
        border: none;
        border-radius: 20px;
        background: darkred;
        line-height: 20px;
        color: white;
        font-weight: bold;
    }

    .studyroom-reserv-headcount {
        width: 20px;
        height: 20px;
        border: none;
        border-radius: 20px;
        background: darkred;
        line-height: 20px;
        color: white;
        font-weight: bold;
    }

    .studyroom-reserv-headcount:first-of-type {
        margin-left: 10px;
    }

    .studyroom-reserv-headcount:last-of-type {
        margin-right: 20px;
    }

    .studyroom-reserv-selected > div:nth-of-type(3) > div:last-of-type {
        margin-top: 10px;
        height: 30px;
        line-height: 30px;
    }

    .studyroom-reserv-selected > div:nth-of-type(3) > div:last-of-type > div {
        width: fit-content;
        font-size: 30px;
        font-weight: bold;
        display: inline-block;
        align: bottom;
    }

    .studyroom-reserv-selected > button {
        width: 80px;
        height: 80px;
        background: darkred;
        border: none;
        border-radius: 10px;
        text-align: center;
        color: white;
        font-size: 0.9rem;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .fa-cart-shopping {
        width: 100%;
        font-size: 2rem;
        color: white;
        margin-top: 5px;
        margin-bottom: 5px;
    }

    .studyroom-reserv-result {
        width: 1164px;
        margin-bottom: 100px;
    }

    .studyroom-reserv-result > h5 {
        height: 40px;
        border-bottom: 1px solid black;
    }

    .studyroom-reserv-result > div {
        border-bottom: 1px solid lightgray;
        padding-left: 50px;
    }

    .studyroom-reserv-result > div > div {
        width: fit-content;
        height: 70px;
        display: inline-block;
        line-height: 70px;
        font-weight: bold;
        font-size: 1.1rem;
    }

    .studyroom-reserv-result > div > div:first-of-type,
    .studyroom-reserv-result > div > div:last-of-type {
        color: darkred;
    }

    .studyroom-reserv-result > div > div:nth-of-type(2) {
        margin-left: 50px;
    }

    .studyroom-reserv-result > div > div:last-of-type {
        margin-right: 30px;
        float: right;
    }

    .studyroom-reserv-result > div > button {
        width: 70px;
        height: 70px;
        background: none;
        float: right;
        text-align: center;
        border: none;
        color: gray;
    }

    .studyroom-reserv-done {
        width: 100%;
        height: fit-content;
        padding-top: 10px;
        padding-bottom: 10px;
        position: fixed;
        bottom: 0;
        background: white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .studyroom-reserv-done > button {
        width: 700px;
        height: 50px;
        background: darkred;
        color: white;
        font-size: 1.2rem;
        font-weight: bold;
        border: none;
        border-radius: 10px;
    }

    #studyroom-reserv-receipt > div > div {
        background: #F5F5F5;
        padding: 20px 20px 20px 20px;
    }

    #studyroom-reserv-receipt .modal-header {
        height: 100px;
        border: none;
    }

    .studyroom-reserv-paylist > div > p{
        font-size: 20px;
    }

    .studyroom-reserv-paylist > div > div{
        margin-top: 10px;
        margin-bottom: 30px;
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        background: white;
        padding: 20px;
    }


    .studyroom-reserv-paylist > div > div > div:first-of-type {
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 10px;
    }


    .studyroom-reserv-paylist > div > div> ul > li {
        font-size: 1rem;
        font-weight: bold;
        height: 30px;
    }

    .studyroom-reserv-paylist > div > div > div:last-of-type {
        text-align: right;
        font-size: 1.3rem;
        font-weight: bold;
    }

    #studyroom-reserv-receipt .modal-body > div:nth-of-type(2),
    #studyroom-reserv-receipt .modal-body > div:nth-of-type(3){
        width: 100%;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
    }

    #studyroom-reserv-receipt .modal-body > div:nth-of-type(3) {
        margin-bottom: 40px;
    }

    #studyroom-reserv-receipt .modal-body > div:nth-of-type(2) > div,
    #studyroom-reserv-receipt .modal-body > div:nth-of-type(3) > div {
        width: fit-content;
        font-size: 1.3rem;
        font-weight: bold;
        color: darkred;
    }

    #studyroom-reserv-receipt input[type=text] {
        width: 100%;
        height: 40px;
        margin-top: 10px;
        padding-left: 20px;
        border: none;
        color: gray;
    }

    #studyroom-reserv-receipt input[type=text]:nth-of-type(2) {
        margin-bottom: 40px;
    }

    #studyroom-reserv-receipt input[type=radio] {
        width: 30px;
        height: 15px;
        accent-color: darkred;
    }

    #studyroom-reserv-receipt label {
        height: 20px;
        line-height: 20px;
        font-size: 1.1rem;
        margin-top: 15px;
    }

    #studyroom-reserv-receipt label:nth-of-type(2) {
        margin-bottom: 40px;
    }

    #studyroom-reserv-receipt input[type=checkbox] {

        width: 20px;
        height: 15px;
        accent-color: darkred;
    }

    #studyroom-reserv-receipt .modal-body > button {
        height: 50px;
        margin-top: 20px;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 1.2rem;
        font-weight: bold;
    }

    #studyroom-reserv-receipt .modal-body > button:nth-of-type(1) {
        width: 100%;
        margin-top: 70px;
        background: darkred;
    }

    #studyroom-reserv-receipt .modal-body > button:nth-of-type(2) {
        width: 100%;
        background: #B1997A;
    }

</style>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new Date());
%>
<div class="studyroom-reserv-bg">

    <h1>스터디룸예약</h1>

    <div class="studyroom-reserv-select">
        <div class="studyroom-reserv-wrapper studyroom-reserv-city">
            <h4>지역</h4>
            <div class="studyroom-reserv-innerlist">
                <%for (String city : "서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주".split(",")) {
                    if(((HashMap<String, Integer>)request.getAttribute("branchMap")).get(city)!=0){%>
                <input type="radio" name="cityName" id="<%=city%>" hidden/>
                <label for="<%=city%>">
                    <div>
                        <%= city%>
                        <div><%=((HashMap<String, Integer>)request.getAttribute("branchMap")).get(city)%></div>
                    </div>
                </label>
                <%}%>
                <%}%>

            </div>
        </div>
        <div class="studyroom-reserv-wrapper studyroom-reserv-branch">
            <h4>지점명</h4>
            <div class="studyroom-reserv-innerlist">

            </div>
        </div>
        <div class="studyroom-reserv-wrapper studyroom-reserv-room">
            <h4>룸타입</h4>
            <div class="studyroom-reserv-innerlist">

            </div>
        </div>
        <div class="studyroom-reserv-wrapper studyroom-reserv-time">
            <h4>
                예약날짜 및 시간
                <div>시간은 복수선택 가능합니다.</div>
            </h4>
            <div>
                <i class="fa-solid fa-angle-left"></i>
                <div><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-d (E)"/></div>
                <i class="fa-solid fa-angle-right"></i>
                <i class="fa-solid fa-calendar-days fa-2x form-control" id="datePicker"></i>
            </div>
            <div class="studyroom-reserv-innerlist-time">
            </div>
        </div>
    </div>

    <div class="studyroom-reserv-selected">
        <div>
            <div>지역명<b></b></div>
            <div>지점명<b></b></div>
            <div>룸타입<b></b></div>
        </div>
        <div>
            <div>날짜<b><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-d (E)"/></b></div>
            <div>시간<b></b></div>
        </div>
        <i class="fa-solid fa-chevron-right fa-2x"></i>
        <div>
            인원
            <button class="studyroom-reserv-headcount">-</button>
            <b>2</b><b>명</b>
            <button class="studyroom-reserv-headcount">+</button>
            <font size="2px" color="darkred">*인당 1시간 2000원</font>
            <div>총
                <div class="studyroom-reserv-totalprice">0</div>
                원
            </div>
        </div>
        <button><i class="fa-solid fa-cart-shopping"></i>예약추가</button>
    </div>

    <div class="studyroom-reserv-result">
        <h5><b>예약 확인</b></h5>
    </div>

    <div class="studyroom-reserv-done">
        <button id="studyroom-reserv-done-btn" data-bs-toggle="modal">총 0건 | 0원 결제하기</button>
    </div>

</div>

<div id="studyroom-reserv-receipt" class="modal" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4><b>예약 내역</b></h4>
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="studyroom-reserv-paylist">

                </div>

                <div>
                    <div>총 예약 건수</div>
                    <div>2건</div>
                </div>
                <div>
                    <div>결제 금액</div>
                    <div>10,000원</div>
                </div>
                <font size="5px"><b>이용자 정보</b></font>
                <input type="text" class="studyroom-reserv-paylist-username" readonly/>
                <input type="text" class="studyroom-reserv-paylist-useremail" readonly/>
                <div><font size="5px"><b>결제 수단 선택</b></font></div>
                <label><input type="radio" name="paymentMethod" value="kcp" checked>신용카드</label>
                <label><input type="radio" name="paymentMethod" value="kakaopay">카카오페이</label>

                <div><font size="2px" color="darkred"><b>*예약 복수 선택 시 환불 기간이 지나면 취소가 어려우니 유의바랍니다.</b></font></div>
                <div><font size="2px" color="darkred"><b>(환불기간: 예약 시작시간 48시간 이전부터 취소/환불 불가)</b></font></div>

                <label><input type="checkbox" class="personalInfo"><font size="2px">이용규칙, 취소 및 환불규칙, 개인정보 수집 및 이용, 개인정보 제3자 제공에 동의하실 경우
                    클릭해주세요.</font></label>

                <button></button>
                <button data-bs-dismiss="modal">다시 선택하기</button>
            </div>
        </div>
    </div>
</div>
<form class="studyroom-reserv-form" method="post" action="PaySuccess" hidden>
    <%
        if(request.getAttribute("memberDTO")!=null){
            MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
    %>
    <input name="userId" value="<%=memberDTO.getMem_id()%>">
    <input name="userName" value="<%=memberDTO.getMem_realname()%>">
    <input name="userEmail" value="<%=memberDTO.getMem_userid()%>">
    <%}%>
    <input name="orderId">
    <input name="paymentMethod">
</form>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
        if(${param.city != null}){
            $("input[name=cityName]").each(function (key, value){
                if(value.getAttribute("id") == "${param.city}"){
                    value.setAttribute("checked", true)
                }
            })

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setBranch&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id"),
                success: function(data){
                    $(".studyroom-reserv-room>.studyroom-reserv-innerlist").html("")
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html("")
                    $(".studyroom-reserv-branch>.studyroom-reserv-innerlist").html(decodeURIComponent(data))
                    $("input[type=radio][name=cityName]:checked+label>div>div").html($(".studyroom-reserv-branch>.studyroom-reserv-innerlist>label").length)
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(1)>b").html(document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id"))
                    $(".studyroom-reserv-totalprice").html("0")
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })
            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(2)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")

            $("input[name=branchName]").each(function (key, value){
                if(value.getAttribute("id") == "${param.branch}"){
                    value.setAttribute("checked", true)
                }
            })

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setRoom&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id"),
                success: function(data){
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html("")
                    $(".studyroom-reserv-room>.studyroom-reserv-innerlist").html(decodeURIComponent(data.split(",")[0]))
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(2)>b").html(document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id"))
                    $(".studyroom-reserv-headcount:last-of-type+font").html("*인당 1시간 <b>"+data.split(",")[1]+"</b>원")
                    $(".studyroom-reserv-totalprice").html("0")
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })

            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")
        }

        $("input[name=cityName]").change(function () {
            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setBranch&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id"),
                success: function(data){
                    $(".studyroom-reserv-room>.studyroom-reserv-innerlist").html("")
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html("")
                    $(".studyroom-reserv-branch>.studyroom-reserv-innerlist").html(decodeURIComponent(data))
                    $("input[type=radio][name=cityName]:checked+label>div>div").html($(".studyroom-reserv-branch>.studyroom-reserv-innerlist>label").length)
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(1)>b").html(document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id"))
                    $(".studyroom-reserv-totalprice").html("0")
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })
            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(2)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")

        })

        $(document).on("change", "input[name=\"branchName\"]", function(){

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setRoom&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id"),
                success: function(data){
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html("")
                    $(".studyroom-reserv-room>.studyroom-reserv-innerlist").html(decodeURIComponent(data.split(",")[0]))
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(2)>b").html(document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id"))
                    $(".studyroom-reserv-headcount:last-of-type+font").html("*인당 1시간 <b>"+data.split(",")[1]+"</b>원")
                    $(".studyroom-reserv-totalprice").html("0")
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })

            $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html("")
            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")
        });

        $(".studyroom-reserv-time > div > .fa-angle-left").click(function (){
            let nowDate = new Date($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
            nowDate.setDate(nowDate.getDate() - 1);
            if(nowDate >= new Date().setDate(new Date().getDate()-1)){
                $(".studyroom-reserv-time > div > .fa-angle-left + div").html(nowDate.getFullYear()+"-"+(nowDate.getMonth() > 8 ? "" : "0")+(nowDate.getMonth()+1)+"-"+(nowDate.getDate() > 9 ? "" : "0")+nowDate.getDate()+" ("+"일월화수목금토".split("")[nowDate.getDay()]+")")
                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
            } else{
                alert("이전 일자는 예약할 수 없습니다.")
            }

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setTime&roomName="+document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id")
                    +"&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id")
                    +"&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id")
                    +"&selectedDay="+$(".fa-angle-left+div").html().split(" ")[0],
                success: function(data){
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html(decodeURIComponent(data))
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })

            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")


            if ($(".fa-angle-left+div").html().includes("<%=today%>")) {
                $(".studyroom-reserv-innerlist-time>input[name=time]").each(function (key, value) {
                    if (value.getAttribute("id").split(":")[0] <= new Date().getHours()) {
                        value.nextSibling.firstChild.firstChild.setAttribute("class", "studyroom-reserv-impossible")
                        value.nextSibling.firstChild.firstChild.innerHTML = "예약완료"
                        value.nextSibling.firstChild.style.cursor = "default"
                        value.remove()
                    }
                })
            }
        })

        $(".studyroom-reserv-time > div > .fa-angle-right").click(function (){
            let nowDate = new Date($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
            nowDate.setDate(nowDate.getDate() + 1);
            $(".studyroom-reserv-time > div > .fa-angle-left + div").html(nowDate.getFullYear()+"-"+(nowDate.getMonth() > 8 ? "" : "0")+(nowDate.getMonth()+1)+"-"+(nowDate.getDate() > 9 ? "" : "0")+nowDate.getDate()+" ("+"일월화수목금토".split("")[nowDate.getDay()]+")")
            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html($(".studyroom-reserv-time > div > .fa-angle-left + div").html())

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setTime&roomName="+document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id")
                    +"&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id")
                    +"&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id")
                    +"&selectedDay="+$(".fa-angle-left+div").html().split(" ")[0],
                success: function(data){
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html(decodeURIComponent(data))
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })

            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")
        })

        $(document).on("change", "input[name=\"roomName\"]", function(){

            $.ajax({
                url: '<c:url value="/nonView/SetReservationItems"/>',
                type: "GET",
                async: false,
                data: "type=setTime&roomName="+document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id")
                    +"&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id")
                    +"&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id")
                    +"&selectedDay="+$(".fa-angle-left+div").html().split(" ")[0],
                success: function(data){
                    $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html(decodeURIComponent(data))
                    $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                },
                error: function (e){
                    console.log(e.responseText)
                }
            })

            $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")

            let minHeadcount;

            if($("input[type=radio][name=roomName]:checked").attr("id").includes("4인실")){
                minHeadcount = 2;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("6인실")){
                minHeadcount = 4;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("8인실")){
                minHeadcount = 6;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("대회의실")){
                minHeadcount = 10;
            }

            $(".studyroom-reserv-headcount:first-of-type+b").html(minHeadcount)

            if($(".fa-angle-left+div").html().includes("<%=today%>")) {
                $(".studyroom-reserv-innerlist-time>input[name=time]").each(function (key, value) {
                    if (value.getAttribute("id").split(":")[0] <= new Date().getHours()) {
                        value.nextSibling.firstChild.firstChild.setAttribute("class", "studyroom-reserv-impossible")
                        value.nextSibling.firstChild.firstChild.innerHTML = "예약완료"
                        value.nextSibling.firstChild.style.cursor = "default"
                        value.remove()
                    }
                })
            }

            $(".studyroom-reserv-totalprice").html("0")
        });

        $(document).on("click", ".studyroom-reserv-innerlist-time > label", function (){
            if(document.querySelectorAll('input[type=checkbox][name=time]:checked').length == 1
            && $("input[name=time]").eq($(this).index(".studyroom-reserv-innerlist-time > label")).prop("checked")){
                $(".studyroom-reserv-totalprice").html("0")
            }
        })

        $(document).on("change", "input[name=\"time\"]", function (){
            if(document.querySelector('input[type=checkbox][name=time]:checked+label>div>div:last-of-type') != null){
                let str = document.querySelector('input[type=checkbox][name=time]:checked+label>div>div:last-of-type').innerHTML
                    + ((document.querySelectorAll('input[type=checkbox][name=time]:checked').length - 1) > 0 ? " 외 "+(document.querySelectorAll('input[type=checkbox][name=time]:checked').length - 1)+"건" : "")

                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html(str)

                const totalPrice = $(".studyroom-reserv-headcount:last-of-type+font>b").html()
                    * document.querySelectorAll('input[type=checkbox][name=time]:checked').length
                    * $(".studyroom-reserv-headcount:first-of-type+b").html()



                $(".studyroom-reserv-totalprice").html(totalPrice.toLocaleString('en-AU'))
            } else{
                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")
            }
        })

        $('#datePicker').datepicker({
            format: 'yyyy-mm-dd (E)', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
            startDate: '0d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
            /*                    endDate: '+1y', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)*/
            autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
            todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
            language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        })
            .on('changeDate', function (e) {

                $(".studyroom-reserv-time > div > .fa-angle-left + div")
                    .html(e.date.getFullYear()+"-"+
                        (e.date.getMonth() > 8 ? "" : "0") +(parseInt(e.date.getMonth())+1)+"-"+
                        (e.date.getDate() > 9 ? "" : "0")+e.date.getDate()+" ("+"일월화수목금토".split("")[e.date.getDay()]+")")

                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html($(".studyroom-reserv-time > div > .fa-angle-left + div").html())

                $.ajax({
                    url: '<c:url value="/nonView/SetReservationItems"/>',
                    type: "GET",
                    async: false,
                    data: "type=setTime&roomName="+document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id")
                        +"&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id")
                        +"&cityName="+document.querySelector('input[type=radio][name=cityName]:checked').getAttribute("id")
                        +"&selectedDay="+$(".fa-angle-left+div").html().split(" ")[0],
                    success: function(data){
                        $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html(decodeURIComponent(data))
                        $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                    },
                    error: function (e){
                        console.log(e.responseText)
                    }
                })

                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html("")

            });

        $(".studyroom-reserv-headcount:first-of-type").click(function (){

            let minHeadcount;

            if($("input[type=radio][name=roomName]:checked").attr("id").includes("4인실")){
                minHeadcount = 2;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("6인실")){
                minHeadcount = 4;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("8인실")){
                minHeadcount = 6;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("대회의실")){
                minHeadcount = 10;
            }


            if($(".studyroom-reserv-headcount:first-of-type+b").html() > minHeadcount){
                $(".studyroom-reserv-headcount:first-of-type+b").html($(".studyroom-reserv-headcount:first-of-type+b").html() - 1)

                let totalPrice2 = $(".studyroom-reserv-headcount:last-of-type+font>b").html()
                    * document.querySelectorAll('input[type=checkbox][name=time]:checked').length
                    * $(".studyroom-reserv-headcount:first-of-type+b").html()

                totalPrice2 = totalPrice2.toLocaleString('en-US')

                $(".studyroom-reserv-totalprice").html(totalPrice2)
            } else{
                alert(minHeadcount+"인 이상 이용 가능합니다.")
            }
        })

        $(".studyroom-reserv-headcount:last-of-type").click(function (){

            let maxHeadcount;
            if($("input[type=radio][name=roomName]:checked").attr("id").includes("4인실")){
                maxHeadcount = 4;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("6인실")){
                maxHeadcount = 6;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("8인실")){
                maxHeadcount = 8;
            } else if($("input[type=radio][name=roomName]:checked").attr("id").includes("대회의실")){
                maxHeadcount = 16;
            }

            if($(".studyroom-reserv-headcount:first-of-type+b").html() < maxHeadcount){
                $(".studyroom-reserv-headcount:first-of-type+b").html(parseInt($(".studyroom-reserv-headcount:first-of-type+b").html()) + 1)

                let totalPrice3 = $(".studyroom-reserv-headcount:last-of-type+font>b").html()
                    * document.querySelectorAll('input[type=checkbox][name=time]:checked').length
                    * $(".studyroom-reserv-headcount:first-of-type+b").html()

                totalPrice3 = totalPrice3.toLocaleString('en-US')

                $(".studyroom-reserv-totalprice").html(totalPrice3)
            } else{
                alert(maxHeadcount+"인 이하만 이용 가능합니다.")
            }

        })

        $(".studyroom-reserv-selected > button").click(function(){

            if($("input[name=cityName]:checked").length != 0 && $("input[name=branchName]:checked").length != 0 && $("input[name=roomName]:checked").length != 0 && $("input[name=time]:checked").length != 0){
                const selectedTime = document.querySelectorAll('input[type=checkbox][name=time]:checked')
                let selectedTimeList = new Array()

                for(let i = 0; i < selectedTime.length; i++){
                    selectedTimeList.push(selectedTime.item(i).id)
                }

                const selected = new Array();
                selected.push($(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(1)>b").html())
                selected.push($(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(2)>b").html())
                selected.push($(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html())
                selected.push($(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html())

                let totalCheck = true;
                big:for(let i = 0 ; i < $(".studyroom-reserv-form>div").length; i++){
                    let check = true;
                    for(let k = 0 ; k < selected.length; k ++){
                        if(!selected[k].includes($(".studyroom-reserv-form>div").eq(i).children("input").eq(k).val())){
                            check = false;
                        }
                    }
                    if(check){
                        for(let l = 0 ; l < selectedTimeList.length; l++){
                            if($(".studyroom-reserv-form>div").eq(i).children("input").eq(4).val().includes(selectedTimeList[l])){
                                totalCheck = false;
                                break big;
                            }
                        }
                    }
                }

                if(totalCheck){
                    $(".studyroom-reserv-result").append("<div>" +
                        "<div>"+($(".studyroom-reserv-result>div").length+1)+"</div>" +
                        "<div>" +
                        selected[0] + " | "+
                        selected[1] + " | "+
                        selected[2] + " | "+
                        selected[3] + " | "+
                        selectedTimeList.join (", ")+ " | "+
                        $(".studyroom-reserv-headcount:first-of-type+b").html()+"인"+
                        "</div>" +
                        "<button><i class=\"fa-regular fa-x fa-2x\"></i></button>" +
                        "<div>"+$(".studyroom-reserv-totalprice").html()+"원"+"</div></div>")

                    let realTotalWon = 0;

                    for(let i = 0; i < $(".studyroom-reserv-result>div").length; i++){
                        realTotalWon += parseInt($(".studyroom-reserv-result>div").eq(i).children("div").eq(2).html().split("원")[0].replaceAll(",",""))
                    }

                    $(".studyroom-reserv-done>button").html("총 "+$(".studyroom-reserv-result>div").length+"건 | "+realTotalWon.toLocaleString('en-us')+"원 결제하기")

                    const reserveNum = $(".studyroom-reserv-form>div").length
                    $(".studyroom-reserv-form").append("<div></div>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='city' value='"+selected[0]+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='branch' value='"+selected[1]+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='room' value='"+selected[2]+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='useDate' value='"+selected[3].split(" ")[0]+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='time' value='"+selectedTimeList.join (", ")+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='headcount' value='"+$(".studyroom-reserv-headcount:first-of-type+b").html()+"'></input>")
                    $(".studyroom-reserv-form>div").eq(reserveNum).append("<input name='pay' value='"+$(".studyroom-reserv-totalprice").html().replaceAll(",", "")+"'></input>")
                } else{
                    alert("중복된 예약은 추가할 수 없습니다.")
                }
            }else{
                alert("지역, 지점명, 룸타입, 시간을 모두 선택해주세요.")
            }
        })

        $(document).on("click", ".fa-x", function (){
            const removeDiv = $(this).parent().parent()
            $(".studyroom-reserv-form").children("div").eq($(this).index(".fa-x")).remove()
            removeDiv.html("")
            removeDiv.remove()

            let realTotalWon = 0;

            for(let i = 0; i < $(".studyroom-reserv-result>div").length; i++){
                realTotalWon += parseInt($(".studyroom-reserv-result>div").eq(i).children("div").eq(2).html().split("원")[0])
            }

            $(".studyroom-reserv-done>button").html("총 "+$(".studyroom-reserv-result>div").length+"건 | "+realTotalWon+"원 결제하기")

            $(".studyroom-reserv-result>div").each(function (key, value){
                value.firstChild.innerHTML = key+1
            })
        })

        $(".studyroom-reserv-done>button").click(function (){

            if($("input[name=userId]").length != 0){

                if(${sessionScope.level != 3}){
                    if($(".studyroom-reserv-form>div").length > 0){

                        let btn = document.querySelector("#studyroom-reserv-done-btn");
                        btn.setAttribute("data-bs-target", "#studyroom-reserv-receipt")
                        btn.click()

                        $(".studyroom-reserv-paylist").html("")

                        let totalWon = 0;

                        for(let i = 0; i < $(".studyroom-reserv-form>div").length; i++){

                            $(".studyroom-reserv-paylist").append("<div>")
                            $(".studyroom-reserv-paylist>div").eq(i).append("<p><b>"+
                                $(".studyroom-reserv-form>div").eq(i).children("input[name=\"city\"]").val()+" | "+
                                $(".studyroom-reserv-form>div").eq(i).children("input[name=\"branch\"]").val()+ "</b></p>")
                            $(".studyroom-reserv-paylist>div").eq(i).append("<div>")
                            $(".studyroom-reserv-paylist>div").eq(i).children("div").append("<div>"+$(".studyroom-reserv-form>div").eq(i).children("input[name=\"useDate\"]").val()+"</div>")
                            $(".studyroom-reserv-paylist>div").eq(i).children("div").append("<ul><li>" +
                                ""+$(".studyroom-reserv-form>div").eq(i).children("input[name=\"room\"]").val()+"</li>" +
                                "<li>예약시간) "+$(".studyroom-reserv-form>div").eq(i).children("input[name=\"time\"]").val()+"</li></ul>")
                            $(".studyroom-reserv-paylist>div").eq(i).children("div").append("<div>총 "+
                                $(".studyroom-reserv-form>div").eq(i).children("input[name=\"time\"]").val().split(",").length+"시간 / "+
                                $(".studyroom-reserv-form>div").eq(i).children("input[name=\"headcount\"]").val()+"인 / "+
                                parseInt($(".studyroom-reserv-form>div").eq(i).children("input[name=\"pay\"]").val()).toLocaleString('en-US')+"원</div>")

                            totalWon += parseInt($(".studyroom-reserv-form>div").eq(i).children("input[name=\"pay\"]").val())
                        }

                        $(".studyroom-reserv-paylist+div>div:last-of-type").html($(".studyroom-reserv-paylist>div").length+"건")
                        $(".studyroom-reserv-paylist+div+div>div:last-of-type").html(totalWon.toLocaleString('en-US')+"원")
                        $(".studyroom-reserv-paylist-username").val($("input[name='userName']").val())
                        $(".studyroom-reserv-paylist-useremail").val($("input[name='userEmail']").val())
                        $("#studyroom-reserv-receipt .modal-body > button:nth-of-type(1)").html("총 "+$(".studyroom-reserv-paylist>div").length+"건 | <b>"+totalWon.toLocaleString('en-US')+"</b>원 결제하기")

                    } else{
                        alert("예약을 추가해 주세요.")
                    }
                } else {
                    alert("접근이 제한된 사용자 입니다.")
                }
            } else{
                alert("로그인 후 이용 가능합니다.")
            }

        })

        $("#studyroom-reserv-receipt .modal-body > button:nth-of-type(1)").click(function (){

            if($(".personalInfo").is(':checked')){
                IMP.init('imp02841035');
                IMP.request_pay({
                    pg : document.querySelector('input[type=radio][name=paymentMethod]:checked').getAttribute("value"),
                    pay_method : 'card',
                    merchant_uid : 'merchant_' + new Date().getTime(),
                    name : 'JustStudy',
                    amount : $("#studyroom-reserv-receipt .modal-body > button:nth-of-type(1)>b").html().replaceAll(",", ""),
                    buyer_name : $("input[name=userName]").val(),
                    buyer_tel : $("input[name=userPhone]").val()
                }, function(rsp) {
                    if ( rsp.success ) {
                        var msg = '결제가 완료되었습니다.';
                        $(".studyroom-reserv-form>input[name=orderId]").attr("value", rsp.imp_uid)
                        $(".studyroom-reserv-form>input[name=paymentMethod]").attr("value", document.querySelector('input[type=radio][name=paymentMethod]:checked').getAttribute("value"))
                        $(".studyroom-reserv-form").submit()
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            } else{
                alert("이용규칙, 취소 및 환불규칙, 개인정보 수집 및 이용, 개인정보 제3자 제공에 동의해주세요.")
            }
        })
</script>