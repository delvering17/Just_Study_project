package event_p;

import model_p.CommunityDAO;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EventModifyReg implements EventService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("EventModifyFomr 입장~");

        EventDTO dto = new EventDTO();
        dto.setId(Integer.parseInt(request.getParameter("id")));
        dto.setTitle(request.getParameter("title"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dto.setEvent_startdate(sdf.parse(request.getParameter("event_startdate")));
            dto.setEvent_enddate(sdf.parse(request.getParameter("event_enddate")));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        dto.setContent(request.getParameter("content"));
        dto.setImg(request.getParameter("img"));


        String msg = "수정 실패";
        String mainUrl = "event/event_modifyForm.jsp";

        if(new EventDAO().modify(dto) > 0){
            msg = "수정되었습니다.";
            mainUrl = "event/alert.jsp";
            request.setAttribute("goUrl", "EventDetail?id="+dto.getId());
        }

        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", mainUrl);
        request.setAttribute("EventDTO", dto);

    }
}
