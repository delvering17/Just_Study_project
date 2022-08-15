package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyReservationList implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("이용내역");

        HttpSession session = request.getSession();

        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","reservation_list.jsp");
    }
}
