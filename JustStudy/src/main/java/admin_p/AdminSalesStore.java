package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesStore implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        request.setAttribute("branchList", branchList);
        request.setAttribute("adminUrl", "adminSalesStore.jsp");
    }
}
