package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;
import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class AdminReservListSearch implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        Date startDate = null, endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(request.getParameter("admin-reserv-list-period")!=null) {
            try {
                switch (request.getParameter("admin-reserv-list-period")) {
                    case "day":
                        startDate = sdf.parse(request.getParameter("admin-reserv-list-start"));
                        endDate = sdf.parse(request.getParameter("admin-reserv-list-start"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "dayBetweenDay":
                        startDate = sdf.parse(request.getParameter("admin-reserv-list-start"));
                        endDate = sdf.parse(request.getParameter("admin-reserv-list-end"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "month":
                        startDate = sdf.parse(request.getParameter("admin-reserv-list-year") + "-" +
                                request.getParameter("admin-reserv-list-month") + "-" + 1);

                        endDate = sdf.parse(request.getParameter("admin-reserv-list-year") + "-" +
                                (Integer.parseInt(request.getParameter("admin-reserv-list-month")) + 1) + "-" + 1);

                        break;
                    case "year":
                        startDate = sdf.parse(request.getParameter("admin-reserv-list-year") + "-" +
                                1 + "-" + 1);

                        endDate = sdf.parse((Integer.parseInt(request.getParameter("admin-reserv-list-year")) + 1)
                                + "-" + 1 + "-" + 1);

                        break;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        ArrayList<AdminReservDTO> reservList = new ArrayList<AdminReservDTO>();

        if(request.getParameter("city").equals("전체")){
            for(BranchDTO branchDTO : branchList){
                reservList.addAll(new AdminReservDAO().salesStoreList(branchDTO.getCity(), branchDTO.getName(),
                        request.getParameter("admin-reserv-list-period"), startDate, endDate,
                        request.getParameter("admin-reserv-list-filter"), request.getParameter("admin-reserv-list-word").trim()));
            }
        } else if(request.getParameter("branch").equals("전체")){
            for (BranchDTO branchDTO : branchList){
                if(branchDTO.getCity().equals(request.getParameter("city"))){
                    reservList.addAll(new AdminReservDAO().salesStoreList(branchDTO.getCity(), branchDTO.getName(),
                            request.getParameter("admin-reserv-list-period"), startDate, endDate,
                            request.getParameter("admin-reserv-list-filter"), request.getParameter("admin-reserv-list-word").trim()));
                }
            }
        } else{
            reservList = new AdminReservDAO().salesStoreList(request.getParameter("city"), request.getParameter("branch"),
                    request.getParameter("admin-reserv-list-period"), startDate, endDate,
                    request.getParameter("admin-reserv-list-filter"), request.getParameter("admin-reserv-list-word").trim());
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("totalList", reservList);
        request.setAttribute("adminUrl", "adminReservList.jsp");
    }
}
