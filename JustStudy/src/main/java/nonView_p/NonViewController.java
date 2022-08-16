package nonView_p;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/nonView/*")
public class NonViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String service = request.getRequestURI().substring((request.getContextPath()+"/nonView/").length());

        try {
            NonViewService ns = (NonViewService) Class.forName("nonView_p."+service).newInstance();
            ns.execute(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

    }
}
