package notice_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;
import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class NoticeModifyReg implements NoticeService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        NoticeDTO dto = new NoticeDTO();

        try {

            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));
            dto.setId(Integer.parseInt(request.getParameter("id")));

            String msg = "수정 실패";
            String mainUrl = "notice/modifyForm.jsp";

            if(new NoticeDAO().modify(dto) > 0){
                msg = "수정되었습니다.";
                mainUrl = "notice/alert.jsp";

            }

            request.setAttribute("msg", msg);
            request.setAttribute("mainUrl", mainUrl);
            request.setAttribute("goUrl", "NoticeDetail?id="+dto.getId());
            request.setAttribute("NoticeDTO", dto);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }




    }
}
