package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

public class MyReservationList implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ArrayList<ReservationDTO> myReservation = new ArrayList<ReservationDTO>();
        ArrayList<ReservationDTO> myReservationToday = new ReservationDAO().myReservationListToday(memberDTO.getMem_id());

        if(request.getParameter("type").equals("will")){
            myReservation =  new ReservationDAO().myReservationListWill(memberDTO.getMem_id());
            for(ReservationDTO reservationDTO : myReservationToday){
                String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
                int nowTime = new Date().getHours();
                if(nowTime <= Integer.parseInt(lastTime)){
                    myReservation.add(reservationDTO);
                }
            }
        } else if(request.getParameter("type").equals("done")){
            myReservation = new ReservationDAO().myReservationListDone(memberDTO.getMem_id());
            for(ReservationDTO reservationDTO : myReservationToday){
                String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
                int nowTime = new Date().getHours();
                if(nowTime > Integer.parseInt(lastTime)){
                    myReservation.add(reservationDTO);
                }
            }
        }


        request.setAttribute("myReservation", myReservation);
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","reservation_list.jsp");
    }
}
