package community_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;

public class CommunityPage implements CommunityService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        ArrayList<CommunityDTO> totalList = new CommunityDAO().list();
        ArrayList<CommunityDTO> openList = new ArrayList<CommunityDTO>();
        ArrayList<CommunityDTO> closeList = new ArrayList<CommunityDTO>();
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        ArrayList<Integer> arr_nowPeople = new ArrayList<>();

        for(CommunityDTO communityDTO : totalList){
            int cnt = 0;
            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                if(applyStudyDTO.getAs_state() == 2){
                    cnt ++;
                }
            }
            arr_nowPeople.add(cnt);
            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                communityDTO.setStatus("모집마감");
                closeList.add(communityDTO);
            } else{
                communityDTO.setStatus("모집중");
                openList.add(communityDTO);
            }
        }

        if(request.getParameter("category").equals("all")){
            request.setAttribute("mainData",totalList);
        } else if(request.getParameter("category").equals("open")){
            request.setAttribute("mainData", openList);
        } else if(request.getParameter("category").equals("close")){
            request.setAttribute("mainData", closeList);
        }

        request.setAttribute("branchList",branchList);
        request.setAttribute("arr_nowPeople",arr_nowPeople);

        request.setAttribute("mainUrl", "community/studygroup.jsp");
    }
}
