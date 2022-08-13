<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style type="text/css">
    .btn-login {
        display: flex;
        justify-content: center;
    }

    .btn-login > * {
        width: 183px;
        height: 45px;
        margin-top: 5px;
    }
</style>
<script type="text/javascript">

    function goLogin() {
        let form_data = {
            input_id:$('#input-id').val(),
            input_password:$('#input-password').val()
        }

        $.ajax({
            url:'<c:url value="/memberNonView/MemberLoginReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'JSON',  //지정하지 않으면 문자열로 처리
            success:function(aa){
                alert(aa.id)
            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }
</script>
<div id="box-login">
    <div>
        <h4>로그인</h4>
        <button class="btn-close"></button>
    </div>
    <div>
        <div>
            <span><i ></i></span>
            <input type="text" id="input-id" name="memberId" placeholder="아이디" aria-label="아이디" required/>
        </div>
        <div>
            <span><i class="fa-solid fa-key"></i></span>
            <input type="password" id="input-password"  placeholder="비밀번호" aria-label="비밀번호" required/>
        </div>
        <div>
            <input type="checkbox" id="exampleCheck1"/>
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        <div class="wrapper-login">
            <div class="btn-login">
                <button onclick="goLogin()" class="btn btn-dark">로그인</button>
            </div>
            <div class="btn-login">
                <button type="button" onclick="goLogin()" class="btn" style="padding: 0px">
                    <img src="<c:url value="/img/member/kakao_login.png"/>" alt=""/>
                </button>
            </div>
        </div>
    </div>
</div>
