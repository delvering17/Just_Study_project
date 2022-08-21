package admin_p;

import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminNoticeModifyReg 입장~");


        NoticeDTO dto = new NoticeDTO();


        try {

            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));
            dto.setId(Integer.parseInt(request.getParameter("id")));

            String msg = "수정 실패";
            String adminUrl = "AdminNoticeModifyForm.jsp";

            if(new NoticeDAO().modify(dto) > 0){
                msg = "수정되었습니다.";
                adminUrl = "alert.jsp";

            }

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", adminUrl);
            request.setAttribute("goUrl", "AdminNoticeDetail?id="+dto.getId());
            request.setAttribute("NoticeDTO", dto);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
