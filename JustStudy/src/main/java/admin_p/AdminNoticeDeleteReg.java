package admin_p;

import model_p.NoticeDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeDeleteReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        new NoticeDAO().delete(Integer.parseInt(request.getParameter("id")));

        String msg = "삭제 되었습니다.";
        String goUrl = "AdminNoticeList";

        request.setAttribute("adminUrl","alert.jsp");
        request.setAttribute("msg",msg);
        request.setAttribute("goUrl",goUrl);
    }
}
