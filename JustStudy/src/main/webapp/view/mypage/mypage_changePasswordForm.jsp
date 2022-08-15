<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    function goChangePassword() {
        let form_data = {
            input_now_password:$('#input-now-password').val(),
            input_new_password:$('#input-new-password').val(),
            input_new_password_repeat:$('#input-new-password-repeat').val()
        }

        $.ajax({
            url:'<c:url value="/mypageNonView/MypageChangePasswordReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'JSON',
            success:function(response){
                alert(response.changeResult)
                location.href = "/mypage/MypageChangePasswordForm"
                <%--if(response.modifyResult === 'success') {--%>
                <%--    alert(msg)--%>
                <%--    location.href = '<c:url value="/board/MainPage"/>'--%>
                <%--} else {--%>
                <%--    alert(response.modifyResult)--%>
                <%--}--%>
            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }

</script>

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
    <form>
        <div class="change-password-items">
            <p>현재 비밀번호</p>
            <input type="text" class="input-user-password" id="input-now-password"/>
        </div>
        <div class="change-password-items">
            <p>새 비밀번호</p>
            <input type="text" class="input-user-password" id="input-new-password"/>
        </div>
        <div class="change-password-items">
            <p>새 비밀번호 확인</p>
            <input type="text" class="input-user-password" id="input-new-password-repeat"/>
        </div>
        <div class="change-password-items">
            <p></p>
            <button id="btn-submit" onclick="goChangePassword()">수정하기</button>
        </div>
    </form>
</div>