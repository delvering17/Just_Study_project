package mypage_p;

import model_p.BranchDAO;
import model_p.BranchDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MypageInquiryInsertForm implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));


        ArrayList<String> arr_branchName = new BranchDAO().branchNameList();



        request.setAttribute("arr_branchName", arr_branchName);

        request.setAttribute("memberDTO", memberDTO);

        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_inquiryInsertForm.jsp");

    }
}
