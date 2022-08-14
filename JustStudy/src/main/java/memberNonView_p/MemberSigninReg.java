package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class MemberSigninReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_userid = request.getParameter("input_userid");
        String input_password1 = request.getParameter("input_password1");
        String input_password2 = request.getParameter("input_password2");
        String input_phone = request.getParameter("input_phone");
        String input_name = request.getParameter("input_name");
        String input_address1 = request.getParameter("input_address1");
        String input_address2 = request.getParameter("input_address2");

        System.out.println(input_name);
        System.out.println(input_address2);

        JSONObject jj = new JSONObject();


        // 여기 유효성 검사 다 해줘야함 찬욱아 까먹지마라
        try {
                jj.put("msg", "success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}
