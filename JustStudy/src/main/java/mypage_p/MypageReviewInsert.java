package mypage_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MypageReviewInsert implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ReviewDTO reviewDTO = new ReviewDTO();
        reviewDTO.setReservId(Integer.parseInt(request.getParameter("reservId")));
        reviewDTO.setMemId(memberDTO.getMem_id());
        reviewDTO.setStar(request.getParameterValues("reviewStar").length);
        reviewDTO.setContent(request.getParameter("reviewContent"));

        String msg = "작성 실패";

        if(new ReviewDAO().insert(reviewDTO) > 0 && new ReviewDAO().reviewDone(reviewDTO) > 0){
            msg = "후기 작성이 완료되었습니다.";
        }


        request.setAttribute("msg", msg);
        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypage_alert.jsp");
        request.setAttribute("goUrl","MypageReviewDetail?reservId="+ reviewDTO.getReservId());
    }
}
