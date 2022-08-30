<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>
<style>
    .admin-notice-detail-main {
        width: 1100px;
        height: fit-content;
        margin: 0 auto;
        padding: 20px 20px;
    }

    .event-title-area {
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line {
        width: 1100px;
        height: 3px;
        margin: 10px auto;
        background: black;
    }

    .notice-under-line{
        width: 1100px;
        height: 1px;
        margin: 0 auto;
        background: lightgray;
    }

    #event-title {
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink {
        width: 1100px;
        height: 50px;
        margin: 0 auto;
        padding-top: 13px;
        text-align: center;
    }

    .listlink>input{
        margin-left: 30px;
        font-weight: bold;
        width: 60px;
        height: 30px;
    }

    .event-list-area {
        width: 1100px;
        height: 100%;
        display: flex;
        margin: 20px auto;
    }


    .event-ul > li {
        margin: 10px;
        float: left;
        list-style: none;
    }


    .event-status {
        width: 1100px;
        height: 150px;
        position: relative;
        text-align: center;
        margin: 0 auto;
        padding-top: 20px;

    }


    textarea {
        font-size: 1rem;
        outline: none;
        /*vertical-align: middle;*/
    }


</style>

<div class="admin-notice-detail-main">
    <div class="event-title-area">
        <p id="event-title">공지사항</p>
        <hr class="title-line">
    </div>

    <div class="event-status">
        <h2> ${dto.title} </h2>
        <p class="date" style="margin-top: 30px"> ${dto.reg_date_sdf}</p>

    </div>
    <hr class="notice-under-line" >


    <div class="event-list-area">
        ${dto.content}
    </div>

    <hr class="notice-under-line" >

</div>

<script>

    $(".admin-template-header>b").html("공지 상세보기")
    $(".admin-template-header>div").append("<input type=button class='admin-notice-modify' value='수정'/>")
    $(".admin-template-header>div").append("<input type=button class='admin-notice-delete' value='삭제'/>")
    $(".admin-template-header>div").append("<input type=button class='admin-notice-list' value='목록으로'/>")


    $(".admin-notice-modify").click(function () {
        location.href = "AdminNoticeModifyForm?id=${dto.id}"
    })
    $(".admin-notice-delete").click(function () {
        location.href = "AdminNoticeDeleteReg?id=${dto.id}"
    })
    $(".admin-notice-list").click(function () {
        location.href = "AdminNoticeList"
    })


</script>