package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminStoreModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        BranchDTO branchDTO = new BranchDTO();

        ArrayList<String> roomType = new ArrayList<String>();

        int roomCnt = 0;
        for(String roomNum : request.getParameterValues("roomNum")){
            for(int i = 0; i < Integer.parseInt(roomNum); i ++){

            }
        }

        branchDTO.setRooms(String.join(",", roomType));
        branchDTO.setPrice(Integer.parseInt(request.getParameter("price")));
        branchDTO.setOpen(Integer.parseInt(request.getParameter("open")));
        branchDTO.setClose(Integer.parseInt(request.getParameter("close")));
        branchDTO.setAddress(request.getParameter("address"));
        branchDTO.setPhone(request.getParameter("phone"));
        branchDTO.setFacilities((request.getParameterValues("facilitiesO") != null ? String.join(",", request.getParameterValues("facilitiesO")) : null));

        System.out.println(branchDTO.toString());

        String msg = "수정 실패";

        if(new BranchDAO().modify(request.getParameter("cityName"), request.getParameter("branchName"), branchDTO) > 0){
            msg = "수정 완료되었습니다.";
        };

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminStoreDetail?branchName="+request.getParameter("branchName"));
    }
}
