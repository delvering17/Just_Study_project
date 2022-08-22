package reservation_p;

import admin_p.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/reservation/*")
public class ReservationController extends HttpServlet {

    HashMap<String, String> nonService = new HashMap<String, String>();

    public ReservationController() {
        super();
        nonService.put("UsageInfo", "reservation/usageInfo.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        request.setCharacterEncoding("UTF-8");
        String service = request.getRequestURI().substring((request.getContextPath()+"/reservation/").length());
        try {

            if(nonService.containsKey(service)) {
                request.setAttribute("mainUrl", nonService.get(service));
            } else{

                ReservationService rs = (ReservationService) Class.forName("reservation_p."+service).newInstance();
                rs.execute(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/template.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        doGet(request, response);
    }
}
