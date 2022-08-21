package admin_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminFAQmodifyReg implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        FaqDTO faqDTO = new FaqDTO();

        faqDTO.setId(Integer.parseInt(request.getParameter("faq-id")));
        faqDTO.setQuestion(request.getParameter("faq-question"));
        faqDTO.setAnswer(request.getParameter("faq-answer"));
        faqDTO.setCategory(request.getParameter("faq-category"));

        String msg = "수정 실패";
        String adminUrl = "adminFAQModifyForm.jsp";

        if(new FaqDAO().modify(faqDTO) > 0){
            msg = "수정 완료되었습니다.";
            adminUrl = "alert.jsp";
            request.setAttribute("goUrl", "AdminFAQList");
        }

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("faqDTO", faqDTO);
    }
}
