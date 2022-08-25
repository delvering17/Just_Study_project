package mypageNonView_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MypageChangePasswordReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();

        int mem_id = (int) session.getAttribute("login");
        String input_now_password = request.getParameter("input_now_password");
        String input_new_password = request.getParameter("input_new_password");
        String input_new_password_repeat = request.getParameter("input_new_password_repeat");


        JSONObject jj = new JSONObject();
        // TODO - 유효성 검사 필요
        MemberDTO dto = new MemberDAO().detail(mem_id);

        // 현재 비밀번호와 입력한 현재 비밀번호와 다른 경우
        if(!input_now_password.equals(dto.getMem_password())) {
            jj.put("changeResult","notCertified");
        } else {
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setMem_id(mem_id);
            memberDTO.setMem_password(input_new_password);

            new MemberDAO().changePassword(memberDTO);
            jj.put("changeResult","success");
        }


        try {


            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
