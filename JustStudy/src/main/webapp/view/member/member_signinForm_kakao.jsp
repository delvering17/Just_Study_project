




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
  <p id="signin-logo">카카오 계정 회원가입</p>
  <input type="hidden" id="input-socialid" value="<%=request.getParameter("social_id")%>">
  <div class="wrapper-signin">
    <p>이메일</p>
    <input type="text" class="input-signin" id="input-userid" value="<%=request.getParameter("email")%>" readonly/>
  </div>
  <div class="wrapper-signin">
    <p>닉네임</p>
    <input type="text" class="input-signin" id="input-nickname" placeholder="커뮤니티 활동에 사용할 닉네임을 입력해 주세요."/>
    <button type="button" onclick="goNicknamedoubleCheck()" class="btn-signin">중복체크</button>
  </div>
  <div class="wrapper-signin">
    <p>이름</p>
    <input type="text" class="input-signin" id="input-realname"  value="<%=request.getParameter("realname")%>"/>
  </div>
  <div class="wrapper-signin" id="wrapper-address">
    <p>주소</p>
    <div>
      <input type="text" class="input-signin" id="input-address1" />
<%--      <input type="text" class="input-signin" id="input-address1" readonly/>--%>
      <button type="button" class="btn-signin" id="btn-findaddress">검색</button>
    </div>
    <input type="text" class="input-signin" id="input-address2" placeholder="상세 주소를 입력해주세요."/>
  </div>
  <div>
    <button class="btn-signin" onclick="goSignin()" id="submit-signin">회원 가입</button>
  </div>
</div>
<script type="text/javascript">

  function goIDdoubleCheck() {
    let input_userid = $('#input-userid').val()

    $.ajax({
      url:'<c:url value="/memberNonView/MemberSigninDoubleCheck"/>',
      type: 'GET',
      data: 'input_userid='+input_userid,
      async: false,
      success:function (response){
        let msg = decodeURIComponent(response).replaceAll("+"," ");
        alert(msg)

        $('#timer').html('<p>'+ msg + '</p>');
      },
      error:function(e){
        console.log(e.responseText)
      }
    });
  }

  function goCertificationNum() {
    let input_certificate_num = $('#input-certificate-num').val()

    $.ajax({
      url:'<c:url value="/memberNonView/MemberCertificationNum"/>',
      type: 'GET',
      data: 'input_certificate_num='+input_certificate_num,
      async: false,
      success:function (response){
        alert(decodeURIComponent(response).replaceAll("+"," "))

      },
      error:function(e){
        console.log(e.responseText)
      }
    });
  }

  function goCertificationNum() {
    let form_data = {
      input_certificate_num: $('#input-certificate-num').val(),
      input_userid: $('#input-userid').val()
    }

    $.ajax({
      url: '<c:url value="/memberNonView/MemberCertificationNum"/>',
      type: 'GET',
      data: form_data,
      async: false,
      dataType: 'JSON',
      success: function (response) {
        // alert(response.member_nickname)
        if (response.certificateResult === 'success') {
          alert('인증이 완료 되었습니다!');
        } else {
          alert('인증에 실패했습니다.');
        }
      }
      ,
      error: function (e) {
        console.log(e.responseText)
      }

    });
  }
  function goNicknamedoubleCheck() {
    let input_nickname = $('#input-nickname').val()

    $.ajax({
      url:'<c:url value="/memberNonView/MemberSigninDoubleCheck"/>',
      type: 'GET',
      data: 'input_nickname='+input_nickname,
      async: false,
      success:function (response){
        if(response === 'success') {
          alert('사용가능한 닉네임 입니다')
        } else {
          alert('중복된 닉네임 입니다.')
        }

      },
      error:function(e){
        console.log(e.responseText)
      }
    });
  }


  function goSignin() {

    let form_data = {
      input_userid:$('#input-userid').val(),
      input_password1:$('#input-password1').val(),
      input_password2:$('#input-password2').val(),
      input_nickname:$('#input-nickname').val(),
      input_socialid:$('#input-socialid').val(),
      input_realname:$('#input-realname').val(),
      input_address1:$('#input-address1').val(),
      input_address2:$('#input-address2').val()
    }

    $.ajax({
      url:'<c:url value="/memberNonView/MemberSigninReg"/>',
      type:'GET',
      data: form_data,
      async:false,
      dataType:'JSON',
      success:function(response){
        alert(response.msg)
        <%--if(response.loginResult === 'success') {--%>
        <%--  alert('로그인에 성공했습니다.')--%>
        <%--  location.href = '<c:url value="/board/MainPage"/>'--%>
        <%--} else {--%>
        <%--  alert(response.loginResult)--%>
        <%--}--%>
      },
      error:function(e){
        console.log(e.responseText)
      }
    })

  }





</script>