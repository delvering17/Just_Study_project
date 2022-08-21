package nonView_p;

import model_p.BranchDTO;
import model_p.ReservationDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class SetReservationItems implements NonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<BranchDTO> branchList = new ReservationDAO().branchList();
        String res = "";

        for (BranchDTO dto : branchList) {
            if ((request.getParameter("type")+"").equals("setBranch")) {
                if (((String) request.getParameter("cityName")).equals(dto.getCity())) {
                    res += "<input type=\"radio\" name=\"branchName\" id=\"" + dto.getNameEn() + "\" hidden/>";
                    res += "<label for=\"" + dto.getNameEn() + "\"><div>" + dto.getNameEn() + "</div></label>";
                }
            } else if ((request.getParameter("type")+"").equals("setRoom")) {
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

                    res += ","+dto.getPrice();
                }
            } else if((request.getParameter("type")+"").equals("setTime")){

                String city = request.getParameter("cityName");
                String branch = request.getParameter("branchName");
                String room = request.getParameter("roomName");
                String selectedDay = request.getParameter("selectedDay");

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                if(branch.equals(dto.getName())){
                    String soldOutList = null;
                    try {
                        soldOutList = new ReservationDAO().soldOutList(city, branch, room, sdf.parse(selectedDay));
                        System.out.println(soldOutList);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                    for(int i = dto.getOpen(); i < dto.getClose(); i++){
                        try {
                            String time1 = (i > 9 ? "" : "0") + i + ":00";
                            String time2 = (i + 1 > 9 ? "" : "0") + (i + 1) + ":00";

                            if(soldOutList.contains(time1)){
                                res += "<div><div class=\"studyroom-reserv-impossible\">"+URLEncoder.encode("예약완료", "UTF-8")+"</div><div>"+ time1 +" ~ "+ time2
                                        +"</div></div>";
                            } else {
                                res += "<input type=\"checkbox\" name=\"time\" id=\""+ time1 +"\" hidden/>";
                                res += "<label for=\"" + time1 + "\"><div><div class=\"studyroom-reserv-possible\">" + URLEncoder.encode("예약가능", "UTF-8") + "</div><div>" + time1 + " ~ " + time2
                                        + "</div></div></label>";
                            }
                        } catch (UnsupportedEncodingException e) {
                            throw new RuntimeException(e);
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
