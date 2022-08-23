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


        String input_userid = request.getParameter("input_userid");
        String input_password = request.getParameter("input_password");



        MemberDTO memberDTO = new MemberDAO().login(input_userid,input_password);


        JSONObject jj = new JSONObject();

        try {
            if(memberDTO == null) {
                jj.put("loginResult", "fail");

            } else if(memberDTO.getMem_level() == 5) {
                jj.put("loginResult", "signoutmember");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("login", memberDTO.getMem_id());
                session.setAttribute("mem_level", memberDTO.getMem_level());

                jj.put("loginResult", "success");

            }


            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}
