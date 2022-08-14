package mypage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MypageService {

    void execute(HttpServletRequest request, HttpServletResponse response);
}
