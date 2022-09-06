<%@ page import="model_p.APIKeyDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 1:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="MemberSocialSigninForm" id="fff" method="post">
    <input type="hidden" name="email" id="email">
    <input type="hidden" name="social_id" id="social_id">
    <input type="hidden" name="realname" id="realname">
    <input type="hidden" name="type" value="Naver">
</form>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">

    var naver_id_login = new naver_id_login(<%=new APIKeyDAO().findKeybyName("naver_client_id")%>, "");
    // 접근 토큰 값 출력
    // alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    function naverSignInCallback() {
        let form_data = {
            social_id:naver_id_login.getProfileData('id'),
            social_email:naver_id_login.getProfileData('email'),
            realname:naver_id_login.getProfileData('name')
        }

        $.ajax({
            url:'<c:url value="/member/MemberSocialNaverLoginReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'text',
            success:function(response){
                // alert('야호');
                alert(response)
                // if(response.loginResult === 'success') {
                //     alert('로그인 되었습니다.');
                //     location.href = response.goUrl;
                // } else{
                //
                //     let email = naver_id_login.getProfileData('email')
                //     let social_id = naver_id_login.getProfileData('id')
                //     let realname = naver_id_login.getProfileData('name')
                //     $('#email').val(email)
                //     $('#social_id').val(social_id)
                //     $('#realname').val(realname)
                //     alert('가입 되지 않은 회원입니다. 회원가입을 진행해주세요')
                //     $('#fff').submit()
                // }
            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }

</script>