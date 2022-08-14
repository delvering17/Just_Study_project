package memberNonView_p;

import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberSigninDoubleCheck implements MemberNonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String input_userid = request.getParameter("input_userid");
        String input_nickname = request.getParameter("input_nickname");

        System.out.println(input_userid);
        System.out.println(input_nickname);

        Boolean go = false;

        if(input_userid != null) {
            go = new MemberDAO().idDoubleCheck(input_userid);
        } else {
            go = new MemberDAO().nicknameDoubleCheck(input_nickname);
        }

        String check_result = "success";
        if(go) {
            check_result = "fail";
        }
        try {
            response.getWriter().write(check_result);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
