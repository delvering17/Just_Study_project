<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    .admin-notice-modify-bg {
        width: 100%;
        height: 100%;
    }

    #headline {
        width: 100%;
        height: 50px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-left: 20px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    #headline > b {
        width: fit-content;
        font-size: 20px;
        line-height: 50px;
    }

    #headline > input {
        margin-right: 10px;
    }

    #main {
        width: 1100px;
        height: 100%;
        padding: 20px 20px;
        overflow: auto;
    }

    #main > div:first-of-type > input[type=button] {
        padding: 5px 3px 5px 3px;
        border-radius: 5px;
        border: 0;
        background: rgb(138, 169, 238);
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }

    #main > div:nth-of-type(2) {
        margin: 10px 0px 0px 0px;

    }

    #main > div:nth-of-type(2) > select {
        height: 25px;
        border-radius: 4px;
    }

    #main > div:nth-of-type(2) > button {
        width: 25px;
        height: 25px;
    }

    table {
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 140px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2),
    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(7),
    tr:first-of-type > th:nth-of-type(8) {
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(6) {
        width: 250px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }
</style>


<div class="admin-notice-modify-bg">

    <div id="headline">
        <b>공지사항 수정</b>
    </div>

    <div id="main">
        <form action="AdminNoticeModifyReg" name="myform" onsubmit="return check()">
            <input type="hidden" name="id" value="${dto.id}">
            <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                <tr>
                    <td>타이틀</td>
                    <td colspan="3"><input type="text" name="title" value="${dto.title}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="3"><textarea name="content" cols="50" rows="10">${dto.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="4"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script>
    function check() {
        const f = document.myform;
        if (f.title.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }

        if (f.content.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.content.focus();
            return false;
        }

    }

</script>