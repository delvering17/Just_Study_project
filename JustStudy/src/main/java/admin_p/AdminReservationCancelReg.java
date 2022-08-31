package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;
import model_p.ReservationDAO;
import model_p.ReservationDTO;
import reservation_p.iamport.IamportCancel;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

public class AdminReservationCancelReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        ReservationDTO reservationDTO = new ReservationDAO().reservationDetail(Integer.parseInt(request.getParameter("reservId")));

        ArrayList<Integer> sameOrderList = new ReservationDAO().sameOrderList(reservationDTO.getOrderId());

        IamportCancel iamportCancel = new IamportCancel();


        if(sameOrderList.size() == 1){
            iamportCancel.testCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId());
        } else{
            iamportCancel.testPartialCancelPaymentAlreadyCancelledImpUid(reservationDTO.getOrderId(), reservationDTO.getPay());
        }

        String msg = iamportCancel.getPayment_response().getMessage();

        if(iamportCancel.getPayment_response().getMessage() == null){
            msg = "취소하였습니다.";
            new ReservationDAO().reservationCancelByAdmin(reservationDTO.getId(), request.getParameter("cancel-reason"));
        }

        MemberDTO memberDTO = new MemberDAO().detail(reservationDTO.getUserId());

        reservationDTO.setCancelReason(request.getParameter("cancel-reason"));

        goCancelEmail(memberDTO.getMem_userid(),  reservationDTO);

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminReservList");
    }

    public void goCancelEmail(String email, ReservationDTO reservationDTO) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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
        String title = "[Just Study] 예약이 취소되었습니다.";
        String content = "<h2>Just Study</h2><br/>";
        content += "안녕하세요, Just Study 입니다.<br/>";
        content += "매장 사정으로 부득이하게 스터디룸 예약이 취소되어 안내드립니다.<br/><br/>";

        content += "[취소내역]<br/>";
        content += "지점: " + reservationDTO.getBranch() + "<br/>";
        content += "룸타입: " + reservationDTO.getRoom() + "<br/>";
        content += "이용일: " + sdf.format(reservationDTO.getUseDate()) + "<br/>";
        content += "이용시간: " + reservationDTO.getTime() + "<br/>";
        content += "인원: " + reservationDTO.getHeadcount() + "인<br/><br/>";
        content += "예약금액: " + reservationDTO.getPay() + "원<br/><br/>";
        content += "취소사유: " + reservationDTO.getCancelReason() + "<br/><br/>";

        content += "예약금액은 전액 환불처리 되었습니다.<br/>";
        content += "문의사항은 Just Study 홈페이지 > HELP > 1:1문의 이용 부탁드립니다.<br/>";
        content += "이용에 불편드려 죄송합니다.<br/>";

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
