package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityDetail implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);

        CommunityDAO dao = new CommunityDAO();

        CommunityDTO dto = dao.detail(id);

        request.setAttribute("mainUrl","community/detail.jsp");
        request.setAttribute("dto", dto);
    }
}
