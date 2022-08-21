package admin_p;



import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminEventList implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<EventDTO> arr_eventDTO = new EventDAO().list();

        request.setAttribute("arr_eventDTO",arr_eventDTO);
        request.setAttribute("adminUrl","adminEventList.jsp");
    }
}
