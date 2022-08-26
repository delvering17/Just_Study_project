package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.ReservationDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class AdminStoreList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<BranchDTO> branchList = new ArrayList<BranchDTO>();
        LinkedHashMap<String, Integer> branchMap = new LinkedHashMap<String, Integer>();
        for (String city : "서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주".split(",")) {
            branchMap.put(city, 0);
        }

        if(request.getParameter("filter")==null){
            branchList = new BranchDAO().branchList();
        }else{
            branchList = new BranchDAO().branchSearchList(request.getParameter("filter"), request.getParameter("word").trim());
        }

        for (BranchDTO dto : branchList) {
            if (branchMap.containsKey(dto.getCity())) {
                branchMap.put(dto.getCity(), branchMap.get(dto.getCity()) + 1);
            }
        }
        request.setAttribute("branchList", branchList);
        request.setAttribute("branchMap", branchMap);
        request.setAttribute("adminUrl","adminStoreList.jsp");
    }
}
