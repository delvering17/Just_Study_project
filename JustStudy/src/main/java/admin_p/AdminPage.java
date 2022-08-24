package admin_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;
import model_p.ReservationDAO;
import model_p.TodayReservationDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;


public class AdminPage implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        LocalDate now = LocalDate.now();
        int unanswered = 0;

        ArrayList<TodayReservationDTO> todayReservation = new ReservationDAO().todayList(now);
        ArrayList<InquiryDTO> inquiryUnansweredDTO = new InquiryDAO().inquiryUnanswered();

        if(inquiryUnansweredDTO!=null){
            unanswered = inquiryUnansweredDTO.size();
        }

        request.setAttribute("todayReservation",todayReservation);
        request.setAttribute("unanswered", unanswered);
        request.setAttribute("adminUrl","adminMain.jsp");
    }
}

