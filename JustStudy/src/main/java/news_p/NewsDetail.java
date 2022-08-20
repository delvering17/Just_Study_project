package news_p;

import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsDetail implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);

        EventDAO dao = new EventDAO();

        EventDTO dto = dao.detail(id);

        request.setAttribute("mainUrl","news/detail.jsp");
        request.setAttribute("dto", dto);
    }
}
