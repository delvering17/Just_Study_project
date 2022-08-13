<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-10
  Time: 오후 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .mypage-menu-bg {
            width: 30%;
            height: 700px;
            padding-top: 100px;
            background: #F5F5F5;
            display: flex;
            flex-direction: column;
            align-items: end;
        }

        .mypage-menu-wrapper {
            width: fit-content;
        }

        .fa-circle-user {
            width: fit-content;
            margin-right: 10px;
        }

        .mypage-menu-user-info {
            width: fit-content;
            display: inline-block;
            margin-bottom: 50px;
            margin-right: 40px;
        }

        .menu-list-wrapper {
            height: 350px;
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 40px;
            background: #EFEFEF;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        .menu-list-wrapper > div > i {
            text-align: center;
            width: 30px;
            margin-right: 20px;
            font-size: 1.5rem;
        }

        .menu-list-wrapper > div > a {
            text-decoration: none;
            font-size: 1.1rem;
            color: black;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="mypage-menu-bg">
    <div class="mypage-menu-wrapper">
        <i class="fa-solid fa-circle-user fa-5x" style="color:gray"></i>
        <div class="mypage-menu-user-info">
            <font size="6rem"><b>송지은</b></font>
            <font size="4.5rem"><b>님</b></font><br/>
            <font size="4.5rem" color="gray"><b>dieunn@naver.com</b></font>
        </div>
        <div class="menu-list-wrapper">
            <div>
                <i class="fa-solid fa-pen-to-square"></i>
                <a href="">회원 정보 수정</a>
            </div>
            <div>
                <i class="fa-solid fa-comment"></i>
                <a href="">1:1 문의 내역</a>
            </div>
            <div>
                <i class="fa-solid fa-list"></i>
                <a href="">이용 내역</a>
            </div>
            <div>
                <i class="fa-solid fa-people-group"></i>
                <a href="">내 스터디</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
