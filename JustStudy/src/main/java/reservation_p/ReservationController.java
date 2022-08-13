package reservation_p;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/reservation/*")
public class ReservationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String service = request.getRequestURI().substring((request.getContextPath()+"/reservation/").length());
        try {
            ReservationService rs = (ReservationService) Class.forName("reservation_p."+service).newInstance();
            rs.execute(request, response);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/template.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

    }
}
