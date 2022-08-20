package news_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NewsService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
