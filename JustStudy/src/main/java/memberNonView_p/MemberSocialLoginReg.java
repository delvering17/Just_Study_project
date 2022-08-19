package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class MemberSocialLoginReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String social_email = request.getParameter("social_email");
        String social_id = request.getParameter("social_id");

        int mem_id = new MemberDAO().isSocialId(social_id);

        if(mem_id != 0) {
            // 이미 가입된 회원

            HttpSession session = request.getSession();
            session.setAttribute("login", mem_id);

        } else {
            // 가입 되지 않은 회원


        }




        JSONObject jj = new JSONObject();

        try {

            if(true) {

                jj.put("loginResult", "success");

            } else {
                jj.put("loginResult", "fail");
            }


            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}

