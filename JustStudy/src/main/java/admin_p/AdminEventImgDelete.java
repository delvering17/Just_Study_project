package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class AdminEventImgDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/branch");
        path = "/Users/song-chanwook/workplace/git_repo/ JustStudy/Just_Study_project/JustStudy/src/main/webapp/img/event";

        //todo : 배포할땐 뒤에꺼 주석처리

        int size = 1024 * 1024 * 10;

        try {
            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());

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

            if(new EventDAO().imgDelete(eventDTO) > 0){
                new File(path + "\\" + eventDTO.getImg()).delete();
                msg = "이미지를 삭제했습니다.";
                eventDTO.setImg(null);
            }

            request.setAttribute("adminUrl", "adminEventDetail.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("eventDTO", eventDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
