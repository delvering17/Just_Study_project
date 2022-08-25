package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        int modifyId = Integer.parseInt(request.getParameter("id"));
        String realname = request.getParameter("realname");
        String nickname = request.getParameter("nickname");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");

        MemberDTO userUpdate = new MemberDTO();

        userUpdate.setMem_id(Integer.parseInt(request.getParameter("id")));
        userUpdate.setMem_userid(request.getParameter("userid"));

        userUpdate.setMem_realname(request.getParameter("realname"));
        userUpdate.setMem_nickname(request.getParameter("nickname"));

        userUpdate.setMem_address1(request.getParameter("address1"));
        userUpdate.setMem_address2(request.getParameter("address2"));

        new MemberDAO().modifyInformation(userUpdate);

        if(realname.equals("") || nickname.equals("") || address1.equals("") || address2.equals("")) {
            String msg = "빈 칸으로 수정할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("modifyId", modifyId);
            request.setAttribute("goUrl", "AdminUserModify");

        }else if(realname.contains(" ") || nickname.contains(" ")){
            String msg = "공백을 포함하여 수정할 수 없습니다";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("modifyId", modifyId);
            request.setAttribute("goUrl", "AdminUserModify");

        }else{
            String msg = "수정 완료";
            request.setAttribute("adminUrl", "alert.jsp");
            request.setAttribute("msg", msg);
            request.setAttribute("goUrl","AdminUserList");
        }



    }
}
