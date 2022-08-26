package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class AdminNewsDeleteReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("AdminNewsDelete 들어왔다");

        String path = request.getRealPath("/img/news");
       /* path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\news";*/

        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        int size = 1024 * 1024 * 10;

        NewsDTO dto = new NewsDAO().detail(Integer.parseInt(request.getParameter("id")));


            new NewsDAO().delete(Integer.parseInt(request.getParameter("id")));

            new File(path + "\\" + dto.getNews_thumbnail_img()).delete();
            new File(path + "\\" + dto.getNews_img()).delete();


        String msg = "삭제 되었습니다.";
        String goUrl = "AdminNewsList";

        request.setAttribute("adminUrl","alert.jsp");
        request.setAttribute("msg",msg);
        request.setAttribute("goUrl",goUrl);
    }
}
