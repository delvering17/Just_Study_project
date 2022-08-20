package event_p;

import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventModifyForm implements EventService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);

        EventDAO dao = new EventDAO();
        EventDTO dto = dao.detail(id);


        request.setAttribute("mainUrl", "event/modifyForm.jsp");
        request.setAttribute("dto", dto);
    }
}
