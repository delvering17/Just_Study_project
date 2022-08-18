package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityDetail implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);

        CommunityDAO communityDAO = new CommunityDAO();
        CommunityDTO communityDTO = communityDAO.detail(id);

        System.out.println(communityDTO);
        MemberDTO memberDTO = new MemberDAO().detail(communityDTO.getMemId());
        System.out.println(memberDTO);

        communityDTO.setNickname(memberDTO.getMem_nickname());

        System.out.println(communityDTO);

        request.setAttribute("mainUrl","community/community_detail.jsp");
        request.setAttribute("communityDTO", communityDTO);
    }
}
