package admin_p;

import model_p.BlackDAO;
import model_p.BlackDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminBlackListAddReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String black_id = request.getParameter("black_id");
        String black_reason = request.getParameter("black_reason");

        if(black_reason.trim().equals("")) {

            String msg = "사유를 적어주세요";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminBlackListAdd?user=" + black_id);

        } else{
            BlackDTO blackListData = new BlackDTO();
            blackListData.setBlack_id(Integer.parseInt(request.getParameter("black_id")));
            blackListData.setBlack_reason(request.getParameter("black_reason"));
            new BlackDAO().add(blackListData);

            ArrayList<MemberDTO> adminData = new MemberDAO().list();

            int black_id_level = Integer.parseInt(request.getParameter("black_id"));
            new MemberDAO().blackLevelUp(black_id_level);

            String msg = "추가 완료";
            request.setAttribute("adminData", adminData);
            request.setAttribute("blackListData", blackListData);
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl","AdminBlackList");
        }


    }
}
