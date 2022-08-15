package mypageNonView_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MypageSignoutReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();

        int mem_id = (int) session.getAttribute("login");
        String input_password = request.getParameter("input_password");

        // TODO - 유효성 검사 필요


        // 결과
        new MemberDAO().signOut(mem_id);

        JSONObject jj = new JSONObject();
        try {

            jj.put("signoutResult","success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
