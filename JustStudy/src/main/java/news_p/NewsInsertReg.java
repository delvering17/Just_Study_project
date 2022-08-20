package news_p;

import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsInsertReg implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");

        try {
            EventDTO dto = new EventDTO();
            dto.setTitle(request.getParameter("title"));
            dto.setEvent_startdate(request.getParameter("event_startdate"));
            dto.setEvent_enddate(request.getParameter("event_enddate"));
            dto.setContent(request.getParameter("content"));


            new EventDAO().insert(dto);


            System.out.println(dto);

            request.setAttribute("mainUrl", "news/alert.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            request.setAttribute("goUrl", "NewsDetail?id=" + dto.getId());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
