package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;


public class MemberSigninReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_userid = request.getParameter("input_userid");
        String input_password1 = request.getParameter("input_password1");
        String input_password2 = request.getParameter("input_password2");
        String input_nickname = request.getParameter("input_nickname");
        String input_realname = request.getParameter("input_realname");
        String input_address1 = request.getParameter("input_address1");
        String input_address2 = request.getParameter("input_address2");
        String input_socialid = request.getParameter("input_socialid");






        MemberDTO memberDTO = new MemberDTO();


        memberDTO.setMem_userid(input_userid);
        memberDTO.setMem_password(input_password1);
        memberDTO.setMem_nickname(input_nickname);
        memberDTO.setMem_socialid(input_socialid);
        memberDTO.setMem_social(2);
        memberDTO.setMem_realname(input_realname);
        memberDTO.setMem_address1(input_address1);
        memberDTO.setMem_address2(input_address2);
        memberDTO.setMem_level(1);


        new MemberDAO().signIn(memberDTO);


        JSONObject jj = new JSONObject();
        try {
                jj.put("signinResult", "success");
                jj.put("msg", "success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}
