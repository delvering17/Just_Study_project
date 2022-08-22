package notice_p;

import model_p.EventDAO;
import model_p.EventDTO;
import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeModifyForm implements NoticeService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));


        NoticeDAO dao = new NoticeDAO();
        NoticeDTO dto = dao.detail(id);


        request.setAttribute("mainUrl", "notice/modifyForm.jsp");
        request.setAttribute("dto", dto);
    }
}
