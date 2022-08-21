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

  .hide {
    display: none;
  }

  .show {
    visibility: visible;
  }

</style>
<div id="form-signin">
  <p id="signin-logo">회원가입</p>
  <div class="wrapper-signin">
    <p>이메일</p>
    <input type="text" class="input-signin" id="input-userid" placeholder="ex) juststudy@gmail.com"/>
    <button type="button" class="btn-signin" id="btn-certificate-num" onclick="goIDdoubleCheck()">중복체크</button>
    <p class="signin-notice hide" id="notice-email">이메일 형식에 맞게 입력해주세요. </p>
    <input type="text" class="input-signin certifiy-email hide" id="input-certificate-num" placeholder="인증번호 입력"/>
    <button type="button" class="btn-signin certifiy-email hide" onclick="goCertificationNum()">인증확인</button>
    <p class="certifiy-email hide" id="timer">인증시간 : </p>

  </div>
  <div class="wrapper-signin" id="wrapper-password">
    <p>비밀번호</p>
    <input type="password" class="input-signin" id="input-password1" placeholder="비밀번호를 입력하세요."/>
    <p class="signin-notice hide" id="notice-password1">영문,숫자, 특수문자를 혼합하여 공백없이 8자리 ~ 20자리 이내로 입력해주세요. </p>
    <input type="password" class="input-signin" id="input-password2" placeholder="비밀번호를 다시 한 번 입력해 주세요."/>
    <p class="signin-notice hide" id="notice-password2">비밀번호가 일치하지 않습니다.</p>
  </div>
  <div class="wrapper-signin">
    <p>닉네임</p>
    <input type="text" class="input-signin" id="input-nickname" placeholder="커뮤니티 활동에 사용할 닉네임을 입력해 주세요."/>
    <button type="button" onclick="goNicknamedoubleCheck()" class="btn-signin">중복체크</button>
    <p class="signin-notice hide" id="notice-nickname">한글 2~6자리를 입력해주세요 </p>
  </div>
<%--  <div class="wrapper-signin">--%>
<%--    <p>휴대번호</p>--%>
<%--    <input type="text" class="input-signin" id="input-phone" >--%>
<%--    <input type="text" class="input-signin" id="input-phone" readonly>--%>
<%--    <button type="button" class="btn-signin">인증</button>--%>
<%--  </div>--%>
  <div class="wrapper-signin">
    <p>이름</p>
    <input type="text" class="input-signin" id="input-realname" placeholder="실명을 입력해주세요"/>
  </div>
  <div class="wrapper-signin" id="wrapper-address">
    <p>주소</p>
    <div>
<%--      <input type="text" class="input-signin" id="input-address1" />--%>
      <input type="text" class="input-signin" id="input-address1" readonly/>
      <button type="button" class="btn-signin" id="btn-findaddress" onclick="gofindAddress()">검색</button>
    </div>
    <input type="text" class="input-signin" id="input-address2" placeholder="상세 주소를 입력해주세요."/>
  </div>
  <div>
    <button class="btn-signin" onclick="goSignin()" id="submit-signin">회원 가입</button>
  </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

        if(msg === '중복된 이메일 입니다.' || msg === '이메일 형식에 맞춰 입력해주세요.' ) {
          alert(msg)
          $('#notice-email').removeClass('hide')
          $('#notice-email').addClass('show')
          $('#notice-email').empty()
          $('#notice-email').html(msg)
        } else {
          alert(msg)
          $('#notice-email').removeClass('show')
          $('#notice-email').addClass('hide')
          $("#input-userid").attr("readonly",true);
          let arr_certify = document.querySelectorAll('.certifiy-email')
          arr_certify.forEach(function (i) {
            i.classList.remove("hide")
            i.classList.add("show")
          })

          $('#timer').html('<p>'+ msg + '</p>');

          $('#btn-certificate-num').html('다시 받기')
        }

      },
      error:function(e){
        console.log(e.responseText)
      }
    });
  }

  function goCertificationNum() {

    if($('#input-certificate-num').val() === '') {
      alert('빈 칸을 입력해주세요')
    } else if(/\s/g.test($('#input-certificate-num').val())) {
      alert('공백을 제거해 주세요')
    } else if (!/^[0-9].{1,12}$/.test($('#input-certificate-num').val())){
      alert('숫자만 입력해주세요')
    } else{
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

            $("#input-userid").attr("readonly",true);
            let arr_certify = document.querySelectorAll('.certifiy-email')
            arr_certify.forEach(function (i) {
              i.classList.remove("show")
              i.classList.add("hide")
            })
            $('#btn-certificate-num').html('인증완료')
            $('#btn-certificate-num').attr("onclick", '')
          } else {
            alert('인증에 실패했습니다.');
          }
        },
        error: function (e) {
          console.log(e.responseText)
        }

      });
    }

  }

  $("#input-password1").change(function () {
    let input_password1 = $('#input-password1').val()
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(input_password1)) {
        alert('영문,숫자, 특수문자를 혼합하여 공백없이 8자리 ~ 20자리 이내로 입력해주세요.')
        $('#notice-password1').removeClass('hide')
        $('#notice-password1').addClass('show')
    } else {
      $('#notice-password1').removeClass('show')
      $('#notice-password1').addClass('hide')
    }
  })

  $("#input-password2").change(function () {
    let input_password1 = $('#input-password1').val()
    let input_password2 = $('#input-password2').val()
    if(!(input_password1 === input_password2)) {
      alert('비밀번호가 일치하지 않습니다.')
      $('#notice-password2').removeClass('hide')
      $('#notice-password2').addClass('show')
    } else {
      $('#notice-password2').removeClass('show')
      $('#notice-password2').addClass('hide')
    }
  })




  function goNicknamedoubleCheck() {
    if($('#input-nickname').val() === '') {
      alert('빈 칸을 입력해주세요')
    } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
      alert('한글 2~6자리를 입력해주세요')
      $('#notice-nickname').removeClass('hide')
      $('#notice-nickname').addClass('show')
    } else {
      $("#input-nickname").attr("readonly",true);

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

  }


  function goSignin() {

    let form_data = {
      input_userid:$('#input-userid').val(),
      input_password1:$('#input-password1').val(),
      input_password2:$('#input-password2').val(),
      input_nickname:$('#input-nickname').val(),
      input_phone:$('#input-phone').val(),
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
        alert(response.signinResult)
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


  function gofindAddress() {

      new daum.Postcode({
        oncomplete: function(data) {
          document.getElementById("input-address1").value = data.address;
          document.getElementById("input-address2").focus();
        }
      }).open();
  }




</script>