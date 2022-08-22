package notice_p;

import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class NoticePage implements NoticeService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<NoticeDTO> mainData = new NoticeDAO().list();


        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "notice/notice-list.jsp");
    }
}
