package community_p;

import model_p.CommunityDAO;
import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityDeleteReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String password = new MemberDAO().detail(Integer.parseInt(request.getParameter("id"))).getMem_password();

        String msg = "삭제 실패";
        String goUrl = "CommunityDetail?id="+request.getParameter("id");

        if(password.equals(request.getParameter("pw"))){
            if(new CommunityDAO().delete(Integer.parseInt(request.getParameter("id"))) > 0){
                msg = "삭제되었습니다.";
                goUrl = "CommunityPage";
            }
        }

        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
    }
}
