package admin_p;

import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminEventModifyForm implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));


        EventDTO eventDTO = new EventDAO().detail(id);


        request.setAttribute("eventDTO", eventDTO);
        request.setAttribute("adminUrl", "adminEventModifyForm.jsp");
    }
}
