package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUserListSearch implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<MemberDTO> adminData;

        String userType = request.getParameter("userList-search");
        String userValue = request.getParameter("searchUserList-input");

        adminData = new MemberDAO().userListFilter(userType, userValue);

        request.setAttribute("adminData", adminData);
        request.setAttribute("adminUrl","adminUserList.jsp");



    }
}
