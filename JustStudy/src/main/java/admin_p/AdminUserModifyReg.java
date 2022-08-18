package admin_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUserModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        MemberDTO userUpdate = new MemberDTO();

        userUpdate.setMem_id(Integer.parseInt(request.getParameter("id")));
        userUpdate.setMem_userid(request.getParameter("userid"));

        userUpdate.setMem_realname(request.getParameter("realname"));
        userUpdate.setMem_nickname(request.getParameter("nickname"));

        userUpdate.setMem_address1(request.getParameter("address1"));
        userUpdate.setMem_address2(request.getParameter("address2"));
        userUpdate.setMem_phone(request.getParameter("phone"));

        new MemberDAO().modifyInformation(userUpdate);

        String msg = "수정 완료";
        request.setAttribute("adminUrl", "alert.jsp");
        request.setAttribute("msg", msg);
        request.setAttribute("goUrl","AdminUserList");


    }
}
