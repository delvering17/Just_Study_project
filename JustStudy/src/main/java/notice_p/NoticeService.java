package notice_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NoticeService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
