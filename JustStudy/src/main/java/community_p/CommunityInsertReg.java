package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class CommunityInsertReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");

        try {
        CommunityDTO communityDTO = new CommunityDTO();
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
        communityDTO.setStudykind(String.join(", ", request.getParameterValues("studykind")));
        communityDTO.setContent(request.getParameter("content"));
        communityDTO.setOpenChatting(request.getParameter("openChatting"));

        new CommunityDAO().insert(communityDTO);

        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", "입력되었습니다.");
        request.setAttribute("goUrl", "CommunityDetail?id="+communityDTO.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
