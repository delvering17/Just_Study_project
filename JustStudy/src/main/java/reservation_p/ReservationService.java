package reservation_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ReservationService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
