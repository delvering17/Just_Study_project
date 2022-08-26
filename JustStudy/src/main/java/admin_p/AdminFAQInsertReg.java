package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminFAQInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String question = request.getParameter("faq-question");
        String answer = request.getParameter("faq-answer");

        if(question==""){
            String msg = "질문을 적어주세요";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQInsert");

        }else if(answer==""){
            String msg = "답변을 적어주세요";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQInsert");

        }else if(question.isBlank() || answer.isBlank()) {
            String msg = "공백으로만 수정할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQInsert");

        }else{
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
}
