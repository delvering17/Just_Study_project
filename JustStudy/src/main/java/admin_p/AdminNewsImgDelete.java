package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model_p.NewsDAO;
import model_p.NewsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class AdminNewsImgDelete implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("AdminImageDelete 들어왔다");

        String path = request.getRealPath("/img/event");
        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
                "\\img\\news";

        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\news";

        int size = 1024 * 1024 * 10;

        NewsDTO dto = new NewsDTO();

        try {
            MultipartRequest mr= new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            dto.setNews_id(Integer.parseInt(mr.getParameter("news_id")));
            dto.setNews_img(mr.getParameter("news_img"));
            dto.setNews_title(mr.getParameter("news_title"));
            dto.setNews_content(mr.getParameter("news_content"));

            String msg = "이미지 삭제 실패";
            if(new NewsDAO().imgDelete(dto,Integer.parseInt(mr.getParameter("news_id"))) > 0) {
                new File(path + "\\" + dto.getNews_img()).delete();
                msg = "이미지를 삭제했습니다.";
                dto.setNews_img(null);
            }

            request.setAttribute("msg",msg);
            request.setAttribute("dto", dto);
            request.setAttribute("adminUrl","adminNewsModifyForm.jsp");

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
