package admin_p;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {

    HashMap<String, String> nonService = new HashMap<String, String>();

    public AdminController() {
        super();
        nonService.put("AdminStoreInsert", "adminStoreInsert.jsp");
        nonService.put("AdminEventInsertForm", "adminEventInsertForm.jsp");
        nonService.put("AdminNoticeInsertForm", "adminNoticeInsertForm.jsp");
        nonService.put("AdminNewsInsertForm", "adminNewsInsertForm.jsp");
        nonService.put("AdminNoticeDeleteForm","adminNoticeDeleteForm.jsp");
        nonService.put("AdminFAQInsert", "adminFAQInsert.jsp");
        nonService.put("AdminNewsDeleteForm","adminNewsDeleteForm.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String service = request.getRequestURI().substring((request.getContextPath()+"/admin/").length());

        try {

            if(nonService.containsKey(service)) {
                request.setAttribute("adminUrl", nonService.get(service));
            } else{

                AdminService as = (AdminService) Class.forName("admin_p."+service).newInstance();
                as.execute(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/adminTemplate.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
