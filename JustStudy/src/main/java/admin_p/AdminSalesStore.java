package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdminSalesStore implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> salesStoreList = new ArrayList<AdminReservDTO>();
        ArrayList<AdminReservDTO> totalList = new AdminReservDAO().salesStoreList(request.getParameter("city"), request.getParameter("branch"));
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(request.getParameter("admin-sales-store-period") == null){
            salesStoreList = totalList;
        }else{
            try {
                switch (request.getParameter("admin-sales-store-period")) {
                    case "day":
                        for (AdminReservDTO adminReservDTO : totalList) {
                            if ((adminReservDTO.getUseDate()).equals(sdf.parse(request.getParameter("admin-sales-store-start")))) {
                                salesStoreList.add(adminReservDTO);
                            }
                        }
                        break;
                    case "dayBetweenDay":
                        Date startDate = sdf.parse(request.getParameter("admin-sales-store-start"));
                        Date endDate = sdf.parse(request.getParameter("admin-sales-store-end"));

                        for (AdminReservDTO adminReservDTO : totalList) {
                            if((adminReservDTO.getUseDate().after(startDate) || adminReservDTO.getUseDate().equals(startDate))
                                    && (adminReservDTO.getUseDate().before(endDate) || adminReservDTO.getUseDate().equals(endDate))){
                                salesStoreList.add(adminReservDTO);
                            }
                        }
                        break;
                    case "month":
                        break;
                    case "year":
                        break;
                }
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

        }


        int storeTotalPay = 0;
        for (AdminReservDTO dto : salesStoreList) {
            storeTotalPay += dto.getPay();
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("salesStoreList", salesStoreList);
        request.setAttribute("storeTotalPay", storeTotalPay);
        request.setAttribute("adminUrl", "adminSalesStore.jsp");
    }
}
