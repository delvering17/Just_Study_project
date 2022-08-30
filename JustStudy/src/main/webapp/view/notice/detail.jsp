<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .notice-detail-wrapper{
        width: 1400px;
        margin: 0 auto;

        padding-bottom: 70px;
    }

    .notice-title-area{
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 100px;
        margin: 0 auto;

    }

    .title-line{
        width: 1100px;
        height: 3px;
        margin: 10px auto;
        background: black;
    }
    .notice-under-line{
        width: 1100px;
        height: 1px;
        margin: 20px auto;
        background: lightgray;
    }


    #notice-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink{
        width: 1100px;
        height: 50px;
        margin: 0 auto;
        padding-bottom: 50px;
        padding-top: 13px;
        text-align: center;
    }
    .notice-list-btn{
        margin-top: 30px;
    }

    .notice-list-area{
        width: 1100px;
        display: flex;
        margin: 20px auto;
    }


    .notice-status{
        width: 1100px;
        height: 150px;
        position: relative;
        text-align: center;
        margin: 0 auto;
        padding-top: 20px;

    }


    textarea{
        font-size: 1rem;
        outline: none;
        /*vertical-align: middle;*/
    }

</style>
<div class="notice-detail-wrapper" >
<div class="notice-title-area">
    <p id="notice-title">공지사항</p>
    <hr class="title-line">
</div>

    <div class="notice-status">
        <h2> ${dto.title} </h2>
        <p class="date" style="margin-top: 30px"> ${dto.reg_date_sdf}</p>
    </div>
    <hr class="notice-under-line">


    <div class="notice-list-area">
        ${dto.contentBr}
    </div>
    <hr class="notice-under-line">


    <div class="listlink">
        <input type='button' class='notice-list-btn' value='목록으로' />
    </div>
</div>
<script>
    $(".notice-list").click(function () {
        location.href = "NoticePage"
    })
</script>
