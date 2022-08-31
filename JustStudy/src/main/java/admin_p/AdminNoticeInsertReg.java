package admin_p;

import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            NoticeDTO dto = new NoticeDTO();
            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));


            new NoticeDAO().insert(dto);



            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            request.setAttribute("goUrl", "AdminNoticeDetail?id=" + dto.getId());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
