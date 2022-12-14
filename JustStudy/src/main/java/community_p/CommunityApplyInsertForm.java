package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommunityApplyInsertForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        int mem_id = (int) session.getAttribute("login");
        MemberDTO memberDTO = new MemberDAO().detail(mem_id);

        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));

        try {


            request.setAttribute("mem_id", mem_id);
            request.setAttribute("input_purpose", input_purpose);
            request.setAttribute("memberDTO",memberDTO);
            request.setAttribute("mainUrl", "community/community_applyinsertForm.jsp");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
