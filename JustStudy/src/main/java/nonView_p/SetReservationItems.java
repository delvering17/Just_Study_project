package nonView_p;

import model_p.BranchDTO;
import model_p.DAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class SetReservationItems implements NonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        String appendBranch = "";

        ArrayList<BranchDTO> branchList = new DAO().branchList();

        for(BranchDTO dto : branchList){
            if(((String) request.getParameter("cityName")).equals(dto.getCity())){
                appendBranch += "<input type=\"radio\" name=\"branchName\" id=\""+dto.getNameEn()+"\" hidden/>";
                appendBranch += "<label for=\""+dto.getNameEn()+"\"><div>"+dto.getNameEn()+"</div></label>";
            }
        }

        try {
            response.getWriter().append(appendBranch);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
