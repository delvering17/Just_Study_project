package admin_p;

import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminNewsList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<NewsDTO> mainData = new NewsDAO().list();

        request.setAttribute("mainData",mainData);
        request.setAttribute("adminUrl", "adminNewsList.jsp");
    }
}
