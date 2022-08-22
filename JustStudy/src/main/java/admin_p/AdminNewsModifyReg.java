package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNewsModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminNewsModifyReg 입장~");

        String path = request.getRealPath("/img/news");
        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        int size = 1024 * 1024 * 10;

        NewsDTO dto = new NewsDTO();


        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            dto.setNews_title(mr.getParameter("news_title"));
            dto.setNews_content(mr.getParameter("news_content"));
            dto.setNews_img(mr.getFilesystemName("news_img"));
            dto.setNews_id(Integer.parseInt(mr.getParameter("news_id")));

            String msg = "수정 실패";
            String adminUrl = "AdminNewsModifyForm.jsp";

            if(new NewsDAO().modify(dto,mr.getFilesystemName("news_img") ) > 0){
                msg = "수정되었습니다.";
                adminUrl = "alert.jsp";

            }

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", adminUrl);
            request.setAttribute("goUrl", "AdminNewsDetail?id="+dto.getNews_id());
            request.setAttribute("NewsDTO", dto);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
