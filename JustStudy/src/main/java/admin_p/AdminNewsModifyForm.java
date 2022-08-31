package admin_p;



import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNewsModifyForm implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        NewsDAO dao = new NewsDAO();
        NewsDTO dto = dao.detail(id);


        request.setAttribute("adminUrl", "adminNewsModifyForm.jsp");
        request.setAttribute("dto", dto);
    }
}
