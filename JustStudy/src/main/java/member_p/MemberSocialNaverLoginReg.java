package member_p;


import memberNonView_p.MemberNonViewService;
import member_p.MemberService;
import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


public class MemberSocialNaverLoginReg implements MemberService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String token = request.getParameter("access_token"); // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가

        System.out.println("토큰토큰 " + token);
        String apiURL = "https://openapi.naver.com/v1/nid/me";


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);


        System.out.println(responseBody);
        JSONObject obj = null;
        try {
            JSONParser jsonParser = new JSONParser();
            obj = (JSONObject) jsonParser.parse(responseBody);

            obj = (JSONObject) jsonParser.parse(obj.get("response").toString());
            System.out.println(obj.get("name"));
            System.out.println(obj.get("id"));
            System.out.println(obj.get("email"));

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }


//
//
        String social_email = obj.get("email").toString();
        String social_id = obj.get("id").toString();
        String realname = obj.get("name").toString();
//        System.out.println(social_id);
        int mem_id = new MemberDAO().isSocialId(social_id);
//
        System.out.println(mem_id);

        String msg = "";
        String mainUrl = "";
        String logintype = request.getParameter("logintype");

        if(mem_id != 0) {
            MemberDTO memberDTO = new MemberDAO().detail(mem_id);
            // 이미 가입된 회원

            // 탈퇴한 회원
            if(memberDTO.getMem_level() == 5) {
                msg = "탈퇴한 회원입니다.";
                mainUrl = "member/member_alert.jsp";
                request.setAttribute("goUrl", "../board/MainPage");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("login", mem_id);
                session.setAttribute("logintype", "naver");
                session.setAttribute("level", memberDTO.getMem_level());
                msg = "로그인에 성공했습니다";
                mainUrl = "member/member_alert.jsp";
                request.setAttribute("goUrl", "../board/MainPage");

            }

        } else {
            // 가입 되지 않은 회원
            msg = "가입 되지 않은 회원입니다. 회원 가입을 진행해 주세요";
            mainUrl = "member/member_signinForm_naver.jsp";
            request.setAttribute("socialid",social_id);
            request.setAttribute("social_email",social_email);
            request.setAttribute("realname",realname);
        }
//
//        try {
//
//            response.getWriter().append(jj.toJSONString());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

//
        request.setAttribute("member_msg", msg);
//        request.setAttribute("mainUrl", mainUrl);
        request.setAttribute("mainUrl", mainUrl);

//        request.setAttribute("mainUrl", mainUrl);

    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}

