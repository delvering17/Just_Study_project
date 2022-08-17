package mypageNonView_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MypageInsertInquiryReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();
        int mem_id = (int) session.getAttribute("login");
        String input_writer = request.getParameter("input_writer");
        String input_title = request.getParameter("input_title");
        String input_content = request.getParameter("input_content");
        String input_category = request.getParameter("input_category");
        String input_type = request.getParameter("input_type");
        String input_branch = request.getParameter("input_branch");


        // TODO - 유효성 검사 필요




        // 결과




        JSONObject jj = new JSONObject();

        try {


            jj.put("insertResult","success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
