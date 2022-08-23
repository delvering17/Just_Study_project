package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;
import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminReservList implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> totalList = new AdminReservDAO().totalList();
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        request.setAttribute("totalList", totalList);
        request.setAttribute("branchList", branchList);
        request.setAttribute("adminUrl", "adminReservList.jsp");
    }
}
