package mypage_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageInfomationModifyForm implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

//        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));
        MemberDTO memberDTO = new MemberDAO().detail(1);



        request.setAttribute("memberDTO", memberDTO);

        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_informationModifyForm.jsp");

    }
}
