package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;


public class AdminSalesUserSearch implements AdminService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String userType = request.getParameter("salesUser-search");
        String userValue = request.getParameter("searchSalesUser-input");
        String city = request.getParameter("city");
        String branch = request.getParameter("branch");
        String startDate = request.getParameter("useDate-start");
        String endDate = request.getParameter("useDate-and");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date user_startDate = new Date();
        Date user_endDate = new Date();

        java.sql.Date sqlUseStartDate = null;
        java.sql.Date sqlUseEndDate = null;

        if (!startDate.equals("") && !endDate.equals("")) {
            try {
                user_startDate = sdf.parse(startDate);
                user_endDate = sdf.parse(endDate);


            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

            sqlUseStartDate = new java.sql.Date(user_startDate.getTime());
            sqlUseEndDate = new java.sql.Date(user_endDate.getTime());

        }

        ArrayList<AdminReservDTO> salesUserList = new AdminReservDAO().salesUserDetailSearch(userType, userValue, city, branch, sqlUseStartDate, sqlUseEndDate);

        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();


        int userTotalPay = 0;

        for (AdminReservDTO dto : salesUserList) {
            userTotalPay += dto.getPay();
        }


        boolean dateCheck1 = user_startDate.before(user_endDate);
        boolean dateCheck2 = user_startDate.equals(user_endDate);

        boolean isHasData = false;

        switch (userType) {
            case "mem_userid":
                isHasData = new MemberDAO().findInformation("mem_userid", userValue);
                break;
            case "mem_nickname":
                isHasData = new MemberDAO().findInformation("mem_nickname", userValue);

                break;
            case "mem_realname":
                isHasData = new MemberDAO().findInformation("mem_realname", userValue);

                break;
        }
        System.out.println(userValue);
        System.out.println(isHasData);
        if (!isHasData) {
            String msg = "";
            switch (userType) {
                case "mem_userid":
                    msg = "일치하는 아이디가 없습니다";
                    break;
                case "mem_nickname":
                    msg = "일치하는 닉네임이 없습니다";

                    break;
                case "mem_realname":
                    msg = "일치하는 이름이 없습니다";

                    break;
            }

            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        } else if(!endDate.equals("") && startDate.equals("")) {
            String msg = "시작 날짜를 지정해야합니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (!startDate.equals("") && endDate.equals("")) {
            String msg = "마지막 날짜를 지정해야합니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (!dateCheck1 && !dateCheck2) {
            String msg = "시작날짜와 종료날짜를 확인해주세요";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (userValue.equals("")) {
            String msg = "빈 칸으로 검색할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if(userValue.contains(" ")){
            String msg = "공백을 포함하여 검색할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (userTotalPay==0) {
            String msg = "매출 정보가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else{
            request.setAttribute("branchList", branchList);
            request.setAttribute("salesUserList", salesUserList);
            request.setAttribute("userTotalPay", userTotalPay);
            request.setAttribute("adminUrl", "adminSalesUser.jsp");
        }
    }
}