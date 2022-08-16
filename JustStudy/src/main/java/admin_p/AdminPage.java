package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminPage implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("adminUrl","adminMain.jsp");
    }
}
