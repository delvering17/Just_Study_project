package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminStoreInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        BranchDTO branchDTO = new BranchDTO();

        branchDTO.setCity(request.getParameter("cityName"));
        branchDTO.setName(request.getParameter("branchName"));

        if(request.getParameterValues("roomType").length > 0){
            ArrayList<String> roomType = new ArrayList<String>();
            int roomCnt = 1;
            for(int i = 0; i < request.getParameterValues("roomType").length; i++){
                for(int k = 0; k < Integer.parseInt(request.getParameterValues("roomNum")[i]); k++){
                    roomType.add("룸"+roomCnt+") "+request.getParameterValues("roomType")[i]);
                    roomCnt++;
                }
            }
            branchDTO.setRooms(String.join(",", roomType));
        }else{
            branchDTO.setRooms("");
        }

        System.out.println(branchDTO.toString());

        branchDTO.setPrice(Integer.parseInt(request.getParameter("price")));
        branchDTO.setOpen(Integer.parseInt(request.getParameter("open")));
        branchDTO.setClose(Integer.parseInt(request.getParameter("close")));
        branchDTO.setAddress(request.getParameter("address"));
        branchDTO.setPhone(request.getParameter("phone"));
        branchDTO.setFacilities((request.getParameterValues("facilities") != null ? String.join(",", request.getParameterValues("facilities")) : null));


        String msg = "추가 실패";

        if(new BranchDAO().insert(branchDTO) > 0){
            msg = "추가 완료되었습니다.";
        };

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminStoreDetail?branchName="+request.getParameter("branchName"));
    }
}