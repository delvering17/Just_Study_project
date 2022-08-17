package mypageNonView_p;

import model_p.InquiryDAO;
import model_p.InquiryDTO;
import model_p.MemberDAO;
import model_p.MemberDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MypageInsertInquiryReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {


        HttpSession session = request.getSession();
        int mem_id = (int) session.getAttribute("login");

        int input_writer = Integer.parseInt(request.getParameter("input_writer"));
        String input_title = request.getParameter("input_title");
        String input_content = request.getParameter("input_content");
        String input_category = request.getParameter("input_category");
        String input_type = request.getParameter("input_type");
        String input_branch = request.getParameter("input_branch");


        // TODO - 유효성 검사 필요




        // 결과
        InquiryDTO inquiryDTO = new InquiryDTO();
        inquiryDTO.setInquiry_title(input_title);
        inquiryDTO.setInquiry_content(input_content);
        inquiryDTO.setInquiry_writer(input_writer);
        inquiryDTO.setInquiry_category(input_category);
        inquiryDTO.setInquiry_type(input_type);
        inquiryDTO.setInquiry_branch(input_branch);

        int inquiry_id = new InquiryDAO().userInsert(inquiryDTO);

        JSONObject jj = new JSONObject();

        try {


            jj.put("insertResult","success");
            jj.put("inquiry_id",inquiry_id);
            response.getWriter().append(jj.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
