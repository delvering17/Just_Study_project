package community_p;

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


        request.setAttribute("mainData",mainData);
        request.setAttribute("mainUrl", "community/studygroup.jsp");
    }
}
