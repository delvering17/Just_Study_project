<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-19
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .admin-sales-user-bg{
        width: 100%;
        height: fit-content;
    }

    .admin-sales-user-headline {
        width: 1330px;
        height: 40px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-top: 15px;
        padding-left: 20px;
        margin-top: 50px;
        margin-left: 239px;
        position: fixed;
        flex-direction: row;
    }

    .admin-sales-user-headline > b {
        width: 100px;
        font-size: 20px;
    }

    .admin-sales-user-main{
        width: 1700px;
        height: fit-content;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    .admin-sales-store-table {
        width: 67%;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
        table-layout: fixed;
        word-break: break-all;
    }

    .admin-sales-store-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-sales-store-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding: 5px 5px 5px 5px;
    }

    .admin-sales-store-table tr:first-of-type{
        height: 50px;
        padding: 10px;
        color: white;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-sales-store-table tr:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726);
    }


</style>

<script type="text/javascript">
    window.onload = function (){

    }
</script>
<div class="admin-sales-user-bg">
    <div class="admin-sales-user-headline">
        <b>회원별 매출</b>
    </div>

    <div class="admin-sales-user-main">
        <div>

            <form action="AdminSalesUserSearch">
                <select name="user-search">
                    <option value="id">아이디</option>
                    <option value="nickname">닉네임</option>
                </select>
                <input type="text" name="search-input"/>
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>

        <div>총 매출:${userTotalPay}</div>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-sales-store-table">
            <tr>
                <th>아이디</th>
                <th>닉네임</th>
                <th>이용일</th>
                <th>지출</th>
            </tr>
            <form action="">
                <c:forEach items="${salesUserList}" var="salesUserList">

                    <tr>
                        <td>${salesUserList.mem_userid}</td>
                        <td>${salesUserList.mem_nickname}</td>
                        <td>${salesUserList.useDate}</td>
                        <td>${salesUserList.pay}</td>
                    </tr>

                </c:forEach>
            </form>
        </table>

    </div>

</div>