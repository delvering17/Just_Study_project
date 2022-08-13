package memberNonView_p;

import main_p.MainService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/memberNonView/*")
public class MemberNonViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String service = request.getRequestURI().substring((request.getContextPath()+"/memberNonView/").length());
        try {
            MemberNonViewService bs = (MemberNonViewService) Class.forName("memberNonView_p."+service).newInstance();
            bs.execute(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

    }
}
