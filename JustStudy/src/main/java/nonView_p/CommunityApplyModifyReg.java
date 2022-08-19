package nonView_p;

import model_p.ApplyStudyDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommunityApplyModifyReg implements NonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        int as_id = Integer.parseInt(request.getParameter("as_id"));
        String as_content = request.getParameter("as_content");

        // db

        new ApplyStudyDAO().applyModify(as_id,as_content);


        JSONObject jj = new JSONObject();
        try {
            jj.put("modifyResult", "success");
            jj.put("as_id",as_id);

            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
