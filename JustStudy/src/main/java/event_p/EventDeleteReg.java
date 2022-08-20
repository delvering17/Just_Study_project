package event_p;


import model_p.EventDAO;
import model_p.EventDTO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDeleteReg implements EventService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        new EventDAO().delete(Integer.parseInt(request.getParameter("id")));

        String msg = "삭제 되었습니다.";
        String goUrl = "EventPage";

        request.setAttribute("mainUrl", "event/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
    }
}
