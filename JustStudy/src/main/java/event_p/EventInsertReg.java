package event_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.EventDAO;
import model_p.EventDTO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class EventInsertReg implements EventService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");

        String path = request.getRealPath("/img/event");
        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\event";

        int size = 1024 * 1024 * 10;


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EventDTO dto = new EventDTO();

        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());


            dto.setTitle(mr.getParameter("title"));
            dto.setContent(mr.getParameter("content"));
            dto.setImg(mr.getFilesystemName("img"));
            dto.setEvent_startdate(sdf.parse(mr.getParameter("event_startdate")));
            dto.setEvent_enddate(sdf.parse(mr.getParameter("event_enddate")));


        } catch (IOException e) {
            e.printStackTrace();
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
