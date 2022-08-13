<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.DAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="reservation_p.Studyroom" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-11
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
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

        .studyroom-reserv-innerlist > label > div,
        .studyroom-reserv-innerlist-time > label > div {
            border-bottom: 1px solid lightgray;
            height: 60px;
            padding-left: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
            cursor: pointer;
        }

        .studyroom-reserv-innerlist > input[type=radio]:checked + label > div {
            background: lightgray;
        }

        .studyroom-reserv-innerlist-time > label > div {
            justify-content: left;
        }

        .studyroom-reserv-innerlist-time > label > div >div:last-of-type {
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

        .fa-calendar-days {
            width: 60px;
            height: 60px;
            color: white;
            background: #060030;
            line-height: 60px;
            text-align: center;
            float: right;
        }

        .studyroom-reserv-innerlist {
            overflow: auto;
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
            margin-left: 20px;
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

        #studyroom-reserv-receipt > div > div > div:first-of-type {
            height: 100px;
            border: none;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(1) {
            margin-top: 10px;
            margin-bottom: 30px;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            background: white;
            padding: 20px;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(1) > div:first-of-type {
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(1) > ul > li {
            font-size: 1rem;
            font-weight: bold;
            height: 30px;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(1) > div:last-of-type {
            text-align: right;
            font-size: 1.3rem;
            font-weight: bold;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(2),
        #studyroom-reserv-receipt .modal-body > div:nth-of-type(3),
        #studyroom-reserv-receipt .modal-body > div:nth-of-type(4) {
            width: 100%;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(4) {
            margin-bottom: 40px;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(2) > div {
            width: fit-content;
            font-size: 1.1rem;
            font-weight: bold;
        }

        #studyroom-reserv-receipt .modal-body > div:nth-of-type(3) > div,
        #studyroom-reserv-receipt .modal-body > div:nth-of-type(4) > div {
            width: fit-content;
            font-size: 1.3rem;
            font-weight: bold;
            color: darkred;
        }

        #studyroom-reserv-receipt input[type=text] {
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
            margin-top: 70px;
            background: darkred;
        }

        #studyroom-reserv-receipt .modal-body > button:nth-of-type(2) {
            background: #B1997A;
        }

    </style>

    <script type="text/javascript">
        window.onload = function () {

            $('input[name="cityName"]').change(function () {

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
            })

            $(document).on("change", "input[name=\"branchName\"]", function(){

                console.log($(".studyroom-reserv-headcount:first-of-type+b").html())

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
            });

            $(".studyroom-reserv-time > div > .fa-angle-left").click(function (){
                let nowDate = new Date($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
                nowDate.setDate(nowDate.getDate() - 1);
                if(nowDate >= new Date().setDate(new Date().getDate()-1)){
                    $(".studyroom-reserv-time > div > .fa-angle-left + div").html(nowDate.getFullYear()+"-"+(nowDate.getMonth() > 8 ? "" : "0")+(nowDate.getMonth()+1)+"-"+(nowDate.getDate() > 9 ? "" : "0")+nowDate.getDate()+" ("+"일월화수목금토".split("")[nowDate.getDay()]+")")
                    $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
                } else{

                }
            })

            $(".studyroom-reserv-time > div > .fa-angle-right").click(function (){
                let nowDate = new Date($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
                nowDate.setDate(nowDate.getDate() + 1);
                $(".studyroom-reserv-time > div > .fa-angle-left + div").html(nowDate.getFullYear()+"-"+(nowDate.getMonth() > 8 ? "" : "0")+(nowDate.getMonth()+1)+"-"+(nowDate.getDate() > 9 ? "" : "0")+nowDate.getDate()+" ("+"일월화수목금토".split("")[nowDate.getDay()]+")")
                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(1)>b").html($(".studyroom-reserv-time > div > .fa-angle-left + div").html())
            })

            $(document).on("change", "input[name=\"roomName\"]", function(){

                console.log(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                $.ajax({
                    url: '<c:url value="/nonView/SetReservationItems"/>',
                    type: "GET",
                    async: false,
                    data: "type=setTime&roomName="+document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id")
                        +"&branchName="+document.querySelector('input[type=radio][name=branchName]:checked').getAttribute("id"),
                    success: function(data){
                        $(".studyroom-reserv-time>.studyroom-reserv-innerlist-time").html(decodeURIComponent(data))
                        $(".studyroom-reserv-selected>div:nth-of-type(1)>div:nth-of-type(3)>b").html(document.querySelector('input[type=radio][name=roomName]:checked').getAttribute("id"))
                    },
                    error: function (e){
                        console.log(e.responseText)
                    }
                })
            });

            $(document).on("change", "input[name=\"time\"]", function (){
                console.log(document.querySelectorAll('input[type=checkbox][name=time]:checked').length)

                let str = document.querySelector('input[type=checkbox][name=time]:checked+label>div>div:last-of-type').innerHTML
                    + ((document.querySelectorAll('input[type=checkbox][name=time]:checked').length - 1) > 0 ? " 외 "+(document.querySelectorAll('input[type=checkbox][name=time]:checked').length - 1)+"건" : "")

                $(".studyroom-reserv-selected>div:nth-of-type(2)>div:nth-of-type(2)>b").html(str)

                $(".studyroom-reserv-totalprice").html($(".studyroom-reserv-headcount:last-of-type+font>b").html()
                    * document.querySelectorAll('input[type=checkbox][name=time]:checked').length
                    * $(".studyroom-reserv-headcount:first-of-type+b").html())
            })

        }
    </script>
</head>

<body>

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
                <i class="fa-solid fa-calendar-days fa-2x"></i>
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
        <div>
            <div>1</div>
            <div>서울 | 천호점 | 룸2(4인실) | 2022-08-11 | 22:00~23:00 | 3인</div>
            <button><i class="fa-regular fa-x fa-2x"></i></button>
            <div>4,500원</div>
        </div>
    </div>

    <div class="studyroom-reserv-done">
        <button data-bs-toggle="modal" data-bs-target="#studyroom-reserv-receipt">총 2건 | 9000원 결제하기</button>
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
                <font size="5px"><b>서울 | 천호점</b></font>
                <div>
                    <div>2022.08.11(목)</div>
                    <ul>
                        <li>룸2(4인실)</li>
                        <li>예약시간 | 22:00, 23:00</li>
                    </ul>
                    <div>총 2시간 | 10,000원</div>
                </div>
                <div>
                    <div>총 예약 금액</div>
                    <div>10,000원</div>
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
                <input type="text" value="송지은"/>
                <input type="text" value="01027628090"/>
                <div><font size="5px"><b>결제 수단 선택</b></font></div>
                <label><input type="radio" name="paymentMethod">신용카드</label>
                <label><input type="radio" name="paymentMethod">카카오페이</label>

                <div><font size="2px" color="darkred"><b>*예약 복수 선택 시 환불 기간이 지나면 취소가 어려우니 유의바랍니다.</b></font></div>
                <div><font size="2px" color="darkred"><b>(환불기간: 예약 시작시간 48시간 이전부터 취소/환불 불가)</b></font></div>

                <label><input type="checkbox"><font size="2px">이용규칙, 취소 및 환불규칙, 개인정보 수집 및 이용, 개인정보 제3자 제공에 동의하실 경우
                    클릭해주세요.</font></label>

                <button>총 2건 | 10,000원 결제하기</button>
                <button data-bs-dismiss="modal">다시 선택하기</button>
            </div>
        </div>
    </div>
</div>

</body>

</html>
