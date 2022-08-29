package branch_p;

import main_p.MainService;
import member_p.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/branch/*")
public class BranchController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    HashMap<String,String> nonService = new HashMap<String, String>();
    public BranchController() {
        super();
        nonService.put("CompanyIntroduction", "branch/companyIntroduction.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String service = request.getRequestURI().substring((request.getContextPath()+"/branch/").length());
        System.out.println(request.getRequestURI());


        try {

            if(nonService.containsKey(service)) {
                request.setAttribute("mainUrl",nonService.get(service));
            } else {
                BranchService bs = (BranchService) Class.forName("branch_p."+service).newInstance();
                bs.execute(request, response);
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

    }
}
