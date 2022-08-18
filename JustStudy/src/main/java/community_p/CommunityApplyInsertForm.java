package community_p;

import model_p.CommunityDAO;
import model_p.CommunityDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityApplyInsertForm implements CommunityService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("insertReg 들어왔냐?");

        try {
            CommunityDTO dto = new CommunityDTO();

            dto.setPname(request.getParameter("pname"));

            dto.setContent(request.getParameter("content"));


            new CommunityDAO().insert(dto);


            System.out.println(dto);

            request.setAttribute("mainUrl", "community/applyinsertForm.jsp");
            request.setAttribute("msg", "입력되었습니다.");
            /*request.setAttribute("goUrl", "CommunityDetail?id="+dto.getId());*/
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
