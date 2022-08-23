<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ReservationDTO" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    .mypage-reservlist-menu{
        width: 800px;
        height: 50px;
        margin-top: 20px;
    }

    .mypage-reservlist-menu > label > p {
        width: fit-content;
        height: fit-content;
        line-height: 50px;
        margin-left: 10px;
        margin-right: 20px;
        float: left;
        font-size: 1.2rem;
        color: gray;
    }

    input[name=mypage-reservlist-type]:checked + label > p{
        font-weight: bold;
        color: black;
    }

</style>



<div class="mypage-reservlist">
    <div class="mypage-reservlist-top">
        <div class="top-dateselect-wrapper">
            <label for="all"><input type="radio" class="input-radio" name="period" id="all" checked hidden>
                <div class="mypage-reservlist-period">전체</div>
            </label>
            <label for="today"><input type="radio" class="input-radio" name="period" id="today" hidden>
                <div class="mypage-reservlist-period">오늘</div>
            </label>
            <label for="sevenDays"><input type="radio" class="input-radio" name="period" id="sevenDays" hidden>
                <div class="mypage-reservlist-period">7일</div>
            </label>
            <label for="oneMonth"><input type="radio" class="input-radio" name="period" id="oneMonth" hidden>
                <div class="mypage-reservlist-period">1개월</div>
            </label>
            <label for="threeMonths"><input type="radio" class="input-radio" name="period" id="threeMonths" hidden>
                <div class="mypage-reservlist-period">3개월</div>
            </label>
        </div>

        <input class="mypage-reservlist-top-datepicker" type="date">
        <p>&#126;</p>
        <input class="mypage-reservlist-top-datepicker" type="date">
        <button type="submit" class="mypage-reservlist-period" id="submit-find">조회</button>

    </div>
    <label for="threeMonths"><input type="radio" name="period" id="mypick" hidden></label>

    <div class="mypage-reservlist-menu">
        <input type="radio" name="mypage-reservlist-type" id="done" hidden><label for="done"><p>이용완료</p></label>
        <input type="radio" name="mypage-reservlist-type" id="will" hidden><label for="will"><p>이용전</p></label>
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

            <c:forEach items="${myReservation}" var="myreserv" varStatus="no">
                <form action="MypageReview" class="mypage-reservlist-review-form">
                    <tr>
                        <input type="hidden" name="reservId" value="${myreserv.id}"/>
                        <td>${myreserv.resDate}</td>
                        <td>${myreserv.branch}</td>
                        <td>${myreserv.room}</td>
                        <td>${myreserv.useDate}</td>
                        <td>${fn:replace(myreserv.time, ', ', '<br/>')}</td>
                        <td>${myreserv.headcount}</td>
                        <td>${myreserv.pay}</td>
                        <td>${myreserv.status}</td>
                        <c:choose>
                            <c:when test="${param.type == \"done\"}">
                                <c:choose>
                                    <c:when test="${myreserv.review == 0}">
                                        <td>
                                            <button class="mypage-reservlist-review">후기 작성</button>
                                        </td>
                                    </c:when>
                                    <c:when test="${myreserv.review == 1}">
                                        <td>
                                            <button class="mypage-reservlist-review-done">후기 조회</button>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </c:when>
                            <c:when test="${param.type == \"will\"}">
                                <c:if test="${myreserv.status == \"결제완료\"}">
                                    <td>
                                        <button class="mypage-reservlist-cancle">예약 취소</button>
                                    </td>
                                </c:if>
                            </c:when>
                        </c:choose>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">
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
        $("input[id=mypick]").prop('checked', true);
    })


    $(".mypage-reservlist-review-done").click(function (){

        location.href = "MypageReviewDetail?reservId="+$(this).parent().parent().children("input[name=reservId]").val()
    })

    $("input[name=period]").change(function (){
        if($("input[name=period]:checked").attr("id") != "mypick"){
            $(".mypage-reservlist-top-datepicker").val("")
        }
    })

    $(".mypage-reservlist-top-datepicker").eq(1).change(function (){
        if($(".mypage-reservlist-top-datepicker").eq(0).val() > $(".mypage-reservlist-top-datepicker").eq(1).val()){
            $(".mypage-reservlist-top-datepicker").eq(0).val($(".mypage-reservlist-top-datepicker").eq(1).val())
        }
    })

    $(".mypage-reservlist-top-datepicker").eq(0).change(function (){
        if($(".mypage-reservlist-top-datepicker").eq(0).val() > $(".mypage-reservlist-top-datepicker").eq(1).val()){
            $(".mypage-reservlist-top-datepicker").eq(1).val($(".mypage-reservlist-top-datepicker").eq(0).val())
        }
    })

    $("input[name=mypage-reservlist-type]").each(function (key, value){
        if(value.getAttribute("id") == "${param.type}"){
            value.setAttribute("checked", true);
        }
    })

    $("input[name=mypage-reservlist-type]").change(function (){

        let find_url = "?type=" + $("input[name=mypage-reservlist-type]:checked").attr("id") ;

        location.href = find_url
    })

</script>