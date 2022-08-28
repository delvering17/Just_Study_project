<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-17
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r2").attr("checked", true)
    $(".admin-template-header>b").html("블랙리스트 추가")
    $(".admin-template-header>div").append("<input type=button class='admin-black-add' value='추가'/>")
</script>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    table {
        width: 400px;
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
        font-size: 15px;
    }

    tr:nth-of-type(2) > th:first-child{
        width: 100px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }



</style>
<div id="main">
    <form action="AdminBlackListAddReg" class="admin-black-add-action" method="get">

        <table border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>회원번호</th>
                <th><input type="hidden" name="black_id" value="${blackListAddId}"/>${blackListAddId}</th>
            </tr>
            <tr>
                <th>사유</th>
                <td><textarea name="black_reason" cols="30" rows="10"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    $(".admin-black-add").click(function () {
        $(".admin-black-add-action").submit()
    })
</script>






