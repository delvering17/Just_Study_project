package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminReservList implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> totalList = new AdminReservDAO().totalList();

        request.setAttribute("totalList", totalList);
        request.setAttribute("adminUrl", "adminReservList.jsp");
    }
}
