package mypage_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class MypageStudygroup implements MypageService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO = new MemberDAO().detail((Integer) session.getAttribute("login"));

        ArrayList<CommunityDTO> studygroupList = new ArrayList<CommunityDTO>();
        if(request.getParameter("type").equals("maked")){

            studygroupList = new CommunityDAO().makedList(memberDTO.getMem_id());

        } else if(request.getParameter("type").equals("apply")){

            ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyList(memberDTO.getMem_id());

            for(ApplyStudyDTO applyStudyDTO : myApplyList){
                studygroupList.add(new CommunityDAO().detail(applyStudyDTO.getAs_purpose()));
            }

            request.setAttribute("myApplyList", myApplyList);
        }

        // 기간 검색 페이지 검색


//        String date_period = request.getParameter("date_period");
//        String date_before = request.getParameter("date_before");
//        String date_after = request.getParameter("date_after");
//
//
//        if(date_period != null) {
//
//            Date today = new Date();
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            String date_today = sdf.format(today);
//            String date_bb = "";
//
//            int date_year = Integer.parseInt(date_today.split("-")[0])-1900;
//            int date_month = Integer.parseInt(date_today.split("-")[1])-1;
//            int date_day = Integer.parseInt(date_today.split("-")[2]);
//            System.out.println(date_today);
//            Date tt;
//            switch (date_period) {
//                case "today":
//                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_today, date_today);
//                    break;
//
//                case "day7":
//                    date_day -= 7;
//                    tt = new Date(date_year,date_month,date_day);
//                    date_bb = sdf.format(tt);
//                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
//                    break;
//
//                case "month":
//                    date_month -= 1;
//                    tt = new Date(date_year,date_month,date_day);
//                    date_bb = sdf.format(tt);
//                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
//                    break;
//                case "month3":
//                    date_month -= 3;
//                    tt = new Date(date_year,date_month,date_day);
//                    date_bb = sdf.format(tt);
//                    arr_inquiryDTO = new InquiryDAO().inquiryPeriodList(memberDTO.getMem_id(), first, limit, date_bb, date_today);
//                    break;
//            }
//            System.out.println(date_bb);
//
//
//
//            request.setAttribute("date_period", date_period);
//
//        } else {
//
//            arr_inquiryDTO = new InquiryDAO().inquiryDateList(memberDTO.getMem_id(), first, limit, date_before, date_after);
//            request.setAttribute("date_before",date_before);
//            request.setAttribute("date_after",date_after);
//        }


        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_studygroup.jsp");
        request.setAttribute("studygroupList", studygroupList);
    }
}
