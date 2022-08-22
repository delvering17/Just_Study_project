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

            Date tt;
            switch (date_period) {
                case "all":
                    if(request.getParameter("type").equals("maked")){

                        studygroupList = new CommunityDAO().makedList(memberDTO.getMem_id());

                        for(CommunityDTO communityDTO : studygroupList){
                            int cnt = 0;
                            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                                if(applyStudyDTO.getAs_state() == 2){
                                    cnt ++;
                                }
                            }
                            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                                communityDTO.setStatus("모집마감");
                            } else{
                                communityDTO.setStatus("모집중");
                            }
                        }

                    } else if(request.getParameter("type").equals("apply")){

                        ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyList(memberDTO.getMem_id());

                        for(ApplyStudyDTO applyStudyDTO : myApplyList){
                            studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));

                        }

                        request.setAttribute("myApplyList", myApplyList);
                    }
                    break;
                case "today":
                    if(request.getParameter("type").equals("maked")){
                        studygroupList = new CommunityDAO().communityPeriodList(memberDTO.getMem_id(), date_today   , date_today);

                        for(CommunityDTO communityDTO : studygroupList){
                            int cnt = 0;
                            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                                if(applyStudyDTO.getAs_state() == 2){
                                    cnt ++;
                                }
                            }
                            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                                communityDTO.setStatus("모집마감");
                            } else{
                                communityDTO.setStatus("모집중");
                            }
                        }

                    } else if(request.getParameter("type").equals("apply")){
                        ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyPeriodList(memberDTO.getMem_id(),date_today, date_today );

                        for(ApplyStudyDTO applyStudyDTO : myApplyList){
                            studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));

                        }

                        request.setAttribute("myApplyList", myApplyList);
                    }

                    break;

                case "day7":
                    date_day -= 7;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    if(request.getParameter("type").equals("maked")){
                        studygroupList = new CommunityDAO().communityPeriodList(memberDTO.getMem_id(), date_bb, date_today);

                        for(CommunityDTO communityDTO : studygroupList){
                            int cnt = 0;
                            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                                if(applyStudyDTO.getAs_state() == 2){
                                    cnt ++;
                                }
                            }
                            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                                communityDTO.setStatus("모집마감");
                            } else{
                                communityDTO.setStatus("모집중");
                            }
                        }

                    } else if(request.getParameter("type").equals("apply")){
                        ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyPeriodList(memberDTO.getMem_id(),date_bb, date_today );

                        for(ApplyStudyDTO applyStudyDTO : myApplyList){
                            studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));

                        }

                        request.setAttribute("myApplyList", myApplyList);
                    }

                    break;

                case "month":
                    date_month -= 1;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    if(request.getParameter("type").equals("maked")){
                        studygroupList = new CommunityDAO().communityPeriodList(memberDTO.getMem_id(), date_bb, date_today);

                        for(CommunityDTO communityDTO : studygroupList){
                            int cnt = 0;
                            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                                if(applyStudyDTO.getAs_state() == 2){
                                    cnt ++;
                                }
                            }
                            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                                communityDTO.setStatus("모집마감");
                            } else{
                                communityDTO.setStatus("모집중");
                            }
                        }

                    } else if(request.getParameter("type").equals("apply")){
                        ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyPeriodList(memberDTO.getMem_id(),date_bb, date_today );

                        for(ApplyStudyDTO applyStudyDTO : myApplyList){
                            studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));

                        }

                        request.setAttribute("myApplyList", myApplyList);
                    }
                    break;
                case "month3":
                    date_month -= 3;
                    tt = new Date(date_year,date_month,date_day);
                    date_bb = sdf.format(tt);
                    if(request.getParameter("type").equals("maked")){
                        studygroupList = new CommunityDAO().communityPeriodList(memberDTO.getMem_id(), date_bb, date_today);

                        for(CommunityDTO communityDTO : studygroupList){
                            int cnt = 0;
                            for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                                if(applyStudyDTO.getAs_state() == 2){
                                    cnt ++;
                                }
                            }
                            if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                                communityDTO.setStatus("모집마감");
                            } else{
                                communityDTO.setStatus("모집중");
                            }
                        }
                    } else if(request.getParameter("type").equals("apply")){
                        ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyPeriodList(memberDTO.getMem_id(),date_bb, date_today );

                        for(ApplyStudyDTO applyStudyDTO : myApplyList){
                            studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));
                        }

                        request.setAttribute("myApplyList", myApplyList);
                    }

                    break;
            }

            request.setAttribute("date_period", date_period);

        } else {

            if(request.getParameter("type").equals("maked")){
                studygroupList = new CommunityDAO().communityPeriodList(memberDTO.getMem_id(), date_before, date_after);

                for(CommunityDTO communityDTO : studygroupList){
                    int cnt = 0;
                    for (ApplyStudyDTO applyStudyDTO : new ApplyStudyDAO().applyListPurpose(communityDTO.getId())){
                        if(applyStudyDTO.getAs_state() == 2){
                            cnt ++;
                        }
                    }
                    if(cnt == communityDTO.getPeople() || communityDTO.getEnddate().before(new Date())){
                        communityDTO.setStatus("모집마감");
                    } else{
                        communityDTO.setStatus("모집중");
                    }
                }

            } else if(request.getParameter("type").equals("apply")){
                ArrayList<ApplyStudyDTO> myApplyList = new ApplyStudyDAO().myApplyPeriodList(memberDTO.getMem_id(),date_before, date_after );

                for(ApplyStudyDTO applyStudyDTO : myApplyList){
                    studygroupList.add(new CommunityDAO().communityApplyDetail(applyStudyDTO.getAs_purpose(), applyStudyDTO.getReg_date()));
                }

                request.setAttribute("myApplyList", myApplyList);
            }



            request.setAttribute("date_before",date_before);
            request.setAttribute("date_after",date_after);
        }




        request.setAttribute("memberDTO", memberDTO);
        request.setAttribute("mainUrl","mypage/mypageTemplete.jsp");
        request.setAttribute("subUrl","mypage_studygroup.jsp");
        request.setAttribute("studygroupList", studygroupList);
    }
}
