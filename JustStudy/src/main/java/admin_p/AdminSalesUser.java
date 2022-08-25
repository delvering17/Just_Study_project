package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;
import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;

public class AdminSalesUser implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> salesUserList = new AdminReservDAO().userSalesList();
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
