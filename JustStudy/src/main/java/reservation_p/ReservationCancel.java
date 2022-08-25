package reservation_p;

import model_p.ReservationDAO;
import model_p.ReservationDTO;
import reservation_p.iamport.IamportCancel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ReservationCancel implements ReservationService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ReservationDTO reservationDTO = new ReservationDAO().reservationDetail(Integer.parseInt(request.getParameter("reservId")));

        ArrayList<Integer> sameOrderList = new ReservationDAO().sameOrderList(reservationDTO.getOrderId());

        if(sameOrderList.size() == 1){
            new IamportCancel().testCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId());
        } else{
            new IamportCancel().testPartialCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId(), reservationDTO.getPay());
        }

        new ReservationDAO().reservationCancel(reservationDTO.getId());

        request.setAttribute("msg", "취소하였습니다.");
        request.setAttribute("mainUrl", "mypage/mypage_alert.jsp");
        request.setAttribute("goUrl", "../mypage/MyReservationList?type=will&period=all");
    }
}
