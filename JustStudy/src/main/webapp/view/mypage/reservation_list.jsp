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

    .mypage-reservlist-top-datepicker {
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

    .mypage-reservlist-review-done{
        height: 30px;
        border-radius: 10px;
        border: none;
        background: gray;
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

<script type="text/javascript">
    window.onload = function (){
        $("#submit-find").click(function (){

            $(".mypage-reservlist-table>tbody>tr").show()

            let start = new Date();
            let endDate = new Date();

            switch ($("input[name=period]:checked").attr("id")){
                case "all":
                    start = null;
                    break;
                case "today":
                    start = new Date();
                    break;
                case "sevenDays":
                    start.setDate(new Date().getDate() - 6)
                    break;
                case "oneMonth":
                    start.setMonth(new Date().getMonth() - 1)
                    start.setDate(new Date().getDate() + 1)
                    break;
                case "threeMonths":
                    start.setMonth(new Date().getMonth() - 3)
                    start.setDate(new Date().getDate() + 1)
                    break;
                case "mypick":
                    const startPick = $(".mypage-reservlist-top-datepicker:first-of-type").val()
                    start = new Date(startPick.split("-")[0], parseInt(startPick.split("-")[1]) - 1, parseInt(startPick.split("-")[2]))

                    const endPick = $(".mypage-reservlist-top-datepicker:last-of-type").val()
                    endDate = new Date(endPick.split("-")[0], parseInt(endPick.split("-")[1]) - 1, parseInt(endPick.split("-")[2]))

                    break;
            }

            if(start != null) {
                const startDate = new Date(start.getFullYear(), start.getMonth(), start.getDate())

                for (let i = 1; i < $(".mypage-reservlist-table>tbody>tr").length; i++) {
                    const useDate = $(".mypage-reservlist-table>tbody>tr").eq(i).children("td").eq(3)
                    const useDate2 = new Date(useDate.html().split("-")[0], parseInt(useDate.html().split("-")[1]) - 1, parseInt(useDate.html().split("-")[2]))

                    if (!(useDate2 >= startDate && useDate2 <= endDate)) {
                        useDate.parent("tr").hide()
                    }
                }
            }
        })

        $(".mypage-reservlist-top-datepicker").change(function (){
            $("input[id=mypick]").attr('checked', true);
        })


        $(".mypage-reservlist-review-done").click(function (){

            location.href = "MypageReviewDetail?reservId="+$(this).parent().parent().children("input[name=reservId]").val()
        })
    }
</script>

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
    <label for="threeMonths"><input type="radio" name="period" id="mypick" hidden></label>

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
                    for (ReservationDTO reservationDTO : myReservation) {
                %>
                <form action="MypageReview" class="mypage-reservlist-review-form">
                    <tr>
                        <input type="hidden" name="reservId" value="<%=reservationDTO.getId()%>"/>
                        <td><%=reservationDTO.getResDate()%></td>
                        <td><%=reservationDTO.getBranch()%></td>
                        <td><%=reservationDTO.getRoom()%></td>
                        <td><%=reservationDTO.getUseDate()%></td>
                        <td><%=reservationDTO.getTime().replaceAll(",", "</br>")%></td>
                        <td><%=reservationDTO.getHeadcount()%></td>
                        <td><%=reservationDTO.getPay()%></td>
                        <td><%=reservationDTO.getStatus()%></td>
                        <td>
                            <%if(reservationDTO.getStatus().equals("이용완료")){
                                if(reservationDTO.getReview() == 0){%>
                                    <button type=submit class="mypage-reservlist-review">후기 작성</button>
                              <%}else if(reservationDTO.getReview() == 1){%>
                                    <input type="button" class="mypage-reservlist-review-done" value="후기 조회"></input>
                              <%}
                            } else if(reservationDTO.getStatus().equals("이용전")){%>
                            <button class="mypage-reservlist-cancle">예약 취소</button>
                            <%}%>
                        </td>
                    </tr>
                </form>
                <%}%>
            </table>
        </div>

</div>