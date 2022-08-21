package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesUserSearch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String userType = request.getParameter("salesUser-search");
        String userValue = request.getParameter("searchSalesUser-input");

        ArrayList<AdminReservDTO> salesUserList = new AdminReservDAO().salesUserSearch(userType, userValue);

        int userTotalPay = 0;
        for (AdminReservDTO dto : salesUserList) {
            userTotalPay += dto.getPay();
        }

        request.setAttribute("salesUserList", salesUserList);
        request.setAttribute("userTotalPay", userTotalPay);
        request.setAttribute("adminUrl", "adminSalesUser.jsp");
    }
}
