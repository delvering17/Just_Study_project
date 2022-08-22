package main_p;

import model_p.MemberDAO;
import model_p.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainPage implements MainService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("mainUrl", "main/main.jsp");
    }
}
