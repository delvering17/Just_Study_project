package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class AdminSalesStoreSearch implements AdminService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date start_date = null;
        Date end_date = null;
        /*Date useDate = null;*/

        String city = request.getParameter("city");
        String branch = request.getParameter("branch");
        String startDate = request.getParameter("admin-sales-store-start");
        String endDate = request.getParameter("admin-sales-store-end");
        String month = request.getParameter("admin-sales-store-month");
        String year = request.getParameter("admin-sales-store-year");
        String useDate = request.getParameter("admin-sales-store-start");

        try {
            start_date = sdf.parse(startDate);
            end_date = sdf.parse(endDate);

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        Calendar c_start_date = Calendar.getInstance();
        Calendar c_end_date = Calendar.getInstance();

        c_start_date.setTime(start_date);
        c_end_date.setTime(end_date);

        while(c_start_date.compareTo(c_end_date) !=1 ){
            System.out.println(c_start_date.getTime());
            c_start_date.add(Calendar.DATE, 1);
        }


        ArrayList<ReservationDTO> salesStorefilter = new ReservationDAO().salesStorefilter(city, branch, useDate);
        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        int storeTotalPay = 0;
        for (ReservationDTO dto : salesStorefilter) {
            storeTotalPay += dto.getPay();
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("salesStoreList", salesStorefilter);
        request.setAttribute("storeTotalPay", storeTotalPay);
        request.setAttribute("adminUrl", "adminSalesStore.jsp");
    }
}
