package event_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EventInsertReg implements EventService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");


            EventDTO dto = new EventDTO();
            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));
            dto.setImg(request.getParameter("img"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                dto.setEvent_startdate(sdf.parse(request.getParameter("event_startdate")));
                dto.setEvent_enddate(sdf.parse(request.getParameter("event_enddate")));
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

            new EventDAO().insert(dto);


            System.out.println(dto);

            request.setAttribute("mainUrl", "event/alert.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            request.setAttribute("goUrl", "EventDetail?id=" + dto.getId());

    }
}
