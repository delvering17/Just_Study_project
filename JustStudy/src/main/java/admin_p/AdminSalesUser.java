package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesUser implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> salesUserList = new AdminReservDAO().userSalesList();

        int userTotalPay = 0;
        for (int i = 0; i < salesUserList.size(); i++) {
            userTotalPay += salesUserList.get(i).getPay();
        }

        request.setAttribute("salesUserList", salesUserList);
        request.setAttribute("userTotalPay", userTotalPay);
        request.setAttribute("adminUrl", "adminSalesUser.jsp");
    }
}
