package admin_p;

import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNewsDetail implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        int id = Integer.parseInt(request.getParameter("id"));


        NewsDAO dao = new NewsDAO();
        NewsDTO dto = dao.detail(id);

        request.setAttribute("adminUrl","adminNewsDetail.jsp");
        request.setAttribute("dto",dto);

    }
}
