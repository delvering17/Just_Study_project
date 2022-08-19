package mypage_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;

public class MypageStudygroup implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ArrayList<CommunityDTO> studygroupList = new ArrayList<CommunityDTO>();
        if(request.getParameter("type").equals("maked")){

            studygroupList = new CommunityDAO().makedList(memberDTO.getMem_id());

        } else if(request.getParameter("type").equals("apply")){

            for(ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().myApplyList(memberDTO.getMem_id())){
                studygroupList.add(new CommunityDAO().detail(applyStudyDTO.getAs_purpose()));
            }
        }

        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_studygroup.jsp");
        request.setAttribute("studygroupList", studygroupList);
    }
}
