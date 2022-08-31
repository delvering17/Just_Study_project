package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class AdminInquiryModify implements AdminService{


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_title = request.getParameter("input_title");
        int input_writer = Integer.parseInt(request.getParameter("input_writer"));
        String input_content = request.getParameter("input_content");
        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));
        int input_id = Integer.parseInt(request.getParameter("input_id"));



        InquiryDTO inquiryDTO = new InquiryDTO();
        inquiryDTO.setInquiry_date(new Date());
        inquiryDTO.setInquiry_title(input_title);
        inquiryDTO.setInquiry_writer(input_writer);
        inquiryDTO.setInquiry_content(input_content);
        inquiryDTO.setInquiry_purpose(input_purpose);
        inquiryDTO.setInquiry_id(input_id);

        new InquiryDAO().answerModify(inquiryDTO);

        request.setAttribute("msg", "수정되었습니다.");


        request.setAttribute("adminUrl","adminInquiryDetailAlert.jsp");

        request.setAttribute("goUrl","AdminInquiryDetail?inquiry_id="+input_purpose);

    }
}
