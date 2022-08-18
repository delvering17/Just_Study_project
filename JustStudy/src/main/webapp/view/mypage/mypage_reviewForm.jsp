<%@ page import="model_p.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오전 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .mypage-review-bg .mypage-review-table td {
        width: fit-content;
        height: fit-content;
    }

</style>

<div class="mypage-review-bg">
    <form action="MypageReviewInsert" method="post">

        <table class="mypage-review-table" border="">
            <tr>
                <td>작성자</td>
                <td>
                    <input type="hidden" name="memId"
                           value="<%=((MemberDTO) request.getAttribute("memberDTO")).getMem_id()%>">
                    <%=((MemberDTO) request.getAttribute("memberDTO")).getMem_userid()%>
                </td>
            </tr>
            <tr>
                <td>주문번호</td>
                <input type="hidden" name="reservId" value="<%=request.getAttribute("reservId")%>">
                <td><%=request.getAttribute("reservId")%>
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="reviewContent" cols="20" rows="5"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="저장"/>
                </td>
            </tr>
        </table>

    </form>
</div>