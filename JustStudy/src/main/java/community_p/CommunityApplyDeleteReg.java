package community_p;

import model_p.CommunityDAO;
import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyDeleteReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "삭제 실패";
        String goUrl = "CommunityApplyDetail?as_id="+request.getParameter("as_id");

        if(new CommunityDAO().applyDelete(Integer.parseInt(request.getParameter("as_id"))) > 0){
            msg = "삭제되었습니다.";
            goUrl = "../mypage/MypageStudygroup?type=apply&date_period=day7";

        }


        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
    }
}
