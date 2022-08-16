package admin_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
