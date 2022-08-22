package main_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainPage implements MainService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        Integer mem_id = (Integer) session.getAttribute("login");


        if(mem_id != null) {
            MemberDTO memberDTO = new MemberDAO().detail(mem_id);
            request.setAttribute("mem_level", memberDTO.getMem_level());

        }


        request.setAttribute("mainUrl", "main/main.jsp");
    }
}
