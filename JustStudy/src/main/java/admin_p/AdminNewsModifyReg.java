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

        String path = request.getRealPath("/img/news");
        /*path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\news";*/

        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\img\\news";

        /*path = "C:\\juststudy\\JustStudy\\src\\main\\webapp\\img\\news";*/

        int size = 1024 * 1024 * 10;

        NewsDTO dto = new NewsDTO();


        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            dto.setNews_title(mr.getParameter("news_title"));
            dto.setNews_content(mr.getParameter("news_content"));
            if(mr.getFilesystemName("news_img") == null) {
                dto.setNews_img(mr.getParameter("news_img"));
            } else {
                dto.setNews_img(mr.getFilesystemName("news_img"));
            }
            if(mr.getFilesystemName("news_thumbnail_img") == null) {
                dto.setNews_thumbnail_img(mr.getParameter("news_thumbnail_img"));
            } else {
                dto.setNews_thumbnail_img(mr.getFilesystemName("news_thumbnail_img"));

            }

            dto.setNews_id(Integer.parseInt(mr.getParameter("news_id")));


            String msg = "수정 실패";
            String adminUrl = "AdminNewsModifyForm.jsp";

            if(new NewsDAO().modify(dto) > 0){
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
