package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class AdminUserListSearch implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){

        ArrayList<MemberDTO> adminData;
        ArrayList<BlackDTO> adminBlackData = new BlackDAO().blackList();

        String userType = request.getParameter("userList-search");
        String userValue = request.getParameter("searchUserList-input");

        adminData = new MemberDAO().userListFilter(userType, userValue);

        String userId = "";
        String userNickname = "";
        String userRealname = "";

        for (MemberDTO dto : adminData) {
            userId = dto.getMem_userid();
            userNickname = dto.getMem_nickname();
            userRealname = dto.getMem_realname();
        }


        if(userValue==""){
            String msg = "빈 칸으로 검색할 수 없습니다";
            request.setAttribute("adminUrl","alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl","AdminUserList");

        }else if(userValue.contains(" ")) {
            String msg = "공백을 포함하여 검색할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminUserList");

        }else if(userType.equals("mem_userid") && !userId.contains(userValue)) {
            String msg = "일치하는 아이디가 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminUserList");

        }else if(userType.equals("mem_nickname") && !userNickname.contains(userValue)) {
            String msg = "일치하는 닉네임이 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminUserList");

        }else if(userType.equals("mem_realname") && !userRealname.contains(userValue)) {
            String msg = "일치하는 이름이 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl", "AdminUserList");

        }else {
            request.setAttribute("adminData", adminData);
            request.setAttribute("userStatus", adminData.size());
            request.setAttribute("blackStatus", adminBlackData.size());
            request.setAttribute("adminUrl","adminUserList.jsp");
        }


    }
}
