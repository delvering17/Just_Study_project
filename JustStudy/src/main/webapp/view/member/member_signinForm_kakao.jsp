




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
  if(${member_msg != null}){
    alert("${member_msg}")
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

  .hide {
    display: none;
  }

  .show {
    visibility: visible;
  }


</style>
<div id="form-signin">
  <% if(request.getParameter("type") != null) { %>
    <p id="signin-logo">네이버 계정 회원가입</p>
  <% } else {%>
    <p id="signin-logo">카카오 계정 회원가입</p>
  <% }%>
  <input type="hidden" id="input-socialid" value="${socialid}">
  <div class="wrapper-signin">
    <p>이메일</p>
    <input type="text" class="input-signin" id="input-userid" value="${social_email}" readonly/>
  </div>
  <div class="wrapper-signin">
    <p>닉네임</p>
    <input type="text" class="input-signin" id="input-nickname" placeholder="커뮤니티 활동에 사용할 닉네임을 입력해 주세요."/>
    <input type="checkbox" id="isNicknamedoubleCheck" hidden/>
    <button type="button" onclick="goNicknamedoubleCheck()" class="btn-signin">중복체크</button>
    <p class="signin-notice hide" id="notice-nickname">한글 2~6자리를 입력해주세요 </p>
  </div>
  <div class="wrapper-signin">
    <p>이름</p>
    <input type="text" class="input-signin" id="input-realname"  value="${realname}"/>
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

  function goNicknamedoubleCheck() {
    if($('#input-nickname').val() === '') {
      alert('빈 칸을 입력해주세요')
    } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
      alert('한글 2~6자리를 입력해주세요')
      $('#notice-nickname').removeClass('hide')
      $('#notice-nickname').addClass('show')
    } else if(/\s/g.test($('#input-nickname').val())) {
      alert('공백을 제거해 주세요')
    } else {


      let input_nickname = $('#input-nickname').val()
      $.ajax({
        url:'<c:url value="/memberNonView/MemberSigninDoubleCheck"/>',
        type: 'GET',
        data: 'input_nickname='+input_nickname,
        async: false,
        success:function (response){
          if(response === 'success') {
            $('#isNicknamedoubleCheck').attr("checked",true);
            $("#input-nickname").attr("readonly",true);
            $('#notice-nickname').removeClass('show')
            $('#notice-nickname').addClass('hide')
            alert('사용가능한 닉네임 입니다')

          } else if(response === 'regex'){
            alert('한글은 2~6자리를 입력해주세요')
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

  function gofindAddress() {

    new daum.Postcode({
      oncomplete: function(data) {
        document.getElementById("input-address1").value = data.address;
        document.getElementById("input-address2").focus();
      }
    }).open();

  }

  function goSignin() {

    let form_data = {
      input_userid:$('#input-userid').val(),
      input_nickname:$('#input-nickname').val(),
      input_socialid:$('#input-socialid').val(),
      input_realname:$('#input-realname').val(),
      input_address1:$('#input-address1').val(),
      input_address2:$('#input-address2').val()
    }

    if(form_data.input_nickname === '') {
      alert('빈 칸을 입력해주세요.')
      $('#input-nickname').focus()
    } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
      alert('한글 2~6자리를 입력해주세요.')
      $('#input-nickname').focus()
    } else if(/\s/g.test($('#input-nickname').val())) {
      alert('닉네임 공백을 제거해 주세요')
      $('#input-nickname').focus()
    } else if($('#isNicknamedoubleCheck').is(":checked") === false) {
      alert('닉네임 중복 확인을 해주세요.')
    } else if(form_data.input_realname === '') {
      alert('빈 칸을 입력해주세요.')
      $('#input-realname').focus()
    } else if(/\s/g.test($('#input-realname').val())) {
      alert('이름 공백을 제거해 주세요')
      $('#input-userid').focus()
    } else if(form_data.input_address1 === '') {
      alert('주소 검색을 이용해 주소를 입력해주세요.')
      $('#input-address1').focus()
    } else if(form_data.input_address2 === '') {
      alert('빈 칸을 입력해주세요.')
      $('#input-address2').focus()
    } else {
      $.ajax({
        url:'<c:url value="/memberNonView/MemberSocialSigninReg"/>',
        type:'GET',
        data: form_data,
        async:false,
        dataType:'JSON',
        success:function(response){
          if(response.msg === 'success') {
            alert('회원 가입이 완료되었습니다.')
            location.href = "../board/MainPage"
          }
        },
        error:function(e){
          console.log(e.responseText)
        }
      })

    }


  }





</script>