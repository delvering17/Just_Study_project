<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/14
  Time: 1:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    // goNaverLogin()
    // https://developers.naver.com/docs/login/profile/profile.md
    <%
      String clientId = "SM6kP7n6zyadJ15rvs6z";//애플리케이션 클라이언트 아이디값";
      String clientSecret = "r_YMa6PAQB";//애플리케이션 클라이언트 시크릿값";
      String code = request.getParameter("code");
      String state = request.getParameter("state");
      String redirectURI = URLEncoder.encode("http://delvering.cafe24.com", "UTF-8");
      String apiURL;
      apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
      apiURL += "client_id=" + clientId;
      apiURL += "&client_secret=" + clientSecret;
      apiURL += "&redirect_uri=" + redirectURI;
      apiURL += "&code=" + code;
      apiURL += "&state=" + state;
      String access_token = "";
      String refresh_token = "";
      String id = "";
      System.out.println("apiURL="+apiURL);
      try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        BufferedReader br;
        System.out.print("responseCode="+responseCode);
        if(responseCode==200) { // 정상 호출
          br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
          br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer res = new StringBuffer();

        while ((inputLine = br.readLine()) != null) {
            if(inputLine.contains("access_token")) {
                access_token = inputLine;
            }
          res.append(inputLine);

        }
        br.close();
        if(responseCode==200) {
          System.out.println(res);

        }
      } catch (Exception e) {
        System.out.println(e);
      }
      JSONParser jsonParser = new JSONParser();
      Object obj = jsonParser.parse( access_token );
      JSONObject jsonObj = (JSONObject) obj;

        String go = (String) jsonObj.get("access_token");
//                System.out.println("돼냐?"+go);

    %>
    location.href = '../member/MemberSocialNaverLoginReg?access_token=<%=go%>&logintype=naver'

    <%--naverLogin.getLoginStatus(function (status) {--%>
    <%--    alert('여기왔당 '+ status)--%>
    <%--    if (status) {--%>
    <%--        let form_data = {--%>
    <%--            social_id: naverLogin.user.getId(),--%>
    <%--            social_email: naverLogin.user.getEmail(),--%>
    <%--            realname: naverLogin.user.getName()--%>
    <%--        };--%>
    <%--        $.ajax({--%>
    <%--            url: '<c:url value="/memberNonView/MemberSocialLoginReg"/>',--%>
    <%--            type: 'GET',--%>
    <%--            data: form_data,--%>
    <%--            async: false,--%>
    <%--            dataType: 'JSON',--%>
    <%--            success: function (response) {--%>
    <%--                if (response.loginResult === 'success') {--%>
    <%--                    alert('로그인 되었습니다.');--%>
    <%--                    location.href = response.goUrl;--%>
    <%--                } else {--%>
    <%--                    let email = naverLogin.user.getEmail()--%>
    <%--                    let social_id = naverLogin.user.getId()--%>
    <%--                    let realname = naverLogin.user.getName()--%>
    <%--                    $('#email').val(email)--%>
    <%--                    $('#social_id').val(social_id)--%>
    <%--                    $('#realname').val(realname)--%>
    <%--                    alert('가입 되지 않은 회원입니다. 회원가입을 진행해주세요')--%>
    <%--                    $('#fff').submit()--%>
    <%--                }--%>
    <%--            },--%>
    <%--            error: function (e) {--%>
    <%--                alert('실패');--%>
    <%--                // console.log(e.responseText)--%>
    <%--            }--%>
    <%--        });--%>


    <%--        // const nickName=naverLogin.user.getNickName();--%>
    <%--        // const age=naverLogin.user.getAge();--%>
    <%--        // const birthday=naverLogin.user.getBirthday();--%>

    <%--        //닉네임을 선택하지 않으면 선택창으로 돌아갑니다.--%>
    <%--        // if(nickName===null||nickName===undefined ){--%>
    <%--        //--%>
    <%--        //     naverLogin.reprompt();--%>
    <%--        //     return ;--%>
    <%--        // }else{--%>
    <%--        //     setLoginStatus(); //모든 필수 정보 제공 동의하면 실행하는 함수--%>
    <%--        // }--%>

    <%--    }--%>
    <%--});--%>
</script>
