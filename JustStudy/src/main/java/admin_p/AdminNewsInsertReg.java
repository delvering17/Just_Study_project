package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AdminNewsInsertReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String path = request.getRealPath("/img/event");
        /*path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\news";*/
        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\img\\news";
        /*path = "C:\\juststudy\\JustStudy\\src\\main\\webapp\\img\\news";*/

        int size = 1024 * 1024 * 10;

        NewsDTO dto = new NewsDTO();

        try {
            MultipartRequest mr= new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            dto.setNews_title(mr.getParameter("news_title"));
            dto.setNews_content(mr.getParameter("news_content"));
            dto.setNews_img(mr.getFilesystemName("news_img"));
            dto.setNews_thumbnail_img(mr.getFilesystemName("news_thumbnail_img"));


        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        new NewsDAO().insert(dto);


        request.setAttribute("adminUrl","alert.jsp");
        request.setAttribute("msg","등록되었습니다.");
        request.setAttribute("goUrl","AdminNewsDetail?id="+dto.getNews_id());


    }
}
