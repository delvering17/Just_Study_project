package admin_p;



import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminEventList implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<EventDTO> mainData = new EventDAO().list();

        request.setAttribute("mainData",mainData);
        request.setAttribute("adminUrl","adminEventList.jsp");
    }
}
