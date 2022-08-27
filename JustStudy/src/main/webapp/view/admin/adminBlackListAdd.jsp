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
</script>
<style>
    .admin-blacklist-add-bg {
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

    #main {
        width: 1100px;
      height: 100%;
      padding: 20px 20px;
      overflow: auto;
    }

</style>
<div class="admin-blacklist-add-bg">
    <div id="headline">
        <b>블랙리스트 추가</b>
    </div>

    <div id="main">

        <form action="AdminBlackListAddReg" method="get">

            <table border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                <tr>
                    <td>회원번호</td>
                    <td><input type="text" name="black_id" value="${blackListAddId}" readonly/></td>
                </tr>
                <tr>
                    <td>사유</td>
                    <td><input type="text" name="black_reason" value=""/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="추가"/></td>
                </tr>

            </table>
        </form>

    </div>
</div>





