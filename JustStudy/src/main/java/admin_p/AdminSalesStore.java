package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesStore implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<ReservationDTO> salesStoreList = new ReservationDAO().storeSalesList();
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        int storeTotalPay = 0;
        for (ReservationDTO dto : salesStoreList) {
            storeTotalPay += dto.getPay();
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("salesStoreList", salesStoreList);
        request.setAttribute("storeTotalPay", storeTotalPay);
        request.setAttribute("adminUrl", "adminSalesStore.jsp");
    }
}
