package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class AdminEventInsertReg implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/event");
      /*  path = "/Users/song-chanwook/workplace/git_repo/ JustStudy/Just_Study_project/JustStudy/src/main/webapp/img/event";
        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\event";*/

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

        } catch (Exception e) {
            e.printStackTrace();
        }
        new EventDAO().insert(dto);

        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("msg", "입력되었습니다.");
        request.setAttribute("goUrl", "AdminEventDetail?id=" + dto.getId());

    }
}
