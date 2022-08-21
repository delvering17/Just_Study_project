package event_p;

import community_p.CommunityService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDetail implements EventService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));

        EventDAO dao = new EventDAO();

        EventDTO dto = dao.detail(id);

        request.setAttribute("mainUrl","event/detail.jsp");
        request.setAttribute("dto", dto);
    }
}
