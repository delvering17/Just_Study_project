package community_p;

import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommunityModifyReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        CommunityDTO communityDTO = new CommunityDTO();
        communityDTO.setId(Integer.parseInt(request.getParameter("id")));
        communityDTO.setMemId(Integer.parseInt(request.getParameter("memId")));
        communityDTO.setLocation(request.getParameter("location"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            communityDTO.setStartdate(sdf.parse(request.getParameter("startdate")));
            communityDTO.setEnddate(sdf.parse(request.getParameter("enddate")));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        communityDTO.setTitle(request.getParameter("title"));
        communityDTO.setPeople(Integer.parseInt(request.getParameter("people")));
        communityDTO.setStudykind(String.join(",", request.getParameterValues("studykind")));
        communityDTO.setContent(request.getParameter("content"));

        System.out.println(communityDTO.toString());

    }
}
