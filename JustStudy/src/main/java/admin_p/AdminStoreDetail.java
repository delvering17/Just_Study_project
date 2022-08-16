package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminStoreDetail implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        BranchDTO branchDTO = new BranchDAO().detail(request.getParameter("branchName"));

        request.setAttribute("branchDTO", branchDTO);
        request.setAttribute("adminUrl", "adminStoreDetail.jsp");
    }
}
