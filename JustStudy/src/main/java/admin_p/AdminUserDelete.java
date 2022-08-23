package admin_p;

import model_p.MemberDAO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;


public class AdminUserDelete implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        int adminDeleteId = Integer.parseInt(request.getParameter("user"));

        Date today = new Date();
        boolean hasReservation = false;
        ArrayList<ReservationDTO> arr_reservationDTO = new ReservationDAO().myReservationList(adminDeleteId);
        for( ReservationDTO reservationDTO : arr_reservationDTO) {
            if (reservationDTO.getResDate().getTime() >= today.getTime()) {
                hasReservation = true;
                break;
            }
        }

        String msg;
        if(hasReservation) {
            msg = "현재 예약 건이 있으므로 탈퇴를 할 수 없습니다.";
        } else {
            msg = "탈퇴 완료";
            new MemberDAO().delete(adminDeleteId);
        }
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl","AdminUserList");


    }
}
