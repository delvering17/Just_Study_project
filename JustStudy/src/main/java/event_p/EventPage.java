package event_p;



import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class EventPage implements EventService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<EventDTO> mainData = new EventDAO().list();
        System.out.println("Eventpage 들어왔따 : "+mainData);


        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "event/event-list.jsp");
    }
}
