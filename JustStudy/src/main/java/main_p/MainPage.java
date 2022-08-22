package main_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainPage implements MainService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("mainUrl", "main/main.jsp");
    }
}
