package notice_p;


import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDetail implements NoticeService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));


        NoticeDAO dao = new NoticeDAO();

        NoticeDTO dto = dao.detail(id);

        request.setAttribute("mainUrl","notice/detail.jsp");
        request.setAttribute("dto", dto);
    }
}
