package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminInquiryUnansweredList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<InquiryDTO> inquiryUnansweredDTO = new InquiryDAO().inquiryUnanswered();

        request.setAttribute("inquiryUnansweredDTO", inquiryUnansweredDTO);
        request.setAttribute("adminUrl","adminInquiryList.jsp");
    }
}
