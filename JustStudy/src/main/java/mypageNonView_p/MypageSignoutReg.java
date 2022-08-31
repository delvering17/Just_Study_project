package mypageNonView_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

public class MypageSignoutReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();

        int mem_id = (int) session.getAttribute("login");


        MemberDTO memberDTO = new MemberDAO().detail(mem_id);
        ArrayList<ReservationDTO> myReservation = new ReservationDAO().myReservationListWill(memberDTO.getMem_id(), null);
        ArrayList<ReservationDTO> myReservationToday = new ReservationDAO().myReservationListToday(memberDTO.getMem_id());

        for(ReservationDTO reservationDTO : myReservationToday){
            String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
            int nowTime = new Date().getHours();
            if(nowTime <= Integer.parseInt(lastTime)){
                myReservation.add(reservationDTO);
            }
        }

        JSONObject jj = new JSONObject();
        try {
            if(myReservation.size() >0 ) {

                jj.put("signoutResult","hasReservation");

            } else {

                session.removeAttribute("login");
                new MemberDAO().delete(mem_id);
                jj.put("signoutResult","success");
            }

            response.getWriter().append(jj.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
