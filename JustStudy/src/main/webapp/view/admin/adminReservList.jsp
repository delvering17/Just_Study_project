<%@ page import="model_p.AdminReservDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-17
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .admin-reserv-list-bg{
        width: 100%;
        height: fit-content;
    }

    .admin-reserv-list-headline {
        width: 1330px;
        height: 40px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-top: 15px;
        padding-left: 20px;
        margin-top: 50px;
        margin-left: 239px;
        position: fixed;
        flex-direction: row;
    }

    .admin-reserv-list-headline > b {
        width: 100px;
        font-size: 20px;
    }

    .admin-reserv-list-main{
        width: 2000px;
        height: fit-content;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    .admin-reserv-list-table {
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
        table-layout: fixed;
        word-break: break-all;
    }

    .admin-reserv-list-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-reserv-list-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding: 5px 20px 5px 20px;
    }

    .admin-reserv-list-table tr:first-of-type{
        height: 50px;
        padding: 10px;
        color: white;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-reserv-list-table tr:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726);
    }

</style>

<div class="admin-reserv-list-bg">

    <div class="admin-reserv-list-headline">
        <b>예약 목록</b>
    </div>

    <div class="admin-reserv-list-main">

        <div>
            <form action="AdminReserv">
                <select name="admin-reserv-list-search">
                    <option>주문번호</option>
                    <option>주문일자</option>
                    <option>사용자ID</option>
                    <option>사용자이름</option>
                    <option>지역</option>
                    <option>지점</option>
                    <option>룸타입</option>
                    <option>이용일자</option>
                    <option>시간</option>
                    <option>상태</option>
                </select>
                <input type="text">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-reserv-list-table">
            <tr>
                <th>ID</th>
                <th>주문번호</th>
                <th>주문일자</th>
                <th>사용자ID</th>
                <th>사용자이름</th>
                <th>지역</th>
                <th>지점</th>
                <th>룸타입</th>
                <th>이용일자</th>
                <th>시간</th>
                <th>인원수</th>
                <th>결제금액</th>
                <th>상태</th>
            </tr>

            <%
                ArrayList<AdminReservDTO> totalList = (ArrayList<AdminReservDTO>) request.getAttribute("totalList");

                for(AdminReservDTO adminReservDTO : totalList){%>
                    <tr>
                        <td><%=adminReservDTO.getId()%></td>
                        <td><%=adminReservDTO.getOrderId()%></td>
                        <td><%=adminReservDTO.getResDate()%></td>
                        <td><%=adminReservDTO.getMem_userid()%></td>
                        <td><%=adminReservDTO.getMem_realname()%></td>
                        <td><%=adminReservDTO.getCity()%></td>
                        <td><%=adminReservDTO.getBranch()%></td>
                        <td><%=adminReservDTO.getRoom()%></td>
                        <td><%=adminReservDTO.getUseDate()%></td>
                        <td><%=adminReservDTO.getTime()%></td>
                        <td><%=adminReservDTO.getHeadcount()%></td>
                        <td><%=adminReservDTO.getPay()%></td>
                        <td><%=adminReservDTO.getStatus()%></td>
                    </tr>
              <%}%>
        </table>
    </div>
</div>