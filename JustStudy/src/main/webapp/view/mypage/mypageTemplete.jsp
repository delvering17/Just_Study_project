<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 갈아 엎기--%>
<style>
    .mypage-menu-bg {
        width: 100%;
        background: #F5F5F5;
        display: flex;
        flex-direction: row;

    }

    .mypage-menu-wrapper {
        width: 300px;
        height: fit-content;
        margin-left: 100px;
        /*top: 50px;*/

    }

    .fa-circle-user {
        width: fit-content;
        margin-right: 10px;
    }

    .mypage-menu-user-info {
        /*width: fit-content;*/
        display: inline-block;
        margin-bottom: 50px;
        margin-right: 40px;
    }

    .menu-profile-wrapper {
        display: flex;
        flex-direction: row;
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

    .mypage-main {
        width: 1000px;

        background: #F5F5F5;
        /*margin-top: 100px;*/
        margin-left: 200px;

        /*position: relative;*/

    }

    .mypage-change-password {
        width: 700px;
    }

    .change-password-items {
        width: 100%;
        display: flex;
        margin-top: 20px;
    }

    .change-password-items > p {
        width: 200px;
        height: 40px;
        font-size: 1.2rem;
        margin-top: 5px;
    }

    .input-user-password {
        width: 400px;
        height: 40px;
        border: 0;
    }

    #btn-submit {
        width: 160px;
        height: 50px;
        border: none;
        background: rgb(48, 48, 48);
        color: aliceblue;
        font-size: 1.2rem;
        margin-left: 120px;
    }



</style>

<div class="mypage-menu-bg">
    <div class="mypage-menu-wrapper">
        <div class="menu-profile-wrapper">
            <i class="fa-solid fa-circle-user fa-5x" style="color:gray"></i>
            <div class="mypage-menu-user-info">
                <font size="6rem"><b>${memberDTO.mem_realname}</b></font>
                <font size="4.5rem"><b>님</b></font><br/>
                <font size="4.5rem" color="gray"><b>${memberDTO.mem_userid}</b></font>
            </div>
        </div>
        <div class="menu-list-wrapper">
            <div>
                <i class="fa-solid fa-pen-to-square"></i>
                <a href="">회원 정보 수정</a>
            </div>
            <div>
                <i class="fa-solid fa-key"></i>
                <a href="">비밀번호 변경</a>
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
    <div class="mypage-main">
        <jsp:include page="${subUrl}"/>

    </div>
</div>
