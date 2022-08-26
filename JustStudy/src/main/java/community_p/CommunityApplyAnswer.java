package community_p;

import model_p.CommunityDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyAnswer implements CommunityService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int answer = 0;
        int studygroup_id = Integer.parseInt(request.getParameter("studyId"));
        if(request.getParameter("answer").equals("승인")){
           answer = new CommunityDAO().applyAnswer(Integer.parseInt(request.getParameter("as_id")), 2);

           // 승인을 누르면 , 해당 스터디 1. 종료일 지났는지, 2. 인원수가 찼는지 TRUE ->  as_state = 3
            // applystudy , -> 스터디 고유번호(as_purpose) , 현재 상태(as_state)
            // studygroup , -> 인원수(people), 종료일(enddate)
            new CommunityDAO().checkState(studygroup_id);

        } else if(request.getParameter("answer").equals("반려")){
            answer = new CommunityDAO().applyAnswer(Integer.parseInt(request.getParameter("as_id")), 3);
        }

        String msg = "처리 실패";
        String mainUrl = "community/community_detail.jsp";

        if(answer > 0){
            msg = request.getParameter("answer")+"하였습니다.";
            mainUrl = "community/alert.jsp";
            request.setAttribute("goUrl", "CommunityDetail?id="+request.getParameter("studyId"));
        }

        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl", mainUrl);
    }
}
