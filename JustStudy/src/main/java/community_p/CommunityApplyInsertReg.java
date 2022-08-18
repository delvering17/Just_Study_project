package community_p;

import model_p.ApplyStudyDAO;
import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyInsertReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


//        int input_purpose = Integer.parseInt(request.getParameter("input_purpose"));
        int input_purpose = input_purpose = 1; // 나중에 제대로 디테일에서 넘겨 받고 지워줘라 찬욱아

        int input_id = Integer.parseInt(request.getParameter("input_id"));
        String input_content = request.getParameter("input_content");

        // db
        new ApplyStudyDAO().insertApply(input_purpose,input_id,input_content);


        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", "입력되었습니다.");
        request.setAttribute("goUrl", "studygroup.jsp");

    }
}
