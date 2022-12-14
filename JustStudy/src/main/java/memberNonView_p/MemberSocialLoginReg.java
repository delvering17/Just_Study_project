package memberNonView_p;


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
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class MemberSocialLoginReg implements MemberNonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject jj = new JSONObject();


        String social_email = request.getParameter("social_email");
        String social_id = request.getParameter("social_id");
        String realname = request.getParameter("realname");

        int mem_id = new MemberDAO().isKakaoSocialId(social_id);

        MemberDTO memberDTO = new MemberDAO().detail(mem_id);

        if(mem_id != 0) {
            // 이미 가입된 회원

            try {
                // 탈퇴한 회원
                if(memberDTO.getMem_level() == 5) {
                    jj.put("loginResult", "signoutmember");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", mem_id);
                    session.setAttribute("logintype", "kakao");
                    session.setAttribute("level", memberDTO.getMem_level());
                    jj.put("loginResult", URLEncoder.encode("로그인 되었습니다.","UTF-8"));
                    jj.put("goUrl", "../board/MainPage");
                }
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);
            }
        } else {
            // 가입 되지 않은 회원
            try {
                jj.put("loginResult", URLEncoder.encode("가입 되지 않은 회원입니다. 회원가입을 진행해주세요","UTF-8"));

                try {
                    request.setCharacterEncoding("UTF-8");
                } catch (UnsupportedEncodingException e) {

                    e.printStackTrace();
                }

                jj.put("goUrl", "../member/MemberSocialSigninForm?social_email="+social_email + "&realname="+ URLEncoder.encode(realname,"UTF-8") + "&social_id="+social_id);

            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);
            }
            HttpSession session = request.getSession();
            session.setAttribute("social_id", social_id);
            request.setAttribute("social_email", social_email);
        }

        try {
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}


