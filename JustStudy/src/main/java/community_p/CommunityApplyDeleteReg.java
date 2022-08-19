package community_p;

import model_p.CommunityDAO;
import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyDeleteReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String password = new MemberDAO().detail(Integer.parseInt(request.getParameter("as_mem_id"))).getMem_password();
        System.out.println("pw1"+password);
        String msg = "삭제 실패";
        String goUrl = "CommunityApplyDetail?as_id="+request.getParameter("as_mem_id");
        System.out.println("pw2"+request.getParameter("password"));

        if(password.equals(request.getParameter("password"))){
            if(new CommunityDAO().delete(Integer.parseInt(request.getParameter("as_mem_id"))) > 0){
                msg = "삭제되었습니다.";
                goUrl = "board/MainPage";
                // TODO - 내역으로 가게 만들어야함
            }
        }

        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl", goUrl);
    }
}
