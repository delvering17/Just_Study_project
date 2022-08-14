package nonView_p;

import model_p.ReservationDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;

public class SetPayList implements NonViewService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String[] payList = request.getParameterValues("paylist");
        System.out.println(payList);

        String res = "";

        JSONObject data = new JSONObject();

        int total = 0;
        for(int i = 0; i < payList.length; i ++){

            String eachReserv = payList[i];

            eachReserv = eachReserv.replaceAll(" ", "");
            System.out.println(eachReserv);

            total += Integer.parseInt(eachReserv.split("\\|")[6].split("원")[0]);

            res += "<div><p><b>" +
                    eachReserv.split("\\|")[0] + " | " + eachReserv.split("\\|")[1] +
                "</b></p><div><div>" +
                    eachReserv.split("\\|")[3] +
                "</div><ul><li>" +
                    eachReserv.split("\\|")[2] +
                "</li><li>예약시간 | " +
                    eachReserv.split("\\|")[4] +
                "</li></ul><div>총 " +
                    eachReserv.split("\\|")[4].split(",").length +
                "시간 / " +
                    eachReserv.split("\\|")[5] +" / "+
                    eachReserv.split("\\|")[6] +
                "</div></div></div>";
        }


        try {
            data.put("total", total);
            data.put("res", URLEncoder.encode(res, "UTF-8").replaceAll("[+]", " "));
            response.getWriter().append(data.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
