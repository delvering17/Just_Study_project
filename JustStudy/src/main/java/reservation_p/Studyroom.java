package reservation_p;

import model_p.BranchDTO;
import model_p.DAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public class Studyroom implements ReservationService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<BranchDTO> branch = new DAO().branchList();

        HashMap<String, Integer> branchMap = new HashMap<String, Integer>();
        for (String city : "서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주".split(",")) {
            branchMap.put(city, 0);
        }

        for (BranchDTO dto : branch) {
            if (branchMap.containsKey(dto.getCity())) {
                branchMap.put(dto.getCity(), branchMap.get(dto.getCity()) + 1);
            }
        }
        request.setAttribute("branchList", branch);
        request.setAttribute("branchMap", branchMap);
        request.setAttribute("mainUrl", "reservation/studyroom.jsp");
    }
}