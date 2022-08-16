package mypage_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class MypageInquiryList implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        request.setAttribute("memberDTO", memberDTO);


        // 문의 사항 list
        int nowPage = 1;
        if(request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        int limit = 5;
        int pageLimit = 4;

        int total = new InquiryDAO().inquiryTotal(memberDTO.getMem_id());

        int totalPage = total/limit;

        int first = (nowPage - 1) * limit;
        int firstPage = (nowPage - 1) / pageLimit * pageLimit + 1;
        int endPage = firstPage + pageLimit - 1;

        if((total % limit) != 0) {
            totalPage++;
        }

        if(endPage > totalPage) {
            endPage = totalPage;
        }

        System.out.println(nowPage + "," + first + "," + total + "," + totalPage);

        ArrayList<InquiryDTO> arr_inquiryDTO = new InquiryDAO().inquiryList(memberDTO.getMem_id(), first, limit);

        System.out.println(arr_inquiryDTO.get(0).getInquiry_id());
        System.out.println(arr_inquiryDTO.get(1).getInquiry_id());
        System.out.println(arr_inquiryDTO.get(2).getInquiry_id());
        System.out.println(arr_inquiryDTO.get(3).getInquiry_id());




        request.setAttribute("first", first);
        request.setAttribute("firstPage", firstPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("nowPage", nowPage);

        request.setAttribute("arr_inquiryDTO", arr_inquiryDTO);

        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_inquiryList.jsp");



    }
}
