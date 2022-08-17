package admin_p;

import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminUserDelete implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        int adminDeleteId = Integer.parseInt(request.getParameter("user"));
        String msg = "삭제 완료";

        new MemberDAO().delete(adminDeleteId);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl","AdminUserList");

    }
}
