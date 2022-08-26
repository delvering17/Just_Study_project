package memberNonView_p;


import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class MemberSocialSigninReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_userid = request.getParameter("input_userid");
        String input_socialid = request.getParameter("input_socialid");
        String input_nickname = request.getParameter("input_nickname");
        String input_realname = request.getParameter("input_realname");
        String input_address1 = request.getParameter("input_address1");
        String input_address2 = request.getParameter("input_address2");

        // 여기 유효성 검사 다 해줘야함 찬욱아 까먹지마라

        MemberDTO memberDTO = new MemberDTO();

        memberDTO.setMem_social(2); // 나중에 바꿔라

        memberDTO.setMem_userid(input_userid);
        memberDTO.setMem_nickname(input_nickname);
        memberDTO.setMem_realname(input_realname);
        memberDTO.setMem_address1(input_address1);
        memberDTO.setMem_address2(input_address2);
        memberDTO.setMem_socialid(input_socialid);
        memberDTO.setMem_level(1);

        //  TODO - 유효성 검사 필요


        new MemberDAO().signInSocial(memberDTO);

        JSONObject jj = new JSONObject();
        try {
                jj.put("msg", "success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}
