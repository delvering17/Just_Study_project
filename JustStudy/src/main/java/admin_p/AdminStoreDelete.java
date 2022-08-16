package admin_p;

import model_p.BranchDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminStoreDelete implements AdminService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String branchName = request.getParameter("branchName");

        String msg = "삭제 실패하였습니다.";
        if(new BranchDAO().delete(branchName) > 0){
            msg = "삭제되었습니다.";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("goUrl", "AdminStoreList");

    }
}
