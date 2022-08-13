package memberNonView_p;


import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberLoginReg implements MemberNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String input_id = request.getParameter("input_id");
        String input_password = request.getParameter("input_password");


        try {

            JSONObject jj = new JSONObject();
            jj.put("id", input_id);
            response.getWriter().append(jj.toJSONString());

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
