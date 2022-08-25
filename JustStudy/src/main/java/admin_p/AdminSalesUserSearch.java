package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

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

        String userId = "";
        String userNickname = "";
        String userRealname = "";
        int userTotalPay = 0;

        for (AdminReservDTO dto : salesUserList) {
            userId = dto.getMem_userid();
            userNickname = dto.getMem_nickname();
            userRealname = dto.getMem_realname();
            userTotalPay += dto.getPay();
        }


        boolean dateCheck1 = user_startDate.before(user_endDate);
        boolean dateCheck2 = user_startDate.equals(user_endDate);

        System.out.println("dateCheck:" + dateCheck1);


        if(startDate.equals("")) {
            String msg = "시작 날짜를 지정해야합니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (endDate.equals("")) {
            String msg = "마지막 날짜를 지정해야합니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (!dateCheck1 && !dateCheck2) {
            String msg = "날짜 형식 오류";
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

        }else if (userType.equals("mem_userid") && !userId.contains(userValue)) {
            String msg = "일치하는 아이디가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (userType.equals("mem_nickname") && !userNickname.contains(userValue)) {
            String msg = "일치하는 닉네임이 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");

        }else if (userType.equals("mem_realname") && !userRealname.contains(userValue)) {
            String msg = "일치하는 이름이 없습니다";
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