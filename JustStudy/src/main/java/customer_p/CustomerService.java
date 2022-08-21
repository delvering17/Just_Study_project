package customer_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
