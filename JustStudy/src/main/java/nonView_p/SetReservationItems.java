package nonView_p;

import model_p.BranchDTO;
import model_p.DAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.util.ArrayList;

public class SetReservationItems implements NonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BranchDTO> branchList = new DAO().branchList();
        String res = "";

        for (BranchDTO dto : branchList) {
            if (request.getParameter("cityName") != null) {
                if (((String) request.getParameter("cityName")).equals(dto.getCity())) {
                    res += "<input type=\"radio\" name=\"branchName\" id=\"" + dto.getNameEn() + "\" hidden/>";
                    res += "<label for=\"" + dto.getNameEn() + "\"><div>" + dto.getNameEn() + "</div></label>";
                }
            } else if (request.getParameter("branchName") != null) {
                if(((String) request.getParameter("branchName")).equals(dto.getName())){
                    for(String roomName : dto.getRooms().split(",")) {
                        try {
                            String roomNameEn = URLEncoder.encode(roomName, "UTF-8").replaceAll("[+]", "&nbsp;");
                            res += "<input type=\"radio\" name=\"roomName\" id=\"" + roomNameEn + "\" hidden/>";
                            res += "<label for=\"" + roomNameEn + "\"><div>" + roomNameEn + "</div></label>";
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }

        try {
            response.getWriter().append(res);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
