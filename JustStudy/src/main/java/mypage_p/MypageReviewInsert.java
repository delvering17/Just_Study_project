package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReviewDAO;
import model_p.ReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageReviewInsert implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        System.out.println(session.getAttribute("login"));
        System.out.println(memberDTO.toString());

        ReviewDTO reviewDTO = new ReviewDTO();
        reviewDTO.setReservId(Integer.parseInt(request.getParameter("reservId")));
        reviewDTO.setMemId(memberDTO.getMem_id());
        reviewDTO.setContent(request.getParameter("reviewContent"));

        new ReviewDAO().insert(reviewDTO);
        new ReviewDAO().reviewDone(reviewDTO);
    }
}
