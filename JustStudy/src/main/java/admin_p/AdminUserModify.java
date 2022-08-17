package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserModify implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int modifyId = Integer.parseInt(request.getParameter("user"));

        MemberDTO adminModifyDTO = new MemberDAO().detail(modifyId);

        request.setAttribute("adminModifyDTO",adminModifyDTO);
        request.setAttribute("adminUrl", "adminUserModify.jsp");
        /*request.setAttribute("goUrl","AdminUserList");*/
    }
}
