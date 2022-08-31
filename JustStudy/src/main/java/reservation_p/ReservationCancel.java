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

        IamportCancel iamportCancel = new IamportCancel();


        if(sameOrderList.size() == 1){
            iamportCancel.testCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId());
        } else{
            iamportCancel.testPartialCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId(), reservationDTO.getPay());
        }

        String msg = iamportCancel.getPayment_response().getMessage();

        if(iamportCancel.getPayment_response().getMessage() == null){
            msg = "취소하였습니다.";
            new ReservationDAO().reservationCancelByUser(reservationDTO.getId());
        }

        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", "mypage/mypage_alert.jsp");
        request.setAttribute("goUrl", "../mypage/MyReservationList?type=will&period=all");
    }
}
