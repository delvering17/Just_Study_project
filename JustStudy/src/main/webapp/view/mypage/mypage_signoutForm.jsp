<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    function goSignout() {
        let form_data = {
            input_password:$('#input-password').val()
        }

        $.ajax({
            url:'<c:url value="/mypageNonView/MypageSignoutReg"/>',
            type:'GET',
            data: form_data,
            async:true,
            dataType:'JSON',
            success:function(response){
                alert(response.signoutResult)
                
                location.href = '../board/MainPage'

            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }

</script>

<style type="text/css">
    .mypage-signout {
        width: 700px;

    }

    .signout-items {
        width: 100%;
        display: flex;
        margin-top: 20px;
    }

    .signout-items > p {
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
<div class="mypage-signout">
    <form>
        <div class="signout-items">
            <h2> 회원탈퇴</h2>
        </div>
        <div class="signout-items">
            <p>비밀번호를 입력해주세요</p>
            <input type="text" class="input-user-password" id="input-password"/>
        </div>
        <div class="signout-items">
            <button id="btn-submit" onclick="goSignout()">탈퇴하기</button>
        </div>
    </form>
</div>
</div>