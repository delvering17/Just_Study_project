<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-20
  Time: 오후 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .notice-title-area{
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin: 0 auto;
        background: black;
    }

    #notice-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .listlink{
        width: 80%;
        height: 100px;
        margin: 0 auto;
        text-align: center;
        border: 1px solid #000;
    }



    .title-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin-left: 10%;
        background: black;
    }

    #notice-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .notice-list-area{
        width: 80%;
        height: 100%;
        background: #ffa;
        display: flex;
        margin-left: 10%;
        margin-top: 50px;
        margin-bottom: 2%;
    }



    .notice-ul > li{
        /*width: 100px;*/
        /*height: 100px;*/
        margin: 10px;
        float: left;
        /*background: black;*/
        list-style: none;
    }



    .notice-status{
        width: 80%;
        height: 150px;
        padding: 35px 80px;
        position: relative;
        text-align: center;
        margin-left: 10%;

    }

    .notice-status > div{
        width: 150px;
        height: 70px;
        background: aqua;
        border: solid 1px #000;
        float: left;
        padding: 20px;
        text-align: center;
        margin-top: 35px;
    }



    textarea{
        font-size: 1rem;
        outline: none;
        /*vertical-align: middle;*/
    }

</style>

<div class="notice-title-area">
    <p id="notice-title">공지사항</p>
    <hr class="title-line">
</div>

<div class="notice-status">
    <h2> ${dto.title} </h2>
    <p class="date" style="margin-top: 30px"> ${dto.reg_date_sdf}</p>

</div>
<hr style="width: 80%; height: 1px; margin-left: 10%; background: lightgray">


<div class="notice-list-area">
    ${dto.content}
</div>


<div class="listlink">
    <a href="NoticePage">목록으로</a>
</div>
