package news_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class NewsInsertReg implements NewsService {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("NewsinsertReg 들어왔냐?");

        String path = request.getRealPath("/img/news");
        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        int size = 1024 * 1024 * 10;


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        NewsDTO dto = new NewsDTO();

        try {
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());


            dto.setNews_title(mr.getParameter("news_title"));
            dto.setNews_content(mr.getParameter("news_content"));
            dto.setNews_img(mr.getFilesystemName("news_img"));
            dto.setNews_reg_date(sdf.parse(mr.getParameter("news_reg_date")));



        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        new NewsDAO().insert(dto);


        System.out.println(dto);

        request.setAttribute("mainUrl", "news/alert.jsp");
        request.setAttribute("msg", "입력되었습니다.");
        request.setAttribute("goUrl", "NewsDetail?id=" + dto.getNews_id());
    }
}
