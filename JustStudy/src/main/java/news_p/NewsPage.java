package news_p;

import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class NewsPage implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<NewsDTO> mainData = new NewsDAO().list();

        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "news/news-list.jsp");
    }
}
