<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.ReservationDTO" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        justify-content: space-evenly;
        font-size: 1rem;
        /* text-align: center; */
    }

    .mypage-reservlist-top > p {
        /* font-size: 1.2rem; */
        width: fit-content;
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
        width: 800px;
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
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(4) {
        width: 110px;
    }

    .mypage-reservlist-table > tbody > tr > td:nth-of-type(2),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(5),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(7),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(8),
    .mypage-reservlist-table > tbody > tr > td:nth-of-type(9) {
        width: 80px;
    }

    .mypage-reservlist-table > tbody > tr > td:nth-of-type(6) {
        width: 70px;
    }

    .mypage-reservlist-table > tbody > tr:nth-of-type(1) {
        font-weight: bold;
    }

    .mypage-reservlist-table > tbody > tr {
        border-bottom: 1px solid lightgray;
    }

    .mypage-reservlist-review {
        height: 30px;
        border-radius: 10px;
        border: none;
        background: darkslateblue;
        color: white;
    }

    .mypage-reservlist-review-done {
        height: 30px;
        border-radius: 10px;
        border: none;
        background: gray;
        color: white;
    }

    .mypage-reservlist-cancle {
        height: 30px;
        border-radius: 10px;
        border: none;
        background: darkred;
        color: white;
    }

    .mypage-reservlist-menu {
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

    input[name=mypage-reservlist-type]:checked + label > p {
        font-weight: bold;
        color: black;
    }

</style>

<div class="mypage-reservlist">
    <form action="MyReservationList" class="mypage-reservlist-form">
        <input type="hidden" name="type" value="${param.type}"/>
        <div class="mypage-reservlist-top">
            <div class="top-dateselect-wrapper">
                <label><input type="radio" class="input-radio" name="period" value="all" checked hidden>
                    <div class="mypage-reservlist-period">전체</div>
                </label>
                <label><input type="radio" class="input-radio" name="period" value="today" hidden>
                    <div class="mypage-reservlist-period">오늘</div>
                </label>
                <label><input type="radio" class="input-radio" name="period" value="sevenDays" hidden>
                    <div class="mypage-reservlist-period">7일</div>
                </label>
                <label><input type="radio" class="input-radio" name="period" value="oneMonth" hidden>
                    <div class="mypage-reservlist-period">1개월</div>
                </label>
                <label><input type="radio" class="input-radio" name="period" value="threeMonths" hidden>
                    <div class="mypage-reservlist-period">3개월</div>
                </label>
            </div>

            <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" var="today"/>
            <c:if test="${param.type == \"done\"}">
                <input class="mypage-reservlist-top-datepicker" type="date" name="startDate" max="${today}">
                <p>&#126;</p>
                <input class="mypage-reservlist-top-datepicker" type="date" name="endDate" max="${today}">
            </c:if>

            <c:if test="${param.type == \"will\"}">
                <input class="mypage-reservlist-top-datepicker" type="date" name="startDate" min="${today}">
                <p>&#126;</p>
                <input class="mypage-reservlist-top-datepicker" type="date" name="endDate" min="${today}">
            </c:if>

            <button type="button" class="mypage-reservlist-period" id="submit-find">조회</button>
        </div>
        <label><input type="radio" name="period" value="mypick" hidden></label>
    </form>


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
            <c:choose>
                <c:when test="${myReservation.size() != 0}">
                    <c:forEach items="${myReservation}" var="myreserv" varStatus="no">
                        <tr>
                            <form action="MypageReview" class="mypage-reservlist-review-form">
                                <input type=hidden name="reservId" value="${myreserv.id}"/>
                                <td>${myreserv.resDate}</td>
                                <td>${myreserv.branch}</td>
                                <td>${myreserv.room}</td>
                                <td>${myreserv.useDate}</td>
                                <td>${fn:replace(myreserv.time, ', ', '<br/>')}</td>
                                <td>${myreserv.headcount}</td>
                                <td><fmt:formatNumber value="${myreserv.pay }" type="number"/></td>
                                <td>${myreserv.status}</td>
                                <c:choose>
                                    <c:when test="${param.type == \"done\"}">
                                        <c:choose>
                                            <c:when test="${myreserv.status == \"결제완료\"}">
                                                <c:choose>
                                                    <c:when test="${myreserv.review == 0}">
                                                        <td>
                                                            <button class="mypage-reservlist-review">후기 작성</button>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${myreserv.review == 1}">
                                                        <td>
                                                            <button type="button" class="mypage-reservlist-review-done">후기 조회</button>
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${myreserv.status == \"관리자취소\"}">
                                                <td>${myreserv.cancelReason}</td>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${param.type == \"will\"}">
                                        <c:choose>
                                            <c:when test="${myreserv.status == \"결제완료\"}">
                                                <td>
                                                    <button type="button" class="mypage-reservlist-cancle">예약 취소</button>
                                                </td>
                                            </c:when>
                                            <c:when test="${myreserv.status == \"관리자취소\"}">
                                                <td>${myreserv.cancelReason}</td>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </form>
                        </tr>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="9">일치하는 항목이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>

        </table>
    </div>
</div>

<script type="text/javascript">

    $(".input-radio").each(function (key, value) {
        if (value.getAttribute("value") == "${param.period}") {
            value.setAttribute("checked", true)
        }
    })

    $(".mypage-reservlist-top-datepicker").change(function () {
        $("input[value=mypick]").prop('checked', true)
    })


    $(".mypage-reservlist-review-done").click(function () {

        location.href = "MypageReviewDetail?reservId=" + $(this).parent().parent().children("input[name=reservId]").val()
    })

    $("input[name=period]").change(function () {
        if ($("input[name=period]:checked").attr("id") != "mypick") {
            $(".mypage-reservlist-top-datepicker").val("")
        }
    })

    $(".mypage-reservlist-top-datepicker").eq(1).change(function () {
        if ($(".mypage-reservlist-top-datepicker").eq(0).val() > $(".mypage-reservlist-top-datepicker").eq(1).val()) {
            $(".mypage-reservlist-top-datepicker").eq(0).val($(".mypage-reservlist-top-datepicker").eq(1).val())
        }
    })

    $(".mypage-reservlist-top-datepicker").eq(0).change(function () {
        if ($(".mypage-reservlist-top-datepicker").eq(0).val() > $(".mypage-reservlist-top-datepicker").eq(1).val()) {
            $(".mypage-reservlist-top-datepicker").eq(1).val($(".mypage-reservlist-top-datepicker").eq(0).val())
        }
    })

    $("input[name=mypage-reservlist-type]").each(function (key, value) {
        if (value.getAttribute("id") == "${param.type}") {
            value.setAttribute("checked", true);
        }
    })

    $("input[name=mypage-reservlist-type]").change(function () {
        let find_url = "?type=" + $("input[name=mypage-reservlist-type]:checked").attr("id") + "&period=all";
        location.href = find_url
    })

    $("#submit-find").click(function () {
        if ($("input[name=period]:checked").val() == "mypick") {
            if ($(".mypage-reservlist-top-datepicker").eq(0).val() == "" || $(".mypage-reservlist-top-datepicker").eq(1).val() == "") {
                alert("날짜를 모두 선택해 주세요")
            } else {
                $(".mypage-reservlist-form").submit()
            }
        } else {
            $(".mypage-reservlist-form").submit()
        }
    })

    $(".mypage-reservlist-cancle").click(function () {
        if(confirm("정말 취소하시겠습니까?")){
            location.href = "../reservation/ReservationCancel?reservId="+$("input[name=reservId]").eq($(this).parent().parent().index("tr")-1).val()
        }
    })
</script>