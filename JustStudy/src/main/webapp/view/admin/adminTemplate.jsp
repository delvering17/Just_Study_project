<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-13
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script type="text/javascript" src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script type="text/javascript" src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .admin-template-bg {
            width: 100%;
            height: 100%;
        }

        #hamburger, #r1, #r2, #r3, #r4, #r5 {
            display: none;
        }

        .admin-template-bg > header {
            width: 100%;
            height: 50px;
            position: fixed;
            background: rgba(16, 16, 170, 0.918);
        }

        .admin-template-bg > header > label:nth-of-type(1) {
            width: 50px;
            height: 50px;
            color: #fff;
            text-align: center;
            display: inline-block;
            float: left;
        }

        .admin-template-bg > header > label:nth-of-type(1) > i {
            width: 100%;
            line-height: 50px;
        }

        .admin-template-bg > header > label:nth-of-type(2) {
            width: 189px;
            height: 100%;
            background: rgba(16, 16, 170, 0.918);
            text-align: center;
            display: inline-block;
            float: left;
        }

        .admin-template-bg > header > label:nth-of-type(2) > a {
            color: #fff;
            cursor: pointer;
            text-decoration: none;
            line-height: 50px;
        }

        .admin-template-bg > header > a {
            color: #fff;
            margin-right: 20px;
            text-decoration: none;
            font-weight: bold;
            float: right;
            line-height: 50px;
        }

        .admin-template-content {
            width: 100%;
            height: 100%;
            display: flex;
        }

        .admin-template-content tr{
            width: 100%;
            height: 100%;
        }

        #hamburger:checked + .categoryitem {
            display: none;
        }

        .category {
            width: fit-content;
            height: 100%;
            display: flex;
/*            float: left;*/
            padding-top: 50px;
/*            position: fixed;*/
        }

        .categoryicon {
            width: 50px;
            height: 100%;
            background: rgba(175, 170, 170, 0.822);
/*            display: inline-block;
            float: left;*/
        }

        .categoryicon > div:nth-child(n) {
            width: 50px;
            height: 50px;
            text-align: center;
            background: rgba(175, 170, 170, 0.822);
            border-bottom: 1px solid rgb(167, 152, 152);
        }

        .categoryicon > div:nth-child(n) > label {
            cursor: pointer;
        }

        .categoryicon > div:nth-child(n) > label > i {
            width: 100%;
            height: 100%;
            line-height: 50px;
        }

        #r1:checked ~ div > div:nth-of-type(1),
        #r2:checked ~ div > div:nth-of-type(2),
        #r3:checked ~ div > div:nth-of-type(3),
        #r4:checked ~ div > div:nth-of-type(4),
        #r5:checked ~ div > div:nth-of-type(5) {
            background: #fff;
        }

        .categoryitem {
            width: 189px;
            height: 100%;
            background: #fff;
/*            display: inline-block;
            float: left;*/
            border-right: 1px solid #000;
            padding: 10px 40px;
        }

        ul {
            width: 138px;
            height: 100%;
            display: none;
        }

        ul > li {
            list-style: none;
            line-height: 40px;
        }

        ul > li:nth-of-type(1) {
            font-weight: 800;
        }

        ul > li:nth-of-type(n+2) {
            font-size: 13px;
        }

        ul > li > a {
            color: #000;
            cursor: pointer;
            text-decoration: none;
        }

        ul > li > a:hover {
            color: rgb(206, 19, 223);
        }

        #r1:checked ~ .categoryitem > ul:nth-of-type(1),
        #r2:checked ~ .categoryitem > ul:nth-of-type(2),
        #r3:checked ~ .categoryitem > ul:nth-of-type(3),
        #r4:checked ~ .categoryitem > ul:nth-of-type(4),
        #r5:checked ~ .categoryitem > ul:nth-of-type(5) {
            display: block;
        }

        .admin-main {
            width: 100%;
            max-height: 100%;
            overflow: auto;
            padding-top: 50px;
        }
    </style>
</head>
<body>


<div class="admin-template-bg">

    <header>
        <label for="hamburger"><i class="fa-solid fa-align-justify"></i></label>
        <label><a href="AdminPage">ADMINISTRATOR</a></label>
        <a href="../board/MainPage">홈</a>
    </header>

    <div class="admin-template-content">
            <div class="category">
                <input type="radio" id="r1" name="categorys" checked="checked"/>
                <input type="radio" id="r2" name="categorys"/>
                <input type="radio" id="r3" name="categorys"/>
                <input type="radio" id="r4" name="categorys"/>
                <input type="radio" id="r5" name="categorys"/>
                <div class="categoryicon">
                    <div><label for="r1"><i class="fa-solid fa-house"></i></label></div>
                    <div><label for="r2"><i class="fa-regular fa-address-card"></i></label></div>
                    <div><label for="r3"><i class="fa-solid fa-chart-line"></i></label></div>
                    <div><label for="r4"><i class="fa-regular fa-calendar-days"></i></label></div>
                    <div><label for="r5"><i class="fa-solid fa-list-check"></i></label></div>
                </div>
                <input type="checkbox" id="hamburger"/>
                <div class="categoryitem">
                    <ul>
                        <li>지점관리</li>
                        <li><a href="AdminStoreList">지점목록</a></li>
                        <li><a href="AdminStoreReview">이용후기</a></li>
                        <li><a href=""></a></li>
                    </ul>
                    <ul>
                        <li>회원 관리</li>
                        <li><a href="AdminUserList">회원 관리</a></li>
                        <li><a href="AdminBlackList">블랙리스트 관리</a></li>

                    </ul>
                    <ul>
                        <li>매출관리</li>
                        <li><a href="AdminSalesStore?city=전체&branch=전체">지점별 매출</a></li>
                        <li><a href="AdminSalesUser">회원별 매출</a></li>
                        <li><a href=""></a></li>
                    </ul>
                    <ul>
                        <li>예약관리</li>
                        <li><a href="AdminReservList">예약목록</a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                    </ul>
                    <ul>
                        <li>게시판 관리</li>
                        <li><a href="AdminEventList">이벤트 관리</a></li>
                        <li><a href="AdminNoticeList">공지사항 관리</a></li>
                        <li><a href="AdminNewsList">뉴스 관리</a></li>
                        <li><a href="AdminInquiryList">1:1문의</a></li>
                        <li><a href="AdminFAQList">FAQ</a></li>
                    </ul>
                </div>
            </div>
            <div class="admin-main">
                <jsp:include page="${adminUrl}"/>
            </div>
    </div>
</div>
</body>
</html>
