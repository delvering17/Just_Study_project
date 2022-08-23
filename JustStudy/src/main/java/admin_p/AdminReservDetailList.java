package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminReservDetailList implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String city = request.getParameter("city");
        String branch = request.getParameter("branch");
        ArrayList<AdminReservDTO> totalList = new AdminReservDAO().viewStoreDetails(city, branch);

        request.setAttribute("totalList", totalList);
        request.setAttribute("adminUrl", "adminReservList.jsp");
    }
}
