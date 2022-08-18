package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyInsertReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

                System.out.println("ApplyinsertReg 들어왔냐?");

             /*   try {
                    CommunityDTO dto = new CommunityDTO();
                    dto.setLocation(request.getParameter("location"));
                    dto.setStartdate(request.getParameter("startdate"));
                    dto.setEnddate(request.getParameter("enddate"));
                    dto.setTitle(request.getParameter("title"));
                    dto.setPname(request.getParameter("pname"));
                    dto.setPeople(Integer.parseInt(request.getParameter("people")));
                    dto.setStudykind(request.getParameter("studykind"));
                    dto.setContent(request.getParameter("content"));


                    new CommunityDAO().insert(dto);


                    System.out.println(dto);*/

                    request.setAttribute("mainUrl", "community/alert.jsp");
                    request.setAttribute("msg", "입력되었습니다.");
                    request.setAttribute("goUrl", "studygroup.jsp");
           /*     } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }*/


            }
        }
