<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .mypage-inquiry {
        width: 800px;
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
        width: 20px;
        font-size: 1.2rem;
        vertical-align: middle;
        margin-block-start: 1em;
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

    .mypage-inquiry > .inquiry-top > .top-datepicker {
        width: 150px;
        height: 40px;
    }

</style>
<div class="mypage-inquiry">
    <div class="inquiry-top">
        <%--        <p>예약일자 조회</p>--%>
        <div class="top-dateselect-wrapper">
            <button class="btn-inquiry">오늘</button>
            <button class="btn-inquiry">7일</button>
            <button class="btn-inquiry">1개월</button>
            <button class="btn-inquiry">3개월</button>
        </div>
        <input class="top-datepicker" type="date" >
        <p>&#126;</p>
        <input class="top-datepicker" type="date">
        <button type="submit" class="btn-inquiry" id="submit-find">조회</button>
    </div>

    <hr/>
    <div class="inquiry-main">
        <p>문의하신 내용이 없습니다</p>
    </div>
    <hr/>

</div>