package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUserList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<MemberDTO> adminData = new MemberDAO().list();
        request.setAttribute("adminData", adminData);
        request.setAttribute("adminUrl","adminUserList.jsp");



    }
}
