package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class AdminInquiryInsert implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {



//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String input_date = sdf.format(new Date());
        String input_title = request.getParameter("input_title");
        int input_writer = Integer.parseInt(request.getParameter("input_writer"));
        String input_content = request.getParameter("input_content");
        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));


        InquiryDTO inquiryDTO = new InquiryDTO();
        inquiryDTO.setInquiry_date(new Date());
        inquiryDTO.setInquiry_title(input_title);
        inquiryDTO.setInquiry_writer(input_writer);
        inquiryDTO.setInquiry_content(input_content);
        inquiryDTO.setInquiry_purpose(input_purpose);

        new InquiryDAO().answerInsert(inquiryDTO);

        request.setAttribute("inquiry_id", input_purpose);

        request.setAttribute("msg", "답변 추가되었습니다.");


        request.setAttribute("adminUrl","adminInquiryDetailAlert.jsp");

        request.setAttribute("goUrl","AdminInquiryDetail?inquiry_id="+input_purpose);

    }
}
