package reservation_p;

import model_p.ReservationDAO;
import model_p.ReservationDTO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Properties;

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

    public void goSuccessEmail(String email, ReservationDTO reservationDTO) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("juststudy0901@gmail.com", "bprricppjougqmjj");
            }
        });

        String receiver = email; // 메일 받을 주소
        String title = "[Just Study] 예약이 완료되었습니다.";
        String content = "<h2>Just Study</h2>";
        content += "<h2>인증번호:</h2><h2 style='color:blue'>"+  +"</h2>";
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("juststudy0901@gmail.com", "관리자", "utf-8"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            message.setSubject(title);
            message.setContent(content, "text/html; charset=utf-8");

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
