package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdminInquiryListSearch implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();

        Date startDate = null, endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(request.getParameter("admin-inquiry-list-period")!=null) {
            try {
                switch (request.getParameter("admin-inquiry-list-period")) {
                    case "day":
                        startDate = sdf.parse(request.getParameter("admin-inquiry-list-start"));
                        endDate = sdf.parse(request.getParameter("admin-inquiry-list-start"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "dayBetweenDay":
                        startDate = sdf.parse(request.getParameter("admin-inquiry-list-start"));
                        endDate = sdf.parse(request.getParameter("admin-inquiry-list-end"));
                        endDate.setDate(endDate.getDate()+1);
                        break;
                    case "month":
                        startDate = sdf.parse(request.getParameter("admin-inquiry-list-year") + "-" +
                                request.getParameter("admin-inquiry-list-month") + "-" + 1);

                        endDate = sdf.parse(request.getParameter("admin-inquiry-list-year") + "-" +
                                (Integer.parseInt(request.getParameter("admin-inquiry-list-month")) + 1) + "-" + 1);

                        break;
                    case "year":
                        startDate = sdf.parse(request.getParameter("admin-inquiry-list-year") + "-" +
                                1 + "-" + 1);

                        endDate = sdf.parse((Integer.parseInt(request.getParameter("admin-inquiry-list-year")) + 1)
                                + "-" + 1 + "-" + 1);

                        break;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        ArrayList<InquiryDTO> inquiryList = new ArrayList<InquiryDTO>();

        if(request.getParameter("city").equals("전체")){
            for(BranchDTO branchDTO : branchList){
                inquiryList.addAll(new InquiryDAO().adminInquiryListSearch(branchDTO.getCity(), branchDTO.getName(),
                        request.getParameter("admin-inquiry-list-period"), startDate, endDate,
                        request.getParameter("admin-inquiry-list-filter"), request.getParameter("admin-inquiry-list-word").trim(), request.getParameter("admin-inquiry-state-search")));
            }
        } else if(request.getParameter("branch").equals("전체")){
            for (BranchDTO branchDTO : branchList){
                if(branchDTO.getCity().equals(request.getParameter("city"))){
                    inquiryList.addAll(new InquiryDAO().adminInquiryListSearch(branchDTO.getCity(), branchDTO.getName(),
                            request.getParameter("admin-inquiry-list-period"), startDate, endDate,
                            request.getParameter("admin-inquiry-list-filter"), request.getParameter("admin-inquiry-list-word").trim(), request.getParameter("admin-inquiry-state-search")));
                }
            }
        } else{
            inquiryList = new InquiryDAO().adminInquiryListSearch(request.getParameter("city"), request.getParameter("branch"),
                    request.getParameter("admin-inquiry-list-period"), startDate, endDate,
                    request.getParameter("admin-inquiry-list-filter"), request.getParameter("admin-inquiry-list-word").trim(), request.getParameter("admin-inquiry-state-search"));
        }

        request.setAttribute("branchList", branchList);
        request.setAttribute("arr_inquiryDTO", inquiryList);
        request.setAttribute("adminUrl", "adminInquiryList.jsp");
    }
}
