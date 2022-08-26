package admin_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminFAQModifyReg implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int faq_id = Integer.parseInt(request.getParameter("faq-id"));
        String question = request.getParameter("faq-question");
        String answer = request.getParameter("faq-answer");

        if(question==""){
            String msg = "질문을 적어주세요";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQModifyDelete?faqId="+faq_id+"&type=수정");

        }else if(answer==""){
            String msg = "답변을 적어주세요";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQModifyDelete?faqId="+faq_id+"&type=수정");

        }else if(question.isBlank() || answer.isBlank()) {
            String msg = "공백으로만 수정할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminFAQModifyDelete?faqId="+faq_id+"&type=수정");

        }else{
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
}
