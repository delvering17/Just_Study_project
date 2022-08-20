package community_p;

import model_p.ApplyStudyDAO;
import model_p.ApplyStudyDTO;
import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class CommunityPage implements CommunityService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<CommunityDTO> mainData = new CommunityDAO().list();
        System.out.println("Communitypage 들어왔따 : "+mainData);

        for(CommunityDTO communityDTO : mainData){
            int cnt = 0;
            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                if(applyStudyDTO.getAs_state() == 2){
                    cnt ++;
                }
            }

            if(cnt == communityDTO.getPeople()){
                communityDTO.setStatus("마감");
            }
        }

        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "community/studygroup.jsp");
    }
}
