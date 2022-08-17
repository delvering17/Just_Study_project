package admin_p;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getRequestURI().substring((request.getContextPath()+"/admin/").length());

        try {
            AdminService as = (AdminService) Class.forName("admin_p."+service).newInstance();
            as.execute(request, response);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/adminTemplate.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
