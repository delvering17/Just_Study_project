package admin_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class adminFAQModifyDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        if(request.getParameter("type") == null){

            String msg = "삭제 실패하였습니다.";

            if(new FaqDAO().delete(Integer.parseInt(request.getParameter("faqId"))) > 0){
                msg = "삭제되었습니다.";
            }

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("goUrl", "AdminFAQList");

        } else if(request.getParameter("type").equals("수정")){

            FaqDTO faqDTO = new FaqDAO().detail(Integer.parseInt(request.getParameter("faqId")));

            request.setAttribute("faqDTO", faqDTO);
            request.setAttribute("adminUrl", "adminFAQModifyForm.jsp");
        }
    }
}
