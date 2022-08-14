<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 6:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    .info-modify {
        width: 700px;
        margin-top: 50px;

    }

    .info-modify-form-items {
        display: flex;
    }

    .info-modify-form-items > p {
        width: 100px;
        height: 40px;
        font-size: 1.2rem;
    }

    .info-modify-form-items .user-input{
        width: 400px;
        height: 40px;
        border: 0;
    }

    .info-modify-form-items .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .info-modify-form-items #btn-memberclose {
        background: rgb(173, 153, 126);
    }

    .info-modify-form-items #btn-confirm-modify {
        background: rgb(48, 48, 48);
    }

    #info-modify-confirm-wrapper {
        width: 400px;
        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-around;
    }

    #info-modify-confirm-wrapper > .btn-modify{
        width:150px;
    }
</style>

<div class="info-modify">
    <form>
        <ul>
            <li class="info-modify-form-items">
                <p>이름</p>
                <input type="text" class="user-input" id="input_realname">
            </li>
            <li class="info-modify-form-items">
                <p>닉네임</p>
                <input type="text" class="user-input"id="input_nickname">
                <button type="button" class="btn-modify">중복체크</button>
            </li>
            <li class="info-modify-form-items">
                <p>휴대전화</p>
                <input type="text" class="user-input" value="01022223333"/>
<%--                <input type="text" class="user-input" value="1999.10.1" readonly>--%>
                <button type="button" class="btn-modify" id="">변경</button>
            </li>
            <li class="info-modify-form-items" >
                <p>주소</p>
                <input type="text" class="user-input" value="경기 화성시 봉담" readonly>
                <button type="button" class="btn-modify" id="btn-findaddress">검색</button>
            </li>
            <li class="info-modify-form-items">
                <p></p>
                <input type="text" class="user-input" value="저 언덕너머 위 101호" readonly>
            </li>
            <li class="info-modify-form-items">
                <p></p>
                <div id="info-modify-confirm-wrapper">
                    <button type="button" class="btn-modify" id="btn-memberclose">회원 탈퇴</button>
                    <button type="submit" class="btn-modify" id="btn-confirm-modify">수정하기</button>
                </div>
            </li>
        </ul>
    </form>
</div>
