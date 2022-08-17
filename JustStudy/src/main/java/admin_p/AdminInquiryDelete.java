package admin_p;

import model_p.InquiryDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInquiryDelete implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int input_id = Integer.parseInt(request.getParameter("input_id"));
        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));




        new InquiryDAO().answerDelete(input_id,input_purpose);



        request.setAttribute("msg", "삭제되었습니다.");


        request.setAttribute("adminUrl","adminInquiryDetailAlert.jsp");

        request.setAttribute("goUrl","AdminInquiryDetail?inquiry_id="+input_purpose);

    }
}
