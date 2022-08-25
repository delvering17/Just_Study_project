package notice_p;

import model_p.EventDAO;
import model_p.EventDTO;
import model_p.NoticeDAO;
import model_p.NoticeDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NoticeInsertReg implements NoticeService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {



        try {
            NoticeDTO dto = new NoticeDTO();
            dto.setTitle(request.getParameter("title"));
            /*dto.setReg_date(request.getParameter("reg_date"));*/
            dto.setContent(request.getParameter("content"));


            new NoticeDAO().insert(dto);


            System.out.println(dto);

            request.setAttribute("mainUrl", "notice/alert.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            request.setAttribute("goUrl", "NoticeDetail?id=" + dto.getId());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
