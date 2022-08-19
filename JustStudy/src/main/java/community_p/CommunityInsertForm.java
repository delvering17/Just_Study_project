package community_p;

import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class CommunityInsertForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("branchList", branchList);
        request.setAttribute("mainUrl", "community/community_insertForm.jsp");
    }
}
