package community_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommunityService {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
