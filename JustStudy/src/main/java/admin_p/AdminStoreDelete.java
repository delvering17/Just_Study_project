package admin_p;

import model_p.BranchDAO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;

public class AdminStoreDelete implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String branchName = request.getParameter("branchName");

        boolean reservationWill = new ReservationDAO().reservationWill(branchName);
        System.out.println(reservationWill);
        for(ReservationDTO reservationDTO : new ReservationDAO().reservationToday(branchName)){
            String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
            int nowTime = new Date().getHours();
            if(nowTime <= Integer.parseInt(lastTime)){
                reservationWill = true;
            }
        }
        System.out.println(reservationWill);

        String msg = "";

        if(!reservationWill){
            msg = "삭제 실패하였습니다.";
            if(new BranchDAO().delete(branchName) > 0){
                msg = "삭제되었습니다.";
            }
        } else{
            msg = "예약 내역이 있는 지점입니다. 삭제 불가능합니다.";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminStoreList");
    }
}
