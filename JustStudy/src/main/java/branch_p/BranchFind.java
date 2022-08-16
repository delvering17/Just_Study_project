package branch_p;

import model_p.BranchDAO;
import model_p.BranchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class BranchFind implements BranchService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        ArrayList<BranchDTO> arr_BranchDTO = new BranchDAO().branchList();



        request.setAttribute("arr_BranchDTO", arr_BranchDTO);

        request.setAttribute("mainUrl", "branch/branch_findBranch.jsp");

    }
}
