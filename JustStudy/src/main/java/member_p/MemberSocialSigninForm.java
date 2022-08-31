package member_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberSocialSigninForm implements MemberService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("mainUrl", request.getAttribute("mainUrl"));
    }
}
