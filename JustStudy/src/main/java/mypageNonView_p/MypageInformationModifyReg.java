package mypageNonView_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;

public class MypageInformationModifyReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();
        int mem_id = (int) session.getAttribute("login");
        String input_realname = request.getParameter("input_realname");
        String input_nickname = request.getParameter("input_nickname");
//        String input_phone = request.getParameter("input_phone");
        String input_address1 = request.getParameter("input_address1");
        String input_address2 = request.getParameter("input_address2");


        // TODO - 유효성 검사 필요




        // 결과
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMem_id(mem_id);
        memberDTO.setMem_realname(input_realname);
        memberDTO.setMem_nickname(input_nickname);
//        memberDTO.setMem_phone(input_phone);
        memberDTO.setMem_address1(input_address1);
        memberDTO.setMem_address2(input_address2);

        new MemberDAO().modifyInformation(memberDTO);

        JSONObject jj = new JSONObject();
        try {


            jj.put("modifyResult","success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
