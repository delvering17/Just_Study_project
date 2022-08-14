package memberNonView_p;

import model_p.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberSigninDoubleCheck implements MemberNonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String input_id = request.getParameter("input_id");
        System.out.println(input_id);

        Boolean go = new MemberDAO().idDoubleCheck(input_id);

        String check_result = "fail";
        if(go) {
            check_result = "success";
        }
        try {
            response.getWriter().write(check_result);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
