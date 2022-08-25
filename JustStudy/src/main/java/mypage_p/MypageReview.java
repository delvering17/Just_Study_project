package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageReview implements MypageService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ReservationDTO reservationDTO = new ReservationDAO().reservationDetail(Integer.parseInt(request.getParameter("reservId")));

        request.setAttribute("reservId", request.getParameter("reservId"));
        request.setAttribute("reservationDTO", reservationDTO);
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_reviewForm.jsp");
    }
}
