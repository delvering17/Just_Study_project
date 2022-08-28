<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-17
  Time: 오후 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r2").attr("checked", true)
    $(".admin-template-header>b").html("블랙리스트 관리")
</script>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    table {
        width: 500px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
        padding: 5px 0px 5px 0px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        padding: 10px 0px 10px 0px;
    }

    tr:first-of-type > th:first-child {
        width: 100px;
        height: 30px;
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(2){
        width: 150px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(3) {
        width: 200px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(4) {
        width: 100px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }
</style>

<div id="main">
    <table border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
        <tr>
            <th>회원번호</th>
            <th>이메일</th>
            <th>사유</th>
            <th>관리</th>
        </tr>

        <c:forEach items="${blackData}" var="i">
            <tr>
                <form action="" method="">
                    <th><input type="hidden" name="user" value="${i.black_id}">${i.black_id}</th>
                    <td>${i.mem_userid}</td>
                    <td>${i.black_reason}</td>
                    <td>
                        <button formaction="AdminBlackListDelete" formmethod="get">삭제</button>
                    </td>
                </form>
            </tr>
        </c:forEach>

    </table>
</div>

