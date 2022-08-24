package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
        Date user_startDate = null;
        Date user_endDate = null;

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
            System.out.println(userId);
        }

        if ( (userType.equals("mem_userid") && userId.contains(userValue)) ||
                (userType.equals("mem_nickname") && userNickname.contains(userValue)) ||
                (userType.equals("mem_realname") && userRealname.contains(userValue)) ){
            request.setAttribute("branchList", branchList);
            request.setAttribute("salesUserList", salesUserList);
            request.setAttribute("userTotalPay", userTotalPay);
            request.setAttribute("adminUrl", "adminSalesUser.jsp");
        }
        System.out.println(userType.equals("mem_userid") && !userId.contains(userValue));
        if (userType.equals("mem_userid") && !userId.contains(userValue)) {
            String msg = "일치하는 아이디가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
            System.out.println("userType:"+userType);
            System.out.println("userId:"+userId);
            System.out.println("userValue:"+userValue);
        } else if (userType.equals("mem_nickname") && !userNickname.contains(userValue)) {
            String msg = "일치하는 닉네임이 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        } else if (userType.equals("mem_realname") && !userRealname.contains(userValue)) {
            String msg = "일치하는 이름이 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        }

        if( (userType.equals("mem_userid") && userId.contains(userValue) && userTotalPay==0) ){
            String msg = "해당 회원의 매출 정보가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        }else if( (userType.equals("mem_nickname") && userNickname.contains(userValue) && userTotalPay==0)  ){
            String msg = "해당 회원의 매출 정보가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        }else if( (userType.equals("mem_realname") && userRealname.contains(userValue) && userTotalPay==0) ){
            String msg = "해당 회원의 매출 정보가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        }

        if(userValue.equals("")){
            String msg = "빈 칸으로 검색할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminSalesUser");
        }
    }
}