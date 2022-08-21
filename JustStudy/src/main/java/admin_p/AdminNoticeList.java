package admin_p;

import model_p.NoticeDAO;
import model_p.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminNoticeList implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<NoticeDTO> mainData = new NoticeDAO().list();
        System.out.println("AdminNoticeList 들어왔따 : "+mainData);

        request.setAttribute("mainData",mainData);
        request.setAttribute("adminUrl", "adminNoticeList.jsp");
    }

}
