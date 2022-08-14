<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">

  function goIDdoubleCheck() {
    let input_id = $('#input-id').val()

    $.ajax({
      url:'<c:url value="/memberNonView/MemberSigninDoubleCheck"/>',
      type: 'GET',
      data: 'input_id='+input_id,
      async: false,
      success:function (response){
        alert(response)
      },
      error:function(e){
        console.log(e.responseText)
      }
    });
  }

  function goSignin() {

    let form_data = {
      input_userid:$('#input-userid').val(),
      input_password:$('#input-password').val()
    }

    $.ajax({
      url:'<c:url value="/memberNonView/MemberLoginReg"/>',
      type:'GET',
      data: form_data,
      async:false,
      dataType:'JSON',
      success:function(response){
        // alert(response.member_nickname)
        if(response.loginResult === 'success') {
          alert('로그인에 성공했습니다.')
          location.href = '<c:url value="/board/MainPage"/>'
        } else {
          alert(response.loginResult)
        }
      },
      error:function(e){
        console.log(e.responseText)
      }
    })

  }
</script>
<style type="text/css">

  #form-signin {
    width: 600px;
    height: fit-content;
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
<div id="form-signin">
  <p id="signin-logo">회원가입</p>
  <div class="wrapper-signin">
    <p>아이디</p>
    <input type="text" class="input-signin" id="input-id" placeholder="ex) juststudy"/>
    <button type="button" class="btn-signin" onclick="goIDdoubleCheck()">중복체크</button>
  </div>
  <div class="wrapper-signin" id="wrapper-password">
    <p>비밀번호</p>
    <input type="text" class="input-signin" id="input-password1" placeholder="비밀번호를 입력하세요."/>
    <p class="signin-notice">영문,숫자, 특수문자를 혼합하여 공백없이 8자리 ~ 20자리 이내로 입력해주세요. </p>
    <input type="text" class="input-signin" id="input-password2" placeholder="비밀번호를 다시 한 번 입력해 주세요."/>
    <p class="signin-notice">비밀번호가 일치하지 않습니다.</p>
  </div>
  <div class="wrapper-signin">
    <p>닉네임</p>
    <input type="text" class="input-signin" id="input-nickname" placeholder="커뮤니티 활동에 사용할 닉네임을 입력해 주세요."/>
    <button type="button" class="btn-signin">중복체크</button>
  </div>
  <div class="wrapper-signin">
    <p>휴대번호</p>
    <input type="text" class="input-signin" id="input-phone" readonly>
    <button type="button" class="btn-signin">인증</button>
  </div>
  <div class="wrapper-signin">
    <p>이름</p>
    <input type="text" class="input-signin" id="input-name"/>
  </div>

  <div class="wrapper-signin" id="wrapper-address">
    <p>주소</p>
    <div>
      <input type="text" class="input-signin" id="input-address1" readonly/>
      <button type="button" class="btn-signin" id="btn-findaddress">검색</button>
    </div>
    <input type="text" class="input-signin" id="input-address2" placeholder="상세 주소를 입력해주세요."/>
  </div>
  <div>
    <button class="btn-signin" id="submit-signin">회원 가입</button>
  </div>
</div>
