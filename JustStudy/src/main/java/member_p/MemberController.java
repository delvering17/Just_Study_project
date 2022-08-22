package member_p;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    HashMap<String, String> nonService = new HashMap<String, String>();

    public MemberController() {
        super();

        nonService.put("MemberLoginForm","member/member_loginForm.jsp");
        nonService.put("MemberSigninForm","member/member_signinForm.jsp");
        nonService.put("MemberSocialSigninForm","member/member_signinForm_kakao.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();
        }

        String service = request.getRequestURI().substring((request.getContextPath()+"/member/").length());

        try {


            if(nonService.containsKey(service)) {
                request.setAttribute("mainUrl",nonService.get(service));
            } else {
                MemberService bs = (MemberService) Class.forName("member_p."+service).newInstance();
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
        doGet(request, response);
    }
}
