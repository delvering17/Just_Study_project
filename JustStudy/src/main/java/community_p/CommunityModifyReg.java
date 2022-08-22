package community_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
        communityDTO.setNickname(new MemberDAO().detail(communityDTO.getMemId()).getMem_nickname());
        communityDTO.setOpenChatting(request.getParameter("openChatting"));

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        String msg = "수정 실패";
        String mainUrl = "community/community_modifyForm.jsp";

        if(new CommunityDAO().modify(communityDTO) > 0){
            msg = "수정되었습니다.";
            mainUrl = "community/alert.jsp";
            request.setAttribute("goUrl", "CommunityDetail?id="+communityDTO.getId());
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", mainUrl);
        request.setAttribute("communityDTO", communityDTO);

    }
}
