package admin_p;

import model_p.ReviewDAO;
import model_p.ReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminStoreReview implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<ArrayList> totalList = new ReviewDAO().totalList(
                request.getParameter("filter"),
                request.getParameter("word").trim()
        );

        request.setAttribute("totalList", totalList);
        request.setAttribute("adminUrl", "adminReviewList.jsp");
    }
}
