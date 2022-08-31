package admin_p;

import model_p.BlackDAO;
import model_p.BlackDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminBlackList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BlackDTO> blackData = new BlackDAO().blackList();
        int blackSize = blackData.size();

        request.setAttribute("blackData", blackData);
        request.setAttribute("blackSize", blackSize);
        request.setAttribute("adminUrl","adminBlackList.jsp");
    }
}
