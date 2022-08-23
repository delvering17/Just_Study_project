package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class MyReservationList implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ArrayList<ReservationDTO> myReservation = new ArrayList<ReservationDTO>();
        ArrayList<ReservationDTO> myReservationToday = new ReservationDAO().myReservationListToday(memberDTO.getMem_id());

        Date startDate = null;
        Date endDate = null;

        if(request.getParameter("period") != null){
            try{
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String today = sdf.format(new Date());
                startDate = sdf.parse(today);
                endDate = sdf.parse(today);

                int plusMinus = 0;
                if(request.getParameter("type").equals("will")){
                    plusMinus = 1;
                } else{
                    plusMinus = -1;
                }
                switch (request.getParameter("period")){
                    case "today":
                        endDate.setDate(endDate.getDate() + 1 * plusMinus);
                        break;
                    case "sevenDays":
                        endDate.setDate(endDate.getDate() + 7 * plusMinus);
                        break;
                    case "oneMonth":
                        endDate.setMonth(endDate.getMonth() + 1 * plusMinus);
                        break;
                    case "threeMonths":
                        endDate.setMonth(endDate.getMonth() + 3 * plusMinus);
                        break;
                    case "mypick":
                        startDate = sdf.parse(request.getParameter("startDate"));
                        endDate = sdf.parse(request.getParameter("endDate"));
                        break;
                }

                System.out.println(startDate);
                System.out.println(endDate);

            }catch (Exception e){
                e.printStackTrace();
            }
        }

        if(request.getParameter("type").equals("will")){
            myReservation =  new ReservationDAO().myReservationListWill(memberDTO.getMem_id(), endDate);
            for(ReservationDTO reservationDTO : myReservationToday){
                String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
                int nowTime = new Date().getHours();
                if(nowTime <= Integer.parseInt(lastTime)){
                    myReservation.add(reservationDTO);
                }
            }
        } else if(request.getParameter("type").equals("done")){
            myReservation = new ReservationDAO().myReservationListDone(memberDTO.getMem_id(), endDate);
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
