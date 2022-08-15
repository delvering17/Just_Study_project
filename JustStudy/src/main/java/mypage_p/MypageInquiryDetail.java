package mypage_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MypageInquiryDetail implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        request.setAttribute("memberDTO", memberDTO);


        // detail 글
        int inquiry_id = Integer.parseInt(request.getParameter("inquiry_id"));

        InquiryDTO inquiryDTO = new InquiryDAO().inquiryDetail(inquiry_id);
        request.setAttribute("inquiryDTO", inquiryDTO);


        if(inquiryDTO.getInquiry_state() == 2) {
            InquiryDTO answerDTO = new InquiryDAO().answerDetail(inquiry_id);
            request.setAttribute("answerDTO", answerDTO);
        }


        request.setAttribute("nowPage",request.getParameter("nowPage"));

        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_inquiryDetail.jsp");


    }
}
