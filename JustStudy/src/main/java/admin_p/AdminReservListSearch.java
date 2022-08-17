package admin_p;

import model_p.AdminReservDAO;
import model_p.AdminReservDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public class AdminReservListSearch implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HashMap<String, String> columnName = new HashMap<String, String>();
        columnName.put("ID", "id");
        columnName.put("주문번호", "orderId");
        columnName.put("주문일자", "resDate");
        columnName.put("사용자ID", "mem_userid");
        columnName.put("사용자이름", "mem_realname");
        columnName.put("지역", "city");
        columnName.put("지점", "branch");
        columnName.put("룸타입", "room");
        columnName.put("이용일자", "useDate");
        columnName.put("시간", "time");
        columnName.put("인원수", "headcount");
        columnName.put("결제금액", "pay");
        columnName.put("상태", "status");

        ArrayList<AdminReservDTO> listFilter = new AdminReservDAO().listFilter(
                columnName.get(request.getParameter("filter")),
                request.getParameter("word")
        );

        request.setAttribute("totalList", listFilter);
        request.setAttribute("adminUrl", "adminReservList.jsp");
    }
}
