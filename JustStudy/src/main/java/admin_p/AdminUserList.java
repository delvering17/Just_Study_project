package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("adminUrl","adminUserList.jsp");
    }
}