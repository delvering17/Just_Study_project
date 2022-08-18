package admin_p;

import model_p.BlackDAO;
import model_p.BlackDTO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBlackListAdd implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int blackListAddId = Integer.parseInt(request.getParameter("user"));

        request.setAttribute("blackListAddId",blackListAddId);
        request.setAttribute("adminUrl", "adminBlackListAdd.jsp");
    }
}
