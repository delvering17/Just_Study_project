package nonView_p;

import model_p.BranchDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class CheckBranchName implements NonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> branchNameList = new BranchDAO().branchNameList();

        String check = "0";
        for(String name : branchNameList){
            if(name.equals(request.getParameter("branchName"))){
                check = "1";
            }
        }

        try {
            response.getWriter().append(check);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
