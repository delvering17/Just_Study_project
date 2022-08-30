<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
<div id="wrapper-login">
    <div>
        <p>로그인</p>
    </div>
    <div>
        <div>
            <span><i class="fa-solid fa-key"></i></span>
            <input type="text" id="input-userid" name="input-userid" placeholder="아이디" aria-label="아이디" required/>
        </div>
        <div>
            <span><i class="fa-solid fa-key"></i></span>
            <input type="password" id="input-password"  placeholder="비밀번호" aria-label="비밀번호" required/>
        </div>
<%--        <div>--%>
<%--            <input type="checkbox" id="exampleCheck1"/>--%>
<%--            <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
<%--        </div>--%>
        <div class="wrapper-login">
            <div class="btn-login">
                <button onclick="goLogin()" class="btn btn-dark">로그인</button>
                <button onclick="kakaoLogout()" class="btn btn-dark">로그인</button>
            </div>
            <div class="btn-login">
                <button onclick="kakaoLogin()" class="btn" style="padding: 0px">
                    <img src="<c:url value="/img/member/kakao_login.png"/>" alt=""/>
                </button>
            </div>
            <div class="btn-login">
                <%
                    String clientId = "SM6kP7n6zyadJ15rvs6z";//애플리케이션 클라이언트 아이디값";
                    String redirectURI = URLEncoder.encode("http://localhost:8080/JustStudy/member/NaverLogin", "UTF-8");
                    SecureRandom random = new SecureRandom();
                    String state = new BigInteger(130, random).toString();
                    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                    apiURL += "&client_id=" + clientId;
                    apiURL += "&redirect_uri=" + redirectURI;
                    apiURL += "&state=" + state;
                    session.setAttribute("state", state);
                %>
                <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>

<%--                <button onclick="goNaverLogin()">aaaa</button>--%>
            </div>
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