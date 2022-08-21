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

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        Date startDate = null, endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(request.getParameter("admin-sales-store-period")!=null) {
            try {
                switch (request.getParameter("admin-sales-store-period")) {
                    case "day":
                        startDate = sdf.parse(request.getParameter("admin-sales-store-start"));
                        endDate = sdf.parse(request.getParameter("admin-sales-store-start"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "dayBetweenDay":
                        startDate = sdf.parse(request.getParameter("admin-sales-store-start"));
                        endDate = sdf.parse(request.getParameter("admin-sales-store-end"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "month":
                        startDate = sdf.parse(request.getParameter("admin-sales-store-year") + "-" +
                                request.getParameter("admin-sales-store-month") + "-" + 1);

                        endDate = sdf.parse(request.getParameter("admin-sales-store-year") + "-" +
                                (Integer.parseInt(request.getParameter("admin-sales-store-month")) + 1) + "-" + 1);

                        break;
                    case "year":
                        startDate = sdf.parse(request.getParameter("admin-sales-store-year") + "-" +
                                1 + "-" + 1);

                        endDate = sdf.parse((Integer.parseInt(request.getParameter("admin-sales-store-year")) + 1)
                                + "-" + 1 + "-" + 1);

                        break;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        ArrayList<AdminReservDTO> salesStoreList = new ArrayList<AdminReservDTO>();

        if(request.getParameter("city").equals("전체")){
            for(BranchDTO branchDTO : branchList){
                salesStoreList.addAll(new AdminReservDAO().salesStoreList(branchDTO.getCity(), branchDTO.getName(),
                        request.getParameter("admin-sales-store-period"), startDate, endDate,
                        request.getParameter("admin-sales-store-filter"), request.getParameter("admin-sales-store-word")));
            }
        } else if(request.getParameter("branch").equals("전체")){
            for (BranchDTO branchDTO : branchList){
                if(branchDTO.getCity().equals(request.getParameter("city"))){
                    salesStoreList.addAll(new AdminReservDAO().salesStoreList(branchDTO.getCity(), branchDTO.getName(),
                            request.getParameter("admin-sales-store-period"), startDate, endDate,
                            request.getParameter("admin-sales-store-filter"), request.getParameter("admin-sales-store-word")));
                }
            }
        } else{
            salesStoreList = new AdminReservDAO().salesStoreList(request.getParameter("city"), request.getParameter("branch"),
                    request.getParameter("admin-sales-store-period"), startDate, endDate,
                    request.getParameter("admin-sales-store-filter"), request.getParameter("admin-sales-store-word"));
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
