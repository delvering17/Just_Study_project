package branch_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class BranchInfo implements BranchService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        ArrayList<BranchDTO> arr_BranchDTO = new BranchDAO().branchList();


        String name = request.getParameter("name");

        BranchDTO branchDTO = new BranchDAO().branchDetail(name);

        String [] facilities = branchDTO.getFacilities().split(",");

        request.setAttribute("facilities", facilities);

        request.setAttribute("branchDTO", branchDTO);

        request.setAttribute("mainUrl", "branch/branch_info.jsp");

    }
}