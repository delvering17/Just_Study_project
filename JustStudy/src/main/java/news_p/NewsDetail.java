package news_p;

import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsDetail implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));


        NewsDAO dao = new NewsDAO();

        NewsDTO dto = dao.detail(id);

        request.setAttribute("mainUrl","news/detail.jsp");
        request.setAttribute("dto", dto);
    }
}
