package event_p;


import model_p.EventDTO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDeleteReg implements EventService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        EventDTO dto = new EventDTO();

        dto.setId(Integer.parseInt(request.getParameter("id")));

        String msg = "삭제 되었습니다.";
        String goUrl = "CommunityPage";

        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
    }
}
