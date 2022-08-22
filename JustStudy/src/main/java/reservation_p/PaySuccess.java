package reservation_p;

import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

public class PaySuccess implements ReservationService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println(request.getParameter("userName"));

        String[] city = request.getParameterValues("city");
        String[] branch = request.getParameterValues("branch");
        String[] room = request.getParameterValues("room");
        String[] useDate = request.getParameterValues("useDate");
        String[] time = request.getParameterValues("time");
        String[] headcount = request.getParameterValues("headcount");
        String[] pay = request.getParameterValues("pay");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for(int i = 0; i < city.length; i ++){
            ReservationDTO dto = new ReservationDTO();
            dto.setOrderId(request.getParameter("orderId"));
            dto.setUserId(Integer.parseInt(request.getParameter("userId")));
            dto.setCity(city[i]);
            dto.setBranch(branch[i]);
            dto.setRoom(room[i]);
            dto.setTime(time[i]);
            dto.setPaymentMethod(request.getParameter("paymentMethod"));
            dto.setStatus("이용전");
            try {
                dto.setUseDate(sdf.parse(useDate[i]));
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            dto.setHeadcount(Integer.parseInt(headcount[i]));
            dto.setPay(Integer.parseInt(pay[i]));


            int a = new ReservationDAO().addReservation(dto);

        }

        request.setAttribute("mainUrl", "main/main.jsp");
    }
}
