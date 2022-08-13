<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-11
  Time: 오전 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .usageinfo-bg{
            width: 100%;
            height: fit-content;
            background: #F5F5F5;
            padding-top: 100px;
            padding-bottom: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .usageinfo-bg > h1 {
            width: fit-content;
            height: fit-content;
            margin-bottom: 50px;
            font-weight: bold;
        }

        .usageinfo-bg h5{
            margin-bottom: 30px;
            font-weight: bold;
        }

        .usageinfo-wrapper1{
            width: 1050px;
            height: fit-content;
            margin-bottom: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .usageinfo-wrapper1 > div:nth-of-type(1),
        .usageinfo-wrapper1 > div:nth-of-type(2),
        .usageinfo-wrapper1 > div:nth-of-type(4){
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-evenly;
            margin-bottom: 20px;
        }

        .usageinfo-wrapper1 > div:nth-of-type(3){
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .usageinfo-wrapper1 > div:first-of-type > div{
            width: 200px;
            font-size: 1.4rem;
            font-weight: bold;
            text-align: center;
        }

        .usageinfo-wrapper1 > div:nth-of-type(2) > div{
            width: 200px;
            height: 200px;
            border: 2px dashed #B1997A;
            border-radius: 100px;
        }

        .usageinfo-wrapper1 > div:nth-of-type(2) > div > i{
            width: 200px;
            height: 200px;
            color: #4a0500;
            line-height: 200px;
            text-align: center;
        }

        .usageinfo-wrapper1 > div:nth-of-type(3) > div:nth-of-type(2n-1){
            width: 20px;
            height: 20px;
            border: 3px solid darkred;
            border-radius: 20px;
        }

        .usageinfo-wrapper1 > div:nth-of-type(3) > div:nth-of-type(2n){
            width: 232px;
            height: 2px;
            border: 2px solid darkred;
        }

        .usageinfo-wrapper1 > div:nth-of-type(4) > div{
            width: 200px;
            font-size: 1.1rem;
            font-weight: bold;
            color: black;
            text-align: center;
        }

        .usageinfo-wrapper1 > div:last-of-type{
            margin-left: 100px;
            margin-top: 20px;
        }

        .usageinfo-wrapper1 > div:last-of-type > i{
            width: fit-content;
        }

        .usageinfo-wrapper1 > div:last-of-type > div{
            width: fit-content;
            display: inline-block;
            line-height: 30px;
        }

        .usageinfo-wrapper2{
            border: 1px solid lightgray;
            width: 1050px;
            height: fit-content;
            padding: 50px;
            margin-bottom: 30px;
            line-height: 200%;
        }

        .usageinfo-wrapper2 > .fa-check{
            width: fit-content;
        }
    </style>
    <title>이용 안내</title>
</head>
<script>
    window.onload=function (){
        ScrollReveal().reveal('.usageinfo-scroll', {
            interval:500,
            duration:1000,
            reset: true,
            easing: 'ease-out',
            distance: '50px'
        });
    }
</script>
<body>
<div class="usageinfo-bg">
    <h1>이용 안내</h1>
    <div class="usageinfo-wrapper1 usageinfo-scroll">
        <div>
            <div>STEP. 01</div>
            <div>STEP. 02</div>
            <div>STEP. 03</div>
            <div>STEP. 04</div>
        </div>
        <div>
            <div><i class="fa-solid fa-user-check fa-4x"></i></div>
            <div><i class="fa-solid fa-calendar-days fa-4x"></i></div>
            <div><i class="fa-solid fa-credit-card fa-4x"></i></div>
            <div><i class="fa-solid fa-door-open fa-4x"></i></div>
        </div>
        <div>
            <div></div><div></div><div></div><div></div><div></div><div></div><div></div>
        </div>
        <div>
            <div>회원가입 및 로그인</div>
            <div>실시간 예약신청</div>
            <div>결제</div>
            <div>스터디룸 이용</div>
        </div>
        <div>
            <i class="fa-solid fa-check"></i><div>&nbsp;예약은 최소 2시간부터 가능하며, 1시간 단위로 이용 가능합니다.</div><br/>
            <i class="fa-solid fa-check"></i><div>&nbsp;일부 매장은 최소 이용 인원이 있습니다.</div><br/>
            <i class="fa-solid fa-check"></i><div>&nbsp;각 지점별 룸타입, 운영시간, 이용요금 관련 내용은 지점찾기에서 확인하실 수 있습니다.</div><br/>
        </div>
    </div>
    <div class="usageinfo-wrapper2 usageinfo-scroll">
        <h5>교환환불규정</h5>
        <b>■ 스터디룸 취소/환불규정 (장기예약건/복수예약건 동일)</b><br/>
        <i class="fa-solid fa-check"></i> 시작시간 48시간 이전 부터 취소/환불 불가<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;Ex) 결제일: 10/28 ㅣ 예약 날짜, 시간: 11/28, 15:00 ~ 18:00 => 11/26 15:00 까지 취소/환불 가능<br/>
        <i class="fa-solid fa-check"></i> 당일 예약 및 이용당일 취소/변경/환불 불가<br/>
        <i class="fa-solid fa-check"></i> 인원/날짜/시간 변경은 불가합니다. 전체 취소 후 재결제 부탁드립니다.<br/>
        <i class="fa-solid fa-check"></i> 추가결제의 경우는 해당 매장에 문의해주세요.<br/>
        <i class="fa-solid fa-check"></i> 복수결제건은 고객이 전체취소만 가능하며, 부분취소를 할 수 없습니다.<br/>
        <i class="fa-solid fa-check"></i> 복수결제건 중 환불기간이 지난 건이 있으면 전체취소가 불가능합니다.<br/>
    </div>
    <div class="usageinfo-wrapper2 usageinfo-scroll">
        <h5>스터디룸 이용안내</h5>
        <i class="fa-solid fa-check"></i> 스터디룸은 예약제로 운영되며, 예약 없이 출입 및 이용하실 수 없습니다.<br/>
        <i class="fa-solid fa-check"></i> 스터디룸에 예약없이 무단 출입 및 이용할 경우(예약 인원 초과 이용 포함) 스터디룸 이용이 제한될 수 있습니다.<br/>
        <i class="fa-solid fa-check"></i> 스터디룸 내에는 음식물을 반입할 수 없습니다.<br/>
        <i class="fa-solid fa-check"></i> 스터디룸 내에서는 지나치게 큰 소리는 자제부탁드립니다.<br/>
        <i class="fa-solid fa-check"></i> 이용당일 시간 연장은 다른 예약자가 없을 경우에 한하여 가능합니다.<br/>
        <i class="fa-solid fa-check"></i> 입실은 예약시간 5분전부터 가능하며, 다음 이용자를 위하여 깨끗하게 자리정리 후 퇴실해주세요 (퇴실시간: 종료시간 5분전)<br/>
        <i class="fa-solid fa-check"></i> 예약인원에서 인원이 추가되는 경우 매장으로 유선연락 부탁드립니다.<br/>
        <i class="fa-solid fa-check"></i> 최대인원 초과 시 입실이 불가 할 수 있으며, 해당사유로 환불이 불가합니다.<br/>
        <i class="fa-solid fa-check"></i> 스터디룸 이용 시 시설물의 훼손, 분실에 대한 책임은 이용객에게 있으며, 손해배상 책임을 질 수 있습니다.<br/>
    </div>
</div>
</body>
</html>
