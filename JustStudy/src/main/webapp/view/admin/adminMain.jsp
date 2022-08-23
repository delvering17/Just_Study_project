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
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        #headline{
            width: 1400px;
            height: 40px;
            background: #fff;
            border-bottom: 1px solid rgb(184, 177, 177);
            padding-top: 15px;
            padding-left: 20px;
            margin-top: 50px;
            margin-left: 239px;
            position: fixed;

        }

        #main{
            width: 1300px;
            height: 2000px;
            margin: 0px 0px 0px 220px;
            padding: 120px 20px 20px 20px;
        }

        #main > h5{
            margin: 0px 0px 10px 20px;
        }

        table{
            border: 1px solid rgb(122, 115, 115);
            margin: 10px 0px 10px 20px;
            font-size: 13px;
        }



        tr:nth-of-type(1){
            background: rgba(72, 92, 117, 0.801);
            color: #fff;
        }

        tr:nth-of-type(1) > th{
            height: 20px;
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
    <meta charset="UTF-8">
    <title>main</title>

    <div id="headline"><h3>관리자메인</h3></div>

    <div id="main">
        <h5>오늘 예약 현황</h5>
        <h5>총 예약 수:${todayReservationAmount}</h5>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th width="70">지역</th>
                <th width="100">지점</th>
                <th width="100">예약 수</th>
                <th width="60">관리</th>
            </tr>

            <c:forEach items="${todayReservation}" var="todayReservation" varStatus="no">
                <tr>
                    <form action="AdminReservDetailList" method="get">
                        <input type="hidden" name="city" value="${todayReservation.city}">
                        <input type="hidden" name="branch" value="${todayReservation.branch}">
                        <td>${todayReservation.city}</td>
                        <td>${todayReservation.branch}</td>
                        <td>${todayReservation.reservationCount}</td>
                        <td><button type="submit">상세보기</button></td>
                    </form>
                </tr>
            </c:forEach>
        </table>

        <h5>1:1문의</h5>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th width="100">그룹</th>
                <th width="100">게시판</th>
                <th width="400">제목</th>
                <th width="100">이름</th>
                <th width="100">일시</th>
            </tr>
            <tr>
                <th>화성 스터디 룸</th>
                <th>후기</th>
                <th>우와 너무 싸요</th>
                <th>송찬욱</th>
                <th>2022-08-12</th>
            </tr>
            <tr>
                <th>사당 스터디 룸</th>
                <th>자유게시판</th>
                <th>여기 주변에 맛집 많아요</th>
                <th>송지은</th>
                <th>2022-08-13</th>
            </tr>
            <tr>
                <th>수원 스터디 룸</th>
                <th>1:1 문의</th>
                <th>옆 방이 자꾸 떠들어요</th>
                <th>김지원</th>
                <th>2022-07-24</th>
            </tr>
            <tr>
                <th>인천 스터디 룸</th>
                <th>후기</th>
                <th>스터디 끝나고 술 한 잔은 국룰이지</th>
                <th>김한솔</th>
                <th>2022-08-01</th>
            </tr>

        </table>

    </div>

