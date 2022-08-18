package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CommunityInsertReg implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");

        try {
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


        System.out.println(dto);

        request.setAttribute("mainUrl", "community/alert.jsp");
        request.setAttribute("msg", "입력되었습니다.");
        request.setAttribute("goUrl", "CommunityDetail?id="+dto.getId());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

      /*  CommunityDTO dto = new CommunityDTO();
            dto.setId(Integer.parseInt(request.getParameter("id")));
            dto.setMstudy(Integer.parseInt(request.getParameter("mstudy")));
            dto.setTitle(request.getParameter("title"));
            dto.setPname(request.getParameter("pname"));
            dto.setContent(request.getParameter("content"));


            new CommunityDAO().insert(dto);


            System.out.println(dto);

            request.setAttribute("mainUrl", "community/alert.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            request.setAttribute("goUrl", "CommunityDetail?id="+dto.getId());
*/

    }
}
