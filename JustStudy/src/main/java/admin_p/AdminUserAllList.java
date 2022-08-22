package admin_p;

import model_p.BlackDAO;
import model_p.BlackDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminUserAllList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<MemberDTO> adminData = new MemberDAO().list();
        ArrayList<BlackDTO> adminBlackData = new BlackDAO().blackList();

        request.setAttribute("adminData", adminData);
        request.setAttribute("userStatus", adminData.size());
        request.setAttribute("blackStatus", adminBlackData.size());
        request.setAttribute("adminUrl","adminUserList.jsp");



    }
}
