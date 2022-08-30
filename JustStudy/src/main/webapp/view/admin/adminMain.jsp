<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-13
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
    $(".admin-template-header>b").html("관리자 메인")
</script>
    <style>

        #main{
            padding-top: 40px;
        }

        #main > h4{
            margin: 0px 0px 25px 20px;
        }

        table{
            width: 500px;
            border: 1px solid rgb(122, 115, 115);
            margin: 10px 0px 40px 30px;
            font-size: 13px;
        }

        tr:nth-of-type(1){
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
            height: 20px;
        }

        tr:nth-of-type(2n+3){
            background: rgba(227, 233, 240, 0.726);
        }

        tr:nth-of-type(1) > th{
            height: 20px;
        }

        a{
            text-decoration: none;
            color: rgba(83, 104, 167, 0.856);

        }

        th{
            border: 1px solid rgb(97, 88, 88);
            padding: 5px;
        }

        td{
            border: 1px solid rgb(97, 88, 88);
            padding: 5px;
            text-align: center;
        }

    </style>

    <div id="main">
        <h4>금일 예약 현황</h4>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th width="70">지역</th>
                <th width="100">지점</th>
                <th width="100">예약 수</th>
                <th width="60">관리</th>
            </tr>
            <c:choose>
                <c:when test="${today_Reserv==0}">
                    <tr>
                        <th colspan="4">금일 예약이 없습니다</th>
                    </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${todayReservation}" var="todayReservation">
                        <tr>
                            <form action="AdminReservDetailList" method="get">
                                <input type="hidden" name="city" value="${todayReservation.city}">
                                <input type="hidden" name="branch" value="${todayReservation.branch}">
                                <input type="hidden" name="useDate" value="${todayReservation.useDate}">
                                <td>${todayReservation.city}</td>
                                <td>${todayReservation.branch}</td>
                                <td>${todayReservation.cnt}</td>
                                <td><button type="submit">상세보기</button></td>
                            </form>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </table>

        <h4>미답변 1:1 문의 : <a href="AdminInquiryUnansweredList">${unanswered}개</a></h4>

</div>