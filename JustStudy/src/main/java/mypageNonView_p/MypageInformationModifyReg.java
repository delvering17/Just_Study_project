package mypageNonView_p;

import model_p.MemberDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MypageInformationModifyReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {




        String input_realname = request.getParameter("input_realname");
        String input_nickname = request.getParameter("input_nickname");
        String input_phone = request.getParameter("input_phone");
        String input_address1 = request.getParameter("input_address1");
        String input_address2 = request.getParameter("input_address2");


        // TODO - 유효성 검사 필요



//        new MemberDAO().signIn();

        JSONObject jj = new JSONObject();
        try {


            jj.put("modifyResult","success");
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
