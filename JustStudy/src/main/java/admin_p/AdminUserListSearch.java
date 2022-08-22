package admin_p;

import model_p.BlackDAO;
import model_p.BlackDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUserListSearch implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<MemberDTO> adminData;

        String userType = request.getParameter("userList-search");
        String userValue = request.getParameter("searchUserList-input");
        System.out.println("userValue:"+userValue);

        adminData = new MemberDAO().userListFilter(userType, userValue);

        if(userValue==""){
            String msg = "빈 칸으로 검색할 수 없습니다";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl","AdminUserList");
        }else if(adminData.isEmpty()){
            String msg = "회원 정보 없음";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl","AdminUserList");
        }else {
            request.setAttribute("adminData", adminData);
            request.setAttribute("adminUrl","adminUserList.jsp");
        }






    }
}
