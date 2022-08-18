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





