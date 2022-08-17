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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script type="text/javascript" src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script type="text/javascript" src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }

        .wrapper{
            width: 100%;
            height: 100%;
        }


        #hamburger, #admin, #r1, #r2, #r3, #r4, #r5{
            display: none;
        }


        header{
            height: 50px;
            display: flex;
            position: fixed;

        }

        header > label:nth-of-type(1){
            width: 50px;
            background: rgba(2, 2, 114, 0.884);
            color: #fff;
            text-align: center;
            padding-top: 13px;

        }

        header > label:nth-of-type(2){
            width: 189px;
            height: 37px;
            background: rgba(16, 16, 170, 0.918);
            text-align: center;
            padding-top: 13px;
        }

        header > label:nth-of-type(2) > a{
            color: #fff;
            cursor: pointer;
            text-decoration: none;
        }

        #hamburger:checked~ .category > .categoryitem{
            display: none;
        }

        header > div{
            width: 1340px;
            height: 40px;
            background: rgb(49, 49, 197);
            text-align: right;
            padding-top: 10px;
            padding-right: 5px;
        }

        header > div > div:nth-of-type(1) > input{
            background: rgba(75, 84, 207, 0.897);
            color: #fff;
            border: 0;
            padding: 7px;
        }

        .category{
            width: 190px;
            height: 800px;
            display: flex;
            float: left;
            margin-top: 50px;
            position: fixed;
        }

        .categoryicon{
            width: 50px;
            height: 800px;
            background: rgba(175, 170, 170, 0.822);

        }

        .categoryicon > div:nth-child(n){
            width: 50px;
            height: 20px;
            padding: 15px 0px 15px 0px;
            text-align: center;
            background: rgba(175, 170, 170, 0.822);
            border-bottom: 1px solid rgb(167, 152, 152);
        }

        .categoryicon > div:nth-child(n) > label{
            cursor: pointer;
        }

        .categoryitem{
            background: #fff;
        }

        ul{
            width: 138px;
            height: 800px;
            margin-left: 50px;
            border-right: 1px solid #000;
            display: none;
        }

        ul > li{
            list-style: none;
            line-height: 40px;
        }

        ul > li:nth-of-type(1){
            font-weight: 800;
        }

        ul > li:nth-of-type(n+2){
            font-size: 13px;
        }

        ul > li > a{
            color: #000;
            cursor: pointer;
            text-decoration: none;
        }

        ul > li > a:hover{
            color: rgb(206, 19, 223);
        }

        #r1:checked~ .category > .categoryitem > ul:nth-of-type(1),
        #r2:checked~ .category > .categoryitem > ul:nth-of-type(2),
        #r3:checked~ .category > .categoryitem > ul:nth-of-type(3),
        #r4:checked~ .category > .categoryitem > ul:nth-of-type(4),
        #r5:checked~ .category > .categoryitem > ul:nth-of-type(5){
            display: block;
        }


        #r1:checked~ .category > .categoryicon > div:nth-of-type(1),
        #r2:checked~ .category > .categoryicon > div:nth-of-type(2),
        #r3:checked~ .category > .categoryicon > div:nth-of-type(3),
        #r4:checked~ .category > .categoryicon > div:nth-of-type(4),
        #r5:checked~ .category > .categoryicon > div:nth-of-type(5){
            background: #fff;
        }

    </style>

</head>

<body>
<div class="wrapper">

    <header>
        <label for="hamburger"><i class="fa-solid fa-align-justify"></i></label>
        <label for="admin"><a href="AdminPage">ADMINISTRATOR</a></label>
        <div>
            <div>
                <input type="button" value="매장"/>
                <input type="button" value="홈"/>
                <input type="button" value="부가서비스"/>
                <input type="button" value="관리자"/>
            </div>

        </div>

    </header>

    <input type="checkbox" id="hamburger"/>
    <input type="checkbox" id="admin"/>
    <input type="radio" id="r1" name="categorys" checked="checked"/>
    <input type="radio" id="r2" name="categorys"/>
    <input type="radio" id="r3" name="categorys"/>
    <input type="radio" id="r4" name="categorys"/>
    <input type="radio" id="r5" name="categorys"/>


    <div class="category">
        <div class="categoryicon">
            <div><label for="r1"><i class="fa-regular fa-address-card"></i></label></div>
            <div><label for="r2"><i class="fa-solid fa-house"></i></label></div>
            <div><label for="r3"><i class="fa-solid fa-chart-line"></i></label></div>
            <div><label for="r4"><i class="fa-regular fa-calendar-days"></i></label></div>
            <div><label for="r5"><i class="fa-solid fa-list-check"></i></label></div>
        </div>
        <div class="categoryitem">
            <ul>
                <li>회원관리</li>
                <li><a href="AdminUserList">회원관리</a></li>

            </ul>
            <ul>
                <li>지점관리</li>
                <li><a href="AdminStoreList">지점목록</a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
            </ul>
            <ul>
                <li>매출관리</li>
                <li><a href="">회원매출</a></li>
                <li><a href="">지점매출</a></li>
                <li><a href=""></a></li>
            </ul>
            <ul>
                <li>예약관리</li>
                <li><a href="">예약관리</a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
            </ul>
            <ul>
                <li>게시판관리</li>
                <li><a href="">게시판관리</a></li>
                <li><a href="">게시판그룹관리</a></li>
                <li><a href="">1:1문의</a></li>
            </ul>
        </div>
    </div>
    <jsp:include page="${adminUrl}"/>
</div>
</body>
</html>
