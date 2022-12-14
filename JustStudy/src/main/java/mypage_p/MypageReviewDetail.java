package mypage_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageReviewDetail implements MypageService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));
        ReviewDTO reviewDTO = new ReviewDAO().detail(Integer.parseInt(request.getParameter("reservId")));
        ReservationDTO reservationDTO = new ReservationDAO().reservationDetail(Integer.parseInt(request.getParameter("reservId")));

        MemberDTO reviewMem = new MemberDAO().detail(reviewDTO.getMemId());

        reviewDTO.setUserNickname(reviewMem.getMem_nickname());

        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("reviewDTO", reviewDTO);
        request.setAttribute("reservationDTO", reservationDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_reviewDetail.jsp");

    }
}
