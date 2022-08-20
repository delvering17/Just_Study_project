package news_p;



import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class NewsPage implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<EventDTO> mainData = new EventDAO().list();
        System.out.println("Eventpage 들어왔따 : "+mainData);


        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "news/news-list.jsp");
    }
}
