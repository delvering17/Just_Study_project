package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesUserSearch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String userType = request.getParameter("salesUser-search");
        String userValue = request.getParameter("searchSalesUser-input");
        String city = request.getParameter("city");
        String branch = request.getParameter("branch");

        ArrayList<AdminReservDTO> salesUserList;

        if(city.equals("전체") && branch.equals("전체")){
            salesUserList = new AdminReservDAO().salesUserSearch(userType, userValue);
        }else{
            salesUserList = new AdminReservDAO().salesUserDetailSearch(userType, userValue, city, branch);
        }

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        int userTotalPay = 0;
        for (AdminReservDTO dto : salesUserList) {
            userTotalPay += dto.getPay();
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("salesUserList", salesUserList);
        request.setAttribute("userTotalPay", userTotalPay);
        request.setAttribute("adminUrl", "adminSalesUser.jsp");
    }
}
