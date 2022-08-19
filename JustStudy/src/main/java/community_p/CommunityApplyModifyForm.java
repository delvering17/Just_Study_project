package community_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class CommunityApplyModifyForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int as_id = Integer.parseInt(request.getParameter("as_id"));

        ApplyStudyDTO applyStudyDTO = new ApplyStudyDAO().detail(as_id);
        MemberDTO memberDTO = new MemberDAO().detail(applyStudyDTO.getAs_mem_id());
        String nickname = memberDTO.getMem_nickname();


        request.setAttribute("nickname",nickname);

        request.setAttribute("applyStudyDTO", applyStudyDTO);
        request.setAttribute("mainUrl", "community/community_applyModifyForm.jsp");
    }
}
