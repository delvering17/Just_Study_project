package community_p;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@WebServlet("/community/*")
public class CommunityController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    HashMap<String,String> nonService = new HashMap<>();

    public CommunityController(){
        super();
        nonService.put("CommunityDeleteForm", "community/community_deleteForm.jsp");
        nonService.put("CommunityApplyDeleteForm", "community/community_applyDeleteForm.jsp");
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        try{
            request.setCharacterEncoding("UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }

        String service = request.getRequestURI().substring((request.getContextPath()+"/community/").length());
        System.out.println(service);

        try {
            if(nonService.containsKey(service)){
                request.setAttribute("mainUrl",nonService.get(service));

            }else {
                CommunityService cs = (CommunityService) Class.forName("community_p." + service).newInstance();
                cs.execute(request, response);
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
