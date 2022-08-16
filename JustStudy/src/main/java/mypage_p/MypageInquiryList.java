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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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



        int first = (nowPage - 1) * limit;
        int firstPage = (nowPage - 1) / pageLimit * pageLimit + 1;
        int endPage = firstPage + pageLimit - 1;


        int total ;


//        System.out.println(nowPage + "," + first + "," + total + "," + totalPage);

        ArrayList<InquiryDTO> arr_inquiryDTO = null;


        // 기간 검색 페이지 검색
        String date_period = request.getParameter("date_period");
        String date_before = request.getParameter("date_before");
        String date_after = request.getParameter("date_after");

        if(date_period != null) {





            Date today = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date_today = sdf.format(today);
            String date_bb = "";

            int date_year = Integer.parseInt(date_today.split("-")[0])-1900;
            int date_month = Integer.parseInt(date_today.split("-")[1])-1;
            int date_day = Integer.parseInt(date_today.split("-")[2]);
            System.out.println(date_today);
            Date tt;
            switch (date_period) {
                case "today":
                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_today, date_today);
                    break;

                case "day7":
                    date_day -= 7;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
                    break;

                case "month":
                    date_month -= 1;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
                    break;
                case "month3":
                    date_month -= 3;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
                    break;
            }
            System.out.println(date_bb);

            total = new InquiryDAO().inquiryTotal(memberDTO.getMem_id(),date_bb, date_today);

            request.setAttribute("date_period", date_period);

        } else {

            total = new InquiryDAO().inquiryTotal(memberDTO.getMem_id(),date_before, date_after);

            arr_inquiryDTO = new InquiryDAO().inquiryDateList(memberDTO.getMem_id(), first, limit, date_before, date_after);
            request.setAttribute("date_before",date_before);
            request.setAttribute("date_after",date_after);
        }


        int totalPage = total/limit;

        if((total % limit) != 0) {
            totalPage++;
        }

        if(endPage > totalPage) {
            endPage = totalPage;
        }


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
