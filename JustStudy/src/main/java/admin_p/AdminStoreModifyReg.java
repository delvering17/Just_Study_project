package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AdminStoreModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/branch");
        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp" +
                "\\img\\branch";

        int size = 1024 * 1024 * 10;

        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            BranchDTO branchDTO = new BranchDTO();

            if(mr.getParameterValues("roomType").length > 0){
                ArrayList<String> roomType = new ArrayList<String>();
                int roomCnt = 1;
                for(int i = 0; i < mr.getParameterValues("roomType").length; i++){
                    for(int k = 0; k < Integer.parseInt(mr.getParameterValues("roomNum")[i]); k++){
                        roomType.add("룸"+roomCnt+") "+mr.getParameterValues("roomType")[i]);
                        roomCnt++;
                    }
                }
                branchDTO.setRooms(String.join(",", roomType));
            }else{
                branchDTO.setRooms("");
            }

            System.out.println(branchDTO.toString());

            branchDTO.setPrice(Integer.parseInt(mr.getParameter("price")));
            branchDTO.setOpen(Integer.parseInt(mr.getParameter("open")));
            branchDTO.setClose(Integer.parseInt(mr.getParameter("close")));
            branchDTO.setAddress(mr.getParameter("address"));
            branchDTO.setPhone(mr.getParameter("phone"));
            branchDTO.setImg(mr.getFilesystemName("img"));
            branchDTO.setFacilities((mr.getParameterValues("facilities") != null ? String.join(",", mr.getParameterValues("facilities")) : null));


            String msg = "수정 실패";

            if(new BranchDAO().modify(mr.getParameter("cityName"), mr.getParameter("branchName"), branchDTO) > 0){
                msg = "수정 완료되었습니다.";
            };

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("goUrl", "AdminStoreDetail?branchName="+mr.getParameter("branchName"));
        } catch (IOException e) {
            e.printStackTrace();
        }



    }
}
