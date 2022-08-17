package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBlackListAdd implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int modifyId = Integer.parseInt(request.getParameter("user"));

        MemberDTO blackListAdd = new MemberDAO().detail(modifyId);

        request.setAttribute("blackListAdd", blackListAdd);
        request.setAttribute("adminUrl", "adminBlackListModify.jsp");
    }
}
