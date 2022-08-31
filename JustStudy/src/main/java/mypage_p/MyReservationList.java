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
                    case "all":
                        endDate = null;
                        break;
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
                        startDate.setDate(startDate.getDate() - 1);
                        endDate = sdf.parse(request.getParameter("endDate"));
                        endDate.setDate(endDate.getDate() + 1);
                        break;
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        if(request.getParameter("type").equals("will")){
            if(request.getParameter("period").equals("mypick")){
                myReservation = new ReservationDAO().myReservationListWill(memberDTO.getMem_id(), null);
            } else{
                myReservation =  new ReservationDAO().myReservationListWill(memberDTO.getMem_id(), endDate);
            }
            for(ReservationDTO reservationDTO : myReservationToday){
                String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
                int nowTime = new Date().getHours();
                if(nowTime <= Integer.parseInt(lastTime)){
                    myReservation.add(0, reservationDTO);
                }
            }
        } else if(request.getParameter("type").equals("done")){
            if(request.getParameter("period").equals("mypick")){
                myReservation = new ReservationDAO().myReservationListDone(memberDTO.getMem_id(), null);
            } else{
                myReservation =  new ReservationDAO().myReservationListDone(memberDTO.getMem_id(), endDate);
            }
            for(ReservationDTO reservationDTO : myReservationToday){
                String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
                int nowTime = new Date().getHours();
                if(nowTime > Integer.parseInt(lastTime)){
                    myReservation.add(0, reservationDTO);
                }
            }
        }
        ArrayList<ReservationDTO> myPickList = new ArrayList<>();

        if(request.getParameter("period").equals("mypick")){
            myPickList = new ArrayList<ReservationDTO>();
            for(ReservationDTO reservationDTO : myReservation){
                if(reservationDTO.getUseDate().after(startDate) && reservationDTO.getUseDate().before(endDate)){
                    myPickList.add(reservationDTO);
                }
            }
        }



        if(request.getParameter("period")!=null && request.getParameter("period").equals("mypick")){
            request.setAttribute("myReservation", myPickList);
        } else{
            request.setAttribute("myReservation", myReservation);
        }
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","reservation_list.jsp");
    }
}
