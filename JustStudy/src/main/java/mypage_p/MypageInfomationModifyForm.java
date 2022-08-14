package mypage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageInfomationModifyForm implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {




        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_informationModifyForm.jsp");
    }
}
