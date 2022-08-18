package admin_p;

import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesStore implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<ReservationDTO> salesList = new ReservationDAO().storeSalesList();
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        int total = 0;
        for (int i = 0; i < salesList.size(); i++) {
            total += salesList.get(i).getPay();
        }
        System.out.println(total);

        request.setAttribute("branchList", branchList);
        request.setAttribute("salesList", salesList);
        request.setAttribute("total", total);
        request.setAttribute("adminUrl", "adminSalesStore.jsp");
    }
}
