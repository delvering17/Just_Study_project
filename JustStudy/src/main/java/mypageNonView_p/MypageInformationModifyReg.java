package mypageNonView_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageInformationModifyReg implements MypageNonViewService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("회원정보 수정 reg");

    }
}
