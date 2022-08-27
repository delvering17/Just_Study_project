<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-25
  Time: 오후 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>

<style type="text/css">
    .admin-reserv-cancel-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }
</style>
<div class="admin-reserv-cancel-main">
    <form action="AdminReservationCancelReg" class="admin-reserv-cancel-form">
        <table border="">
            <input type="hidden" name="reservId" value="${reservationDTO.id}"/>
            <tr>
                <td>주문번호</td>
                <td>${reservationDTO.orderId}</td>
            </tr>
            <tr>
                <td>사용자아이디</td>
                <td>${memberDTO.mem_userid}</td>
            </tr>
            <tr>
                <td>사용자이름</td>
                <td>${memberDTO.mem_realname}</td>
            </tr>
            <tr>
                <td>지역</td>
                <td>${reservationDTO.city}</td>
            </tr>
            <tr>
                <td>지점명</td>
                <td>${reservationDTO.branch}</td>
            </tr>
            <tr>
                <td>룸타입</td>
                <td>${reservationDTO.room}</td>
            </tr>
            <tr>
                <td>이용일자</td>
                <td>${reservationDTO.resDate}</td>
            </tr>
            <tr>
                <td>시간</td>
                <td>${reservationDTO.time}</td>
            </tr>
            <tr>
                <td>취소사유</td>
                <td>
                    <input type="radio" name="cancel-reason" value="임시휴일">임시휴일
                    <input type="radio" name="cancel-reason" value="예약중복">예약중복
                    <input type="radio" name="cancel-reason" value="시설보수">시설보수
                    <input type="radio" name="cancel-reason" value="기타">기타
                </td>
            </tr>
        </table>
        <button type="button" class="admin-reserv-cancel">완료</button>
    </form>
</div>

<script type="text/javascript">
    $(".admin-reserv-cancel").click(function () {
        if ($("input[name=cancel-reason]:checked").length == 0) {
            alert("취소사유를 선택해주세요.")
        } else {
            if (confirm("정말 취소하시겠습니까?")) {
                $(".admin-reserv-cancel-form").submit()
            }
        }
    })
</script>