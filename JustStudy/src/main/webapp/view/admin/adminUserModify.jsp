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
    <b>회원 정보 수정</b>

  </div>

  <div id="main">

    <form action="AdminUserModifyReg?&nowPage=${nowPage}" method="get">
            <input type="hidden" name="id" value="${adminModifyDTO.mem_id}"/>
            <table border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
              <tr>
                <td>아이디</td>
                <td><input type="text" name="userid" value="${adminModifyDTO.mem_userid}"/></td>
              </tr>
              <tr>
                <td>이름</td>
                <td><input type="text" name="realname" value="${adminModifyDTO.mem_realname}"/></td>
              </tr>
              <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname" value="${adminModifyDTO.mem_nickname}"/></td>
              </tr>
              <tr>
                <td>주소</td>
                <td>
                  <input type="text" id="address1" name="address1" value="${adminModifyDTO.mem_address1}" readonly/>
                  <button type="button" id="address2" class="btn-signin" id="btn-findaddress" onclick="gofindAddress()">검색</button>
                </td>
              </tr>
              <tr>
                <td>상세주소</td>
                <td><input type="text" name="address2" value="${adminModifyDTO.mem_address2}"/></td>
              </tr>
              <tr>
                <td colspan="2"><input type="submit" value="수정"/></td>
              </tr>

      </table>
    </form>

  </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

  function gofindAddress() {

    new daum.Postcode({
      oncomplete: function(data) {
        document.getElementById("address1").value = data.address;
        document.getElementById("address2").focus();
      }
    }).open();

  }

</script>





