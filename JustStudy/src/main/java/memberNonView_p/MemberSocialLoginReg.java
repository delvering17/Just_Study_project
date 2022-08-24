package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;


public class MemberSocialLoginReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        JSONObject jj = new JSONObject();


        String social_email = request.getParameter("social_email");
        String social_id = request.getParameter("social_id");
        String realname = request.getParameter("realname");

        int mem_id = new MemberDAO().isSocialId(social_id);

        if(mem_id != 0) {
            // 이미 가입된 회원
            HttpSession session = request.getSession();
            session.setAttribute("login", mem_id);


            try {
                jj.put("loginResult", URLEncoder.encode("success","UTF-8"));
                jj.put("goUrl", "../board/MainPage");

            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);
            }
        } else {
            // 가입 되지 않은 회원
            try {
                try {
                    request.setCharacterEncoding("UTF-8");
                } catch (UnsupportedEncodingException e) {

                    e.printStackTrace();
                }
                jj.put("loginResult", "fail");
                jj.put("email", social_email );
                jj.put("social_id", social_id );
                jj.put("realname", URLEncoder.encode(realname,"UTF-8") );
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("social_id", social_id);
            request.setAttribute("social_email", social_email);
        }
        try {
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

