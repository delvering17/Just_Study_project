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

        // TODO - 유효성 검사 필요


        // 결과
        Date today = new Date();
        boolean hasReservation = false;
        ArrayList<ReservationDTO> arr_reservationDTO = new ReservationDAO().myReservationList(mem_id);
        for( ReservationDTO reservationDTO : arr_reservationDTO) {
            System.out.println(reservationDTO.getUseDate().getTime());
            System.out.println(today.getTime());
            if (reservationDTO.getUseDate().getTime() >= today.getTime()) {
                hasReservation = true;
                break;
            }
        }
        System.out.println(hasReservation);

        JSONObject jj = new JSONObject();
        try {
            if(hasReservation) {

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
