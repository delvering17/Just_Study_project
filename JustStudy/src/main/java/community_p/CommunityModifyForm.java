package community_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class CommunityModifyForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id")); // db 에 있는 id가 몇번인지 뜬다


        CommunityDAO communityDAO = new CommunityDAO();
        CommunityDTO communityDTO = communityDAO.detail(id);

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        communityDTO.setNickname(memberDTO.getMem_nickname());

        request.setAttribute("branchList", branchList);
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl", "community/community_modifyForm.jsp");
        request.setAttribute("communityDTO", communityDTO);
    }
}
