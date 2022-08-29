<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">

    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-store-detail-table {
        height: 610px;
        border: 1px solid rgb(97, 88, 88);
        margin-bottom: 50px;
    }

    .admin-store-detail-table th {
        width: 80px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .admin-store-detail-table tr:nth-of-type(1),
    .admin-store-detail-table tr:nth-of-type(2),
    .admin-store-detail-table tr:nth-of-type(4),
    .admin-store-detail-table tr:nth-of-type(5),
    .admin-store-detail-table tr:nth-of-type(6),
    .admin-store-detail-table tr:nth-of-type(7),
    .admin-store-detail-table tr:nth-of-type(9),
    .admin-store-detail-table tr:nth-of-type(8) {
        height: 60px;
    }

    .admin-store-detail-table tr:nth-of-type(3),
    .admin-store-detail-table tr:nth-of-type(10) {
        height: 165px;
    }

    .admin-store-detail-table td {
        width: 400px;
        padding: 5px 0px 5px 10px;
        font-size: 13px;
        border: 1px solid rgb(97, 88, 88);
    }

</style>

<%
    BranchDTO branchDTO = (BranchDTO) request.getAttribute("branchDTO");
%>
<div id="main">
    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-detail-table">
        <tr>
            <th>지역</th>
            <td><%=branchDTO.getCity()%>
            </td>
        </tr>
        <tr>
            <th>지점명</th>
            <td><%=branchDTO.getName()%>
            </td>
        </tr>
        <tr>
            <th>룸타입</th>
            <td><%=branchDTO.getRooms().replaceAll(",", "</br>")%>
            </td>
        </tr>
        <tr>
            <th>이용요금<br/>(1시간)</th>
            <td><%=branchDTO.getPrice()%>원</td>
        </tr>
        <tr>
            <th>운영 시간</th>
            <td>
                <%
                    String openTime = (branchDTO.getOpen() > 9 ? "" : "0") + branchDTO.getOpen() + ":00";
                    String closeTime = (branchDTO.getClose() > 9 ? "" : "0") + branchDTO.getClose() + ":00";
                %>
                <%=openTime%> ~ <%=closeTime%>
            </td>
        </tr>
        <tr>
            <th>매장 주소</th>
            <td><%=branchDTO.getAddress()%>
            </td>
        </tr>
        <tr>
            <th>상세 주소</th>
            <td><%=branchDTO.getAddressDetail()%>
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><%=branchDTO.getPhone()%>
            </td>
        </tr>
        <tr>
            <th>매장 사진</th>
            <td><%=branchDTO.getImg()%>
            </td>
        </tr>
        <tr>
            <th>편의 시설</th>
            <td><%=branchDTO.getFacilities().replaceAll(",", "</br>")%>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">

    $(".admin-template-header>b").html("지점 목록 > 지점 상세보기")
    $(".admin-template-header>div").append("<input type=button class='admin-store-modify' value='수정'/>")
    $(".admin-template-header>div").append("<input type=button class='admin-store-delete' value='삭제'/>")


    $(".admin-store-list").click(function () {
        location.href = "AdminStoreList"
    })

    $(".admin-store-modify").click(function () {
        location.href = "AdminStoreModify?branchName=<%=request.getParameter("branchName")%>"
    })

    $(".admin-store-delete").click(function () {
        if (confirm("<%=branchDTO.getName()%>: 정말 삭제하시겠습니까?")) {
            location.href = "AdminStoreDelete?branchName=<%=branchDTO.getName()%>"
        }
    })


</script>
