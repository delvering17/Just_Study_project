package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminInquiryDetail implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        int inquiry_id = Integer.parseInt(request.getParameter("inquiry_id"));

        InquiryDTO inquiryDTO = new InquiryDAO().inquiryDetail(inquiry_id);

        request.setAttribute("inquiryDTO", inquiryDTO);

        request.setAttribute("adminUrl","adminInquiryDetail.jsp");

    }
}
