package memberNonView_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberSigninDoubleCheck implements MemberNonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String input_id = request.getParameter("input_id");
        System.out.println(input_id);


        try {
            response.getWriter().write(input_id);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
