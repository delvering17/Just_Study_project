package member_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLoginForm implements MemberService{


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        request.setAttribute("mainUrl", "member/member_loginForm.jsp");
//        System.out.println("잘오니");


    }
}
