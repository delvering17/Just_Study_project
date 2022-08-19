package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminSalesUserSearch implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<AdminReservDTO> salesUserList = new ArrayList<>();

        String userType = request.getParameter("user-search");
        String userValue = request.getParameter("search-input");

        if (userType.equals("id")){
            salesUserList = new AdminReservDAO().userSalesIdSearch(userValue);
        }else if(userType.equals("nickname")){
            salesUserList = new AdminReservDAO().userSalesNicknameSearch(userValue);
        }

        int userTotalPay = 0;
        for (int i = 0; i < salesUserList.size(); i++) {
            userTotalPay += salesUserList.get(i).getPay();
        }

        request.setAttribute("salesUserList", salesUserList);
        request.setAttribute("userTotalPay", userTotalPay);
        request.setAttribute("adminUrl", "adminSalesUser.jsp");
    }
}
