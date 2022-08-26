package admin_p;

import model_p.EventDAO;
import model_p.EventDTO;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class AdminEventDeleteReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String path = request.getRealPath("/img/news");
        path = "/Users/song-chanwook/workplace/git_repo/ JustStudy/Just_Study_project/JustStudy/src/main/webapp/img/event";

        EventDTO eventDTO = new EventDAO().detail(Integer.parseInt(request.getParameter("id")));


        new EventDAO().delete(Integer.parseInt(request.getParameter("id")));

        new File(path + "\\" + eventDTO.getContent()).delete();
        new File(path + "\\" + eventDTO.getImg()).delete();


        String msg = "삭제 되었습니다.";
        String goUrl = "AdminEventList";

        request.setAttribute("adminUrl","alert.jsp");
        request.setAttribute("msg",msg);
        request.setAttribute("goUrl",goUrl);


    }
}
