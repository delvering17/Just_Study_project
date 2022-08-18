package memberNonView_p;

import model_p.EmailCertificateDAO;
import model_p.MemberDAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

public class MemberSigninDoubleCheck implements MemberNonViewService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String input_userid = request.getParameter("input_userid");
        String input_nickname = request.getParameter("input_nickname");


        String check_result = "success";
        Boolean go = false;

        if(input_userid != null) {
            go = new MemberDAO().idDoubleCheck(input_userid);
            if(go) {
                check_result = "중복된 닉네임 입니다";
            } else {
                int certificate_num = (int) (Math.random() * 100000);

                String cc_date = "";
                Date certificate_date ;

                if(new EmailCertificateDAO().checkDoubleEmail(input_userid)) {
                    certificate_date = new EmailCertificateDAO().insertDoubleEmail(input_userid,certificate_num);



                } else {
                    certificate_date = new EmailCertificateDAO().insertCertificate_num(input_userid,certificate_num);
                }
                check_result = "입력한 메일 확인하시어 인증 번호를 입력해주세요";


                if(certificate_date != null) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(certificate_date);
                    cal.add(Calendar.MINUTE, 3);
                    certificate_date = cal.getTime();


                    System.out.println(certificate_date);


                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
                    cc_date = sdf.format(certificate_date);

                    check_result = cc_date + "까지 인증해주세요.";

                }

                goEmail(input_userid, certificate_num);
            }

        } else {

            go = new MemberDAO().nicknameDoubleCheck(input_nickname);

            if(go) {
                check_result = "fail";
            }
        }

        // email 인증번호 난수




        try {
            response.getWriter().write(URLEncoder.encode(check_result,"UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }




    }

    public void goEmail(String email, int certificate_num) {
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
        String title = "Just Study 인증번호";
        String content = "<h1>인증번호를 회원가입 인증번호 입력창에 입력해주세요</h1>";
        content += "<h2>인증번호:</h2><h2 style='color:blue'>"+ certificate_num +"</h2>";
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
