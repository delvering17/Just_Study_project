package nonView_p;

import community_p.CommunityService;
import model_p.ApplyStudyDAO;
import model_p.CommunityDAO;
import model_p.CommunityDTO;
import model_p.MemberDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommunityApplyInsertReg implements NonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));

        int input_id = Integer.parseInt(request.getParameter("input_id"));
        String input_content = request.getParameter("input_content");

        int as_id = new ApplyStudyDAO().selectAs_id();
        // db
        new ApplyStudyDAO().insertApply(input_purpose,input_id,input_content);

        JSONObject jj = new JSONObject();
        try {
            jj.put("applyResult", "success");
            jj.put("as_id",as_id);
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
