package customer_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Faq implements CustomerService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        

        request.setAttribute("mainUrl", "customer/faq.jsp");
    }
}
