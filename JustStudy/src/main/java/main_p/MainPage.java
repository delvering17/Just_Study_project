package main_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainPage implements MainService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("mainpage");
        request.setAttribute("mainUrl", "main/main.jsp");
    }
}
