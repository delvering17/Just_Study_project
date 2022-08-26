package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminReservationCancelForm implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ReservationDTO reservationDTO = new ReservationDAO().reservationDetail(Integer.parseInt(request.getParameter("id")));
        MemberDTO memberDTO = new MemberDAO().detail(reservationDTO.getUserId());

        request.setAttribute("reservationDTO", reservationDTO);
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("adminUrl", "adminReservationCancelForm.jsp");

    }
}
