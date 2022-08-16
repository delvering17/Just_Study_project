package branch_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BranchFind implements BranchService{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {



        request.setAttribute("mainUrl", "branch/branch_findBranch.jsp");

    }
}
