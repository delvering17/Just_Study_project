package admin_p;

import model_p.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class AdminInquiryList implements AdminService{

    public void execute(HttpServletRequest request, HttpServletResponse response){


        ArrayList<InquiryDTO> arr_inquiryDTO = new InquiryDAO().inquiryList();

        request.setAttribute("arr_inquiryDTO", arr_inquiryDTO);


        ArrayList<BranchDTO> branchList = new BranchDAO().branchList();
        request.setAttribute("branchList", branchList);

        request.setAttribute("adminUrl","adminInquiryList.jsp");
    }
}
