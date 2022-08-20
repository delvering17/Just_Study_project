package memberNonView_p;

import model_p.EmailCertificateDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public class MemberCertificationNum implements MemberNonViewService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String input_userid = request.getParameter("input_userid");
        String input_certificate = request.getParameter("input_certificate_num");

        

        int input_certificate_num = Integer.parseInt(input_certificate);

        Date now = new Date();

        Calendar cal = Calendar.getInstance();
        cal.setTime(now);
        cal.add(Calendar.MINUTE, -3);
        Date now_date_After3min = cal.getTime();
        System.out.println(input_userid);
        System.out.println(now);

        Boolean res = new EmailCertificateDAO().certificateNum(input_userid,input_certificate_num,now_date_After3min);


        JSONObject jj = new JSONObject();

        try {
            if(res) {

                jj.put("certificateResult", "success");

            } else {
                jj.put("certificateResult", "fail");
            }


            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
