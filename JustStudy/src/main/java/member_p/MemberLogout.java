package member_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogout implements MemberService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();
        session.removeAttribute("memberDTO");

        request.setAttribute("member_msg", "로그아웃 되었습니다.");
        request.setAttribute("mainUrl", "member/member_alert.jsp");
        request.setAttribute("goUrl", "../board/MainPage");
    }
}
