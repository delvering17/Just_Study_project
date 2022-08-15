<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/15
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">

</script>

<style>

    .mypage-inquiry {
        width: 900px;
        height: 100%;
        background: #F5F5F5;

    }

    .inquiry-top {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        font-size: 1rem;
        /* text-align: center; */
    }

    .inquiry-top button {
        border: 1px solid #a9a8a8;
        background: rgba(0, 0, 0, 0);
    }

    .inquiry-top > p{
        /* font-size: 1.2rem; */
        width: 150px;
        font-size: 1.2rem;
        vertical-align: middle;
        margin-block-start: 1em;
        text-align: center;
    }

    .inquiry-top > #inquiry-date-wave {
        width: 50px;
        text-align: center;
    }

    .top-dateselect-wrapper {
        width: 220px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .btn-inquiry {
        width: 60px;
        height: 40px;
    }

    #submit-find {
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .inquiry-top > .top-datepicker {
        width: 150px;
        height: 40px;
    }

</style>
<div class="mypage-inquiry">
    <div class="inquiry-top">
        <p>문의일자 조회</p>
        <div class="top-dateselect-wrapper">
            <button class="btn-inquiry">오늘</button>
            <button class="btn-inquiry">7일</button>
            <button class="btn-inquiry">1개월</button>
            <button class="btn-inquiry">3개월</button>
        </div>
        <input class="top-datepicker" type="date">
        <p id="inquiry-date-wave">&#126;</p>
        <input class="top-datepicker" type="date">
        <button type="submit" class="btn-inquiry" id="submit-find">조회</button>
    </div>

    <hr/>
    <div class="inquiry-main">
        <p>문의하신 내용이 없습니다</p>
    </div>
    <hr/>


    <hr/>


</div>