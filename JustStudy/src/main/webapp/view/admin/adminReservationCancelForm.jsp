<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-25
  Time: 오후 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r4").attr("checked", true)

    $(".admin-template-header>b").html("예약 취소")
    $(".admin-template-header>div").append("<input type=button class='admin-reserv-cancel-submit' value='완료'/>")

</script>

<style type="text/css">
    .admin-reserv-cancel-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-reserv-cancel-table {
        width: 470px;
        height: 450px;
        border-collapse: collapse;
    }

    .admin-reserv-cancel-table th{
        width: 120px;
        height: 50px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .admin-reserv-cancel-table td{
        width: 350px;
        padding: 5px 0px 5px 10px;
        font-size: 13px;
        border: 1px solid rgb(97, 88, 88);
    }
</style>
<div class="admin-reserv-cancel-main">
    <form action="AdminReservationCancelReg" class="admin-reserv-cancel-form">
        <table cellspacing="0" class="admin-reserv-cancel-table">
            <input type="hidden" name="reservId" value="${reservationDTO.id}"/>
            <tr>
                <th>주문번호</th>
                <td>${reservationDTO.orderId}</td>
            </tr>
            <tr>
                <th>사용자아이디</th>
                <td>${memberDTO.mem_userid}</td>
            </tr>
            <tr>
                <th>사용자이름</th>
                <td>${memberDTO.mem_realname}</td>
            </tr>
            <tr>
                <th>지역</th>
                <td>${reservationDTO.city}</td>
            </tr>
            <tr>
                <th>지점명</th>
                <td>${reservationDTO.branch}</td>
            </tr>
            <tr>
                <th>룸타입</th>
                <td>${reservationDTO.room}</td>
            </tr>
            <tr>
                <th>이용일자</th>
                <td>${reservationDTO.resDate}</td>
            </tr>
            <tr>
                <th>시간</th>
                <td>${reservationDTO.time}</td>
            </tr>
            <tr>
                <th>취소사유</th>
                <td>
                    <label><input type="radio" name="cancel-reason" value="임시휴일">임시휴일</label>
                    <label><input type="radio" name="cancel-reason" value="예약중복">예약중복</label>
                    <label><input type="radio" name="cancel-reason" value="시설보수">시설보수</label>
                    <label><input type="radio" name="cancel-reason" value="기타">기타</label>
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    $(".admin-reserv-cancel-submit").click(function () {
        if ($("input[name=cancel-reason]:checked").length == 0) {
            alert("취소사유를 선택해주세요.")
        } else {
            if (confirm("정말 취소하시겠습니까?")) {
                $(".admin-reserv-cancel-form").submit()
            }
        }
    })
</script>