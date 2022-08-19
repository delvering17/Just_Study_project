package event_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface EventService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
