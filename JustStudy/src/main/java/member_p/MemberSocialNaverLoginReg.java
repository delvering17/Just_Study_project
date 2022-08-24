package member_p;


import memberNonView_p.MemberNonViewService;
import member_p.MemberService;
import model_p.MemberDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


public class MemberSocialNaverLoginReg implements MemberService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("mainUrl", "member/member_NaverAlert.jsp");
        request.setAttribute("goUrl", "../board/MainPage");

    }
}

