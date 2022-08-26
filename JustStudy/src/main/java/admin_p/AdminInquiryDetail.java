package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AdminInquiryDetail implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        int inquiry_id = Integer.parseInt(request.getParameter("inquiry_id"));

        InquiryDTO inquiryDTO = new InquiryDAO().inquiryDetail(inquiry_id);


        MemberDTO dto = new MemberDAO().detail(inquiryDTO.getInquiry_writer());
        request.setAttribute("inquiry_writer", dto.getMem_realname());

        if(inquiryDTO.getInquiry_state() == 2) {
            InquiryDTO answerDTO = new InquiryDAO().answerDetail(inquiry_id);

            MemberDTO mmm = new MemberDAO().detail(answerDTO.getInquiry_writer());

            request.setAttribute("answerWriterName", mmm.getMem_realname());
            request.setAttribute("answerDTO", answerDTO);
        }

        HttpSession session = request.getSession();
        int mem_id = (int) session.getAttribute("login");
        MemberDTO memberDTO = new MemberDAO().detail(mem_id);

        request.setAttribute("mem_realname", memberDTO.getMem_realname() );
        request.setAttribute("inquiryDTO", inquiryDTO);

        request.setAttribute("adminUrl","adminInquiryDetail.jsp");

    }
}
