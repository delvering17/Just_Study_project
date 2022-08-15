<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ReservationDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .mypage-reservlist {
        width: 800px;
        background: #F5F5F5;

    }

    .mypage-reservlist-top {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        font-size: 1rem;
        /* text-align: center; */
    }

    .mypage-reservlist-top > p {
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

    .mypage-reservlist-period {
        width: 60px;
        height: 40px;
        border: 1px solid #a9a8a8;
        background: rgba(0, 0, 0, 0);
        text-align: center;
        line-height: 40px;
    }

    input[name=period]:checked + .mypage-reservlist-period {
        background: lightgray;
    }

    .mypage-reservlist > .mypage-reservlist-top > .mypage-reservlist-top-datepicker {
        width: 150px;
        height: 40px;
    }

    #submit-find {
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .mypage-reservlist-main {
        width: 100%;
    }

    .mypage-reservlist-table {
        margin-top: 20px;
        margin-bottom: 30px;
        table-layout: fixed;
        word-break: break-all;
        border-top: 1px solid black;
    }

    .mypage-reservlist-table > tbody > tr > td {
        height: 60px;
        padding: 10px 0px 10px 0px;
        text-align: center;
    }

    .mypage-reservlist-table > tbody > tr > td:nth-of-type(1),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(3),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(4){
        width: 14%;
    }

    .mypage-reservlist-table > tbody > tr > td:nth-of-type(2),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(5),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(7),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(8),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(9)
    {
        width: 10%;
    }

    .mypage-reservlist-table > tbody > tr > td:nth-of-type(6){
        width: 8%;
    }

    .mypage-reservlist-table > tbody > tr:nth-of-type(1){
        font-weight: bold;
    }

    .mypage-reservlist-table > tbody > tr{
        border-bottom: 1px solid lightgray;
    }

    .mypage-reservlist-review{
        height: 30px;
        border-radius: 10px;
        border: none;
        background: darkslateblue;
        color: white;
    }

    .mypage-reservlist-cancle{
        height: 30px;
        border-radius: 10px;
        border: none;
        background: darkred;
        color: white;
    }

</style>

<div class="mypage-reservlist">
    <div class="mypage-reservlist-top">
        <div class="top-dateselect-wrapper">
            <label for="all"><input type="radio" name="period" id="all" checked hidden>
                <div class="mypage-reservlist-period">전체</div>
            </label>
            <label for="today"><input type="radio" name="period" id="today" hidden>
                <div class="mypage-reservlist-period">오늘</div>
            </label>
            <label for="sevenDays"><input type="radio" name="period" id="sevenDays" hidden>
                <div class="mypage-reservlist-period">7일</div>
            </label>
            <label for="oneMonth"><input type="radio" name="period" id="oneMonth" hidden>
                <div class="mypage-reservlist-period">1개월</div>
            </label>
            <label for="threeMonths"><input type="radio" name="period" id="threeMonths" hidden>
                <div class="mypage-reservlist-period">3개월</div>
            </label>
        </div>

        <input class="mypage-reservlist-top-datepicker" type="date">
        <p>&#126;</p>
        <input class="mypage-reservlist-top-datepicker" type="date">
        <button type="submit" class="mypage-reservlist-period" id="submit-find">조회</button>
    </div>

    <div class="mypage-reservlist-main">
        <table class="mypage-reservlist-table">
            <tr>
                <td>결제일자</td>
                <td>지점</td>
                <td>룸타입</td>
                <td>이용일자</td>
                <td>시간</td>
                <td>인원</td>
                <td>결제금액</td>
                <td>상태</td>
                <td></td>
            </tr>
            <%
                ArrayList<ReservationDTO> myReservation = (ArrayList<ReservationDTO>) request.getAttribute("myReservation");
                for (ReservationDTO dto : myReservation) {
            %>
            <tr>
                <td><%=dto.getResDate()%></td>
                <td><%=dto.getBranch()%></td>
                <td><%=dto.getRoom()%></td>
                <td><%=dto.getUseDate()%></td>
                <td><%=dto.getTime().replaceAll(",", "</br>")%></td>
                <td><%=dto.getHeadcount()%></td>
                <td><%=dto.getPay()%></td>
                <td><%=dto.getStatus()%></td>
                <td>
                <%if(dto.getStatus().equals("이용완료")){%>
                    <button class="mypage-reservlist-review">후기 작성</button>
                <%} else if(dto.getStatus().equals("이용전")){%>
                    <button class="mypage-reservlist-cancle">예약 취소</button>
                <%}%>
                </td>
            </tr>
            <%}%>
        </table>
    </div>

</div>