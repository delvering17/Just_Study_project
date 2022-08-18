package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityModifyForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id")); // db 에 있는 id가 몇번인지 뜬다
        System.out.println(id);

        CommunityDAO dao = new CommunityDAO();
        CommunityDTO dto = dao.detail(id);


        request.setAttribute("mainUrl", "community/community_modifyForm.jsp");
        request.setAttribute("dto", dto);
    }
}
