package community_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class CommunityDetail implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int studyId = Integer.parseInt(request.getParameter("id"));

        //스터디 정보
        CommunityDTO communityDTO = new CommunityDAO().detail(studyId);

        //스터디 개설한사람 정보에서 닉네임 빼내기
        MemberDTO memberDTO = new MemberDAO().detail(communityDTO.getMemId());
        communityDTO.setNickname(memberDTO.getMem_nickname());

        //스터디에 지원한거 목록
        ArrayList<ApplyStudyDTO> applyList = new ApplyStudyDAO().applyListPurpose(studyId);

        //스터디에 지원한 사람들 정보 목록
        ArrayList<MemberDTO> applyMemList = new ArrayList<MemberDTO>();
        for (ApplyStudyDTO applyStudyDTO : applyList) {
            applyMemList.add(new MemberDAO().detail(applyStudyDTO.getAs_mem_id()));
        }

        request.setAttribute("mainUrl","community/community_detail.jsp");
        request.setAttribute("communityDTO", communityDTO);
        request.setAttribute("applyList", applyList);
        request.setAttribute("applyMemList", applyMemList);
    }
}
