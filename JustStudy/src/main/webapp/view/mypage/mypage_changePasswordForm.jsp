<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<style type="text/css">
    .mypage-change-password {
        width: 700px;

    }

    .change-password-items {
        width: 100%;
        display: flex;
        margin-top: 20px;
    }

    .change-password-items > p {
        width: 200px;
        height: 40px;
        font-size: 1.2rem;
        margin-top: 5px;
    }

    .input-user-password {
        width: 400px;
        height: 40px;
        border: 0;
    }

    #btn-submit {
        width: 160px;
        height: 50px;
        border: none;
        background: rgb(48, 48, 48);
        color: aliceblue;
        font-size: 1.2rem;
        margin-left: 120px;
    }
</style>
<div class="mypage-change-password">
        <div class="change-password-items">
            <p>현재 비밀번호</p>
            <input type="password" class="input-user-password" id="input-now-password"/>
        </div>
        <div class="change-password-items">
            <p>새 비밀번호</p>
            <input type="password" class="input-user-password" id="input-new-password"/>
        </div>
        <div class="change-password-items">
            <p>새 비밀번호 확인</p>
            <input type="password" class="input-user-password" id="input-new-password-repeat"/>
        </div>
        <div class="change-password-items">
            <p></p>
            <button id="btn-submit" onclick="goChangePassword()">수정하기</button>
        </div>
</div>

<script type="text/javascript">
    function goChangePassword() {
        let form_data = {
            input_now_password:$('#input-now-password').val(),
            input_new_password:$('#input-new-password').val(),
            input_new_password_repeat:$('#input-new-password-repeat').val()
        }
        
        if(form_data.input_password1 === '') {
            alert('빈 칸을 입력해주세요.')
            $('#input-new-password').focus()
        } else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(form_data.input_password1)) {
            alert('영문,숫자, 특수문자를 혼합하여 공백없이 8자리 ~ 20자리 이내로 입력해주세요.')
            $('#input-new-password').focus()
        } else if(/\s/g.test($('#input-new-password').val())) {
            alert('비밀번호 공백을 제거해 주세요')
            $('#input-new-password').focus()
        } else if(form_data.input_password2 === '') {
            alert('빈 칸을 입력해주세요.')
            $('#input-new-password-repeat').focus()
        } else if(/\s/g.test($('#input-new-password-repeat').val())) {
            alert('비밀번호 확인 공백을 제거해 주세요')
            $('#input-new-password-repeat').focus()
        } else if(form_data.input_password1 !== form_data.input_password2) {
            alert('비밀번호가 일치하지 않습니다.')
            $('#input-new-password-repeat').focus()
        } else {

            $.ajax({
                url:'<c:url value="/mypageNonView/MypageChangePasswordReg"/>',
                type:'GET',
                data: form_data,
                async:false,
                dataType:'JSON',
                success:function(response){
                    alert(response.changeResult)
                    location.href = "/mypage/MypageChangePasswordForm"
                    if(response.changeResult === 'success') {
                        alert('변경에 성공했습니다.');
                        location.href = '<c:url value="/board/MainPage"/>'
                    } else if(response.changeResult === 'notCertified'){
                        alert('현재 비밀번호가 일치하지 않습니다.');
                    }
                },
                error:function(e){
                    console.log(e.responseText)
                }
            })
        }

    }
</script>