package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;



public class MemberLoginReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_email = request.getParameter("input_email");
        String input_password = request.getParameter("input_password");
//        System.out.println(input_email);
//        System.out.println(input_password);


        MemberDTO memberDTO = new MemberDAO().login(input_email,input_password);


        JSONObject jj = new JSONObject();

        try {
            if(memberDTO != null) {

                HttpSession session = request.getSession();
                session.setAttribute("memberDTO", memberDTO);

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
