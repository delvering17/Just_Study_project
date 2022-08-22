package admin_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminFAQList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<FaqDTO> faqList = new FaqDAO().totalList();

        request.setAttribute("faqList", faqList);
        request.setAttribute("adminUrl", "adminFAQList.jsp");
    }
}
