package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

public class AdminStoreDelete implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/branch");
        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\branch";

        int size = 1024 * 1024 * 10;

        try {
            MultipartRequest mr = new MultipartRequest(
                    request,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy());
        } catch (IOException e) {
            e.printStackTrace();
        }

        String branchName = request.getParameter("branchName");
        BranchDTO branchDTO = new BranchDAO().detail(branchName);

        boolean reservationWill = new ReservationDAO().reservationWill(branchName);
        for(ReservationDTO reservationDTO : new ReservationDAO().reservationToday(branchName)){
            String lastTime = reservationDTO.getTime().split(", ")[reservationDTO.getTime().split(", ").length-1].split(":")[0];
            int nowTime = new Date().getHours();
            if(nowTime <= Integer.parseInt(lastTime)){
                reservationWill = true;
            }
        }

        String msg = "";

        if(!reservationWill){
            msg = "삭제 실패하였습니다.";
            if(new BranchDAO().delete(branchName) > 0){
                new File(path + "\\" + branchDTO.getImg()).delete();
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
