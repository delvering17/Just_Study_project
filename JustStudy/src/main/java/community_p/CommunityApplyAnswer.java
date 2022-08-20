package community_p;

import model_p.CommunityDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyAnswer implements CommunityService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int answer = 0;

        if(request.getParameter("answer").equals("승인")){
           answer = new CommunityDAO().applyAnswer(Integer.parseInt(request.getParameter("as_id")), 2);
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
