<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style type="text/css">
  * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
  }

  #form-signin {
    width: 600px;
    height: 100%;
    background: rgb(245, 245, 245);
    padding: 30px;
    margin: 0 auto;
  }

  #signin-logo {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 30px;
  }

  .wrapper-signin {
    margin-top: 10px;
  }

  .wrapper-signin > p {
    font-size: 1.2rem;
  }

  .wrapper-signin > .signin-notice {
    font-size: 0.8rem;
    color: red;
  }

  .wrapper-signin .btn-signin {
    width: 20%;
    height: 40px;
  }

  .input-signin {
    width: 70%;
    height: 40px;
    border: 0px;
  }


  .btn-signin {
    background: rgb(28, 63, 90);
    border: none;
    color: aliceblue;
  }


  #user-address2 {
    margin-top: 20px;
    margin-bottom: 30px;
  }

  #submit-signin {
    width: 100%;
    height: 50px;
    font-size: 1.2rem;
  }

</style>
<form id="form-signin">
  <p id="signin-logo">회원가입</p>
  <div class="wrapper-signin">
    <p>이메일</p>
    <input type="text" class="input-signin" placeholder="ex) juststudy@gmail.com"/>
    <button type="button" class="btn-signin">인증</button>
  </div>
  <div class="wrapper-signin" id="wrapper-password">
    <p>비밀번호</p>
    <input type="text" class="input-signin" placeholder="비밀번호를 입력하세요."/>
    <p class="signin-notice">영문,숫자, 특수문자를 혼합하여 공백없이 8자리 ~ 20자리 이내로 입력해주세요. </p>
    <input type="text" class="input-signin" placeholder="비밀번호를 다시 한 번 입력해 주세요."/>
    <p class="signin-notice">비밀번호가 일치하지 않습니다.</p>
  </div>
  <div class="wrapper-signin">
    <p>닉네임</p>
    <input type="text" class="input-signin" placeholder="커뮤니티 활동에 사용할 닉네임을 입력해 주세요."/>
    <button type="button" class="btn-signin">중복체크</button>
  </div>
  <div class="wrapper-signin">
    <p>이름</p>
    <input type="text" class="input-signin"/>
  </div>
  <div class="wrapper-signin">
    <p>생년월일</p>
    <input type="date" class="input-signin" id="datePicker" value="2019-06-27">
  </div>
  <div class="wrapper-signin" id="wrapper-address">
    <p>주소</p>
    <div>
      <input type="text" class="input-signin" readonly/>
      <button type="button" class="btn-signin" id="btn-findaddress">검색</button>
    </div>
    <input type="text" class="input-signin" id="user-address2" placeholder="상세 주소를 입력해주세요."/>
  </div>
  <div>
    <button type="submit" class="btn-signin" id="submit-signin">회원 가입</button>
  </div>

</form>