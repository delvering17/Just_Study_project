package mypage_p;


import model_p.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@WebServlet("/mypage/*")
public class MypageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    HashMap<String, String> nonService = new HashMap<String, String>();

    public MypageController() {
        super();
        nonService.put("asdf", "mypage/mypageTemplete.jsp");
        nonService.put("MypageChangePasswordForm", "mypage_changePasswordForm.jsp");
        nonService.put("MypageSignoutForm", "mypage_signoutForm.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String service = request.getRequestURI().substring((request.getContextPath()+"/mypage/").length());
        System.out.println(request.getRequestURI());
        System.out.println(service);
        try {

            if(nonService.containsKey(service)) {
                request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
                request.setAttribute("subUrl",nonService.get(service));
                request.setAttribute("memberDTO",new MemberDAO().detail((Integer) (request.getSession()).getAttribute("login")));
            } else {
                MypageService bs = (MypageService) Class.forName("mypage_p."+service).newInstance();
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
