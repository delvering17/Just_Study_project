package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class AdminEventImgContentDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminImageDelete 들어왔다");

        String path = request.getRealPath("/img/news");
       /* path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\news";*/

        path = "/Users/song-chanwook/workplace/git_repo/JustStudy/Just_Study_project/JustStudy/src/main/webapp/img/event";

        int size = 1024 * 1024 * 10;

        EventDTO dto = new EventDTO();

        try {
            MultipartRequest mr= new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            EventDTO eventDTO = new EventDTO();
            eventDTO.setId(Integer.parseInt(mr.getParameter("id")));
            eventDTO.setTitle(mr.getParameter("title"));
            eventDTO.setReg_date(sdf.parse(mr.getParameter("reg_date")));
            eventDTO.setEvent_startdate(sdf.parse(mr.getParameter("event_startdate")));
            eventDTO.setEvent_enddate(sdf.parse(mr.getParameter("event_enddate")));
            eventDTO.setContent(mr.getParameter("content"));
            eventDTO.setImg(mr.getParameter("img"));

            String msg = "이미지 삭제 실패";

            if (new EventDAO().contentDelete(dto) > 0) {
                new File(path + "\\" + dto.getContent()).delete();
                msg = "이미지를 삭제했습니다.";
                dto.setContent(null);
            }


            request.setAttribute("msg",msg);
            request.setAttribute("eventDTO", eventDTO);
            request.setAttribute("adminUrl","adminEventDetail.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
