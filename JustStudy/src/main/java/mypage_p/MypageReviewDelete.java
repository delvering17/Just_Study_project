package mypage_p;

import model_p.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageReviewDelete implements MypageService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String msg = "삭제 실패";

        if(new ReviewDAO().delete(Integer.parseInt(request.getParameter("reservId"))) > 0
            && new ReviewDAO().changeReviewStatus(Integer.parseInt(request.getParameter("reservId"))) > 0){
            msg = "삭제되었습니다.";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("mainUrl","mypage/mypage_alert.jsp");
        request.setAttribute("goUrl","MyReservationList");
    }
}
