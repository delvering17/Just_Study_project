package admin_p;

import model_p.BlackDAO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBlackListDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int blackDeleteId = Integer.parseInt(request.getParameter("user"));
        String msg = "삭제 완료";

        new BlackDAO().delete(blackDeleteId);

        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl","AdminBlackList");
    }
}
