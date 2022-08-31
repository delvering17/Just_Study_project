<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style type="text/css">
    .btn-login {
        display: flex;
        justify-content: center;
        margin: 20px 0;
    }

    .login-logo {
        font-size: 40px;
        font-weight: 700;
        text-align: center;
        margin-top: 20px;
    }


    .btn-goLogin {
        width: 200px;

    }

    .wrapper-login {
        height: 528px;
        background: #F5F5F5;
        position: relative;
    }

    .login-box {
        width: 400px;
        height: 300px;
        position: absolute;
        top: 16%;
        left: 38%;
    }
</style>
<div class="wrapper-login">
    <div class="login-box">
        <div class="login-logo">
            <p class="">로그인</p>
        </div>
        <div class="btn-login">
            <button onclick="kakaoLogin()" class="btn" style="padding: 0px">
                <img class="btn-goLogin" src="<c:url value="/img/member/kakao_login.png"/>" alt=""/>
            </button>
        </div>
        <div class="btn-login">
            <%
                String clientId = "SM6kP7n6zyadJ15rvs6z";//애플리케이션 클라이언트 아이디값";
                String redirectURI = URLEncoder.encode("http://delvering.cafe24.com/member/NaverLogin", "UTF-8");
                SecureRandom random = new SecureRandom();
                String state = new BigInteger(130, random).toString();
                String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                apiURL += "&client_id=" + clientId;
                apiURL += "&redirect_uri=" + redirectURI;
                apiURL += "&state=" + state;
                session.setAttribute("state", state);
            %>
            <a href="<%=apiURL%>"><img class="btn-goLogin" src="<c:url value="/img/member/btn_naver.png"/>"/></a>
        </div>
    </div>
</div>
<script type="text/javascript">

    function goLogin() {
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
                    alert('로그인에 성공했습니다.');
                    location.href = '<c:url value="/board/MainPage"/>'
                } else if(response.loginResult === 'signoutmember'){
                    alert('회원 정보가 맞지 않습니다.');
                }else if(response.loginResult === 'fail'){
                    alert('회원 정보가 맞지 않습니다.');
                }
            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }

    Kakao.init('ff02c77cc518953296a556a4691cd2f8'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인1
    function kakaoLogin() {

        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        console.log(response)
                        if(response.loginResult === 'success') {
                            location.href = response.goUrl
                        } else {
                            isSocialSignIn(response)
                        }
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }
    //카카오로그아웃
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)


        }
    }

    // if (!Kakao.Auth.getAccessToken()) {
    //     console.log('Not logged in.');
    // }
    // Kakao.Auth.logout(function() {
    //     console.log(Kakao.Auth.getAccessToken());
    // });

    // var naver_id_login = new naver_id_login("SM6kP7n6zyadJ15rvs6z", "http://localhost:8080/JustStudy_war_exploded2/member/MemberSocialNaverLoginReg");
    // var state = naver_id_login.getUniqState();
    // naver_id_login.setButton("white", 2,40);
    // naver_id_login.setDomain("http://localhost:8080");
    // naver_id_login.setState(state);
    // naver_id_login.setPopup();
    //
    // naver_id_login.init_naver_id_login();


    // const naverLogin = new naver.LoginWithNaverId(
    //     {
    //         clientId: "SM6kP7n6zyadJ15rvs6z",
    //         callbackUrl: "http://localhost:8080/JustStudy_war_exploded2/member/MemberLoginForm",
    //         loginButton: {color: "green", type: 2, height: 40}
    //     }
    // );


    function getUserInformation() {
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                // alert(JSON.stringify(res))
                console.log(JSON.stringify(res));
                alert(res.properties["nickname"]);
            },
            fail: function(error) {
                alert(
                    'login success, but failed to request user information: ' +
                    JSON.stringify(error)
                )
            },
        })
    }


    function setUserInformation() {
        Kakao.API.request({
            url: '/v1/user/update_profile',
            data: {
                properties: {
                    '${name}': '${"야호"}'
                },
            },
            success: function(response) {
                console.log(response);
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }

    function isSocialSignIn(response) {
        let form_data = {
            social_id:response.id,
            social_email:response.kakao_account['email'],
            realname:response.kakao_account['profile'].nickname
        }

        $.ajax({
            url:'<c:url value="/memberNonView/MemberSocialLoginReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'JSON',
            success:function(response){
                let msg = decodeURIComponent(response.loginResult).replaceAll("+"," ")

                if(msg === 'signoutmember') {
                    alert('회원 정보가 맞지 않습니다.');
                } else {
                    alert(msg);
                    location.href = response.goUrl;
                }
            },
            error:function(e){
                console.log(e.responseText)
            }
        })



    }

</script>