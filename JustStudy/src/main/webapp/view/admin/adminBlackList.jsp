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
<style>
  *{
    margin: 0;
    padding: 0;
  }

  #headline{
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

  #headline > b{
    width: 100px;
    font-size: 20px;
  }

  #headline > input{
    float: right;
    margin: 0px 10px 50px 0px;

  }

  #main{
    width: 2000px;
    height: 2000px;
    margin: 0px 0px 0px 220px;
    padding: 120px 20px 20px 40px;
  }
</style>

<div id="headline">
  <b>블랙리스트 관리</b>
</div>
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
            <td></td>
            <td>${i.black_reason}</td>
            <td>
              <button formaction="AdminBlackListDelete" formmethod="get">삭제</button>
            </td>
          </form>
        </tr>
      </c:forEach>

    </table>
  </div>
</div>
