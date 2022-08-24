package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;


public class AdminUserDelete implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        int adminDeleteId = Integer.parseInt(request.getParameter("user"));

        MemberDTO memberDTO = new MemberDAO().detail(adminDeleteId);
        ArrayList<ReservationDTO> myReservation = new ReservationDAO().myReservationListWill(memberDTO.getMem_id(), null);
        ArrayList<ReservationDTO> myReservationToday = new ReservationDAO().myReservationListToday(memberDTO.getMem_id());

        for(ReservationDTO reservationDTO : myReservationToday){
            String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
            int nowTime = new Date().getHours();
            if(nowTime <= Integer.parseInt(lastTime)){
                myReservation.add(reservationDTO);
            }
        }

        String msg = "";
        if(myReservation.size() > 0) {
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
