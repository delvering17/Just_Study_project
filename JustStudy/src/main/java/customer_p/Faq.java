package customer_p;

import model_p.FaqDAO;
import model_p.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class Faq implements CustomerService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<FaqDTO> faqList = new FaqDAO().list(request.getParameter("category"));

        request.setAttribute("faqList", faqList);
        request.setAttribute("mainUrl", "customer/faq.jsp");
    }
}
