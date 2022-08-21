package event_p;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@WebServlet("/event/*")
public class EventController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    HashMap<String,String> nonService = new HashMap<>();


    public EventController(){
        super();
        nonService.put("EventInsertForm", "event/insertForm.jsp");
        nonService.put("EventDeleteForm", "event/deleteForm.jsp");
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        try{
            request.setCharacterEncoding("UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }



        String service = request.getRequestURI().substring((request.getContextPath()+"/event/").length());

        try {
            if(nonService.containsKey(service)){
                request.setAttribute("mainUrl",nonService.get(service));

            }else {
                EventService es = (EventService) Class.forName("event_p." + service).newInstance();
                es.execute(request, response);
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
