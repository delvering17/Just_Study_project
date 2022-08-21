package admin_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminFAQInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        FaqDTO faqDTO = new FaqDTO();

        faqDTO.setCategory(request.getParameter("faq-category"));
        faqDTO.setQuestion(request.getParameter("faq-question"));
        faqDTO.setAnswer(request.getParameter("faq-answer"));

        new FaqDAO().insert(faqDTO);

        request.setAttribute("msg", "추가되었습니다.");
        request.setAttribute("adminUrl","alert.jsp");
        request.setAttribute("goUrl","AdminFAQList");
    }
}
