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
</script>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
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

