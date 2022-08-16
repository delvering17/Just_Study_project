<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    .admin-store-list-bg{
        width: 100%;
        height: fit-content;
    }

    #headline {
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

    #headline > b {
        width: 100px;
        font-size: 20px;
    }

    #headline > input {
        float: right;
        margin: 0px 10px 50px 0px;

    }

    #main {
        width: 2000px;
        height: fit-content;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    table {
        width: 60%;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    tr:first-of-type{
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }
</style>

<script type="text/javascript">
    window.onload = function (){
        $(".admin-store-insert").click(function (){
            location.href = "AdminStoreInsert"
        })
    }
</script>
<div class="admin-store-list-bg">

    <div id="headline">
        <b>지점관리</b>
        <input type="button" class="admin-store-insert" value="지점추가">
    </div>

    <div id="main">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>지역</th>
                <th>지점명</th>
                <th>룸타입</th>
                <th>1시간 당 가격</th>
                <th>운영 시간</th>
                <th>매장 주소</th>
                <th>전화번호</th>
                <th>편의 시설</th>
            </tr>

            <%
                LinkedHashMap<String, Integer> branchMap = (LinkedHashMap<String, Integer>) request.getAttribute("branchMap");
                ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");
                for (String city : branchMap.keySet()) {
                    if (branchMap.get(city) != 0) {%>
            <tr>
                <td rowspan="<%=branchMap.get(city) +1%>"><%=city%>
                </td>
            </tr>
            <%
                for (BranchDTO branchDTO : branchList) {
                    if (city.equals(branchDTO.getCity())) {
            %>
            <tr class="branch">
                <td><a href="AdminStoreDetail?branchName=<%=branchDTO.getName()%>"><%=branchDTO.getName()%></a></td>
                <td><%=(branchDTO.getRooms() != null ? branchDTO.getRooms().replaceAll(",", "<br/>") : "")%></td>
                <td><%=branchDTO.getPrice()%></td>
                <td>
                    <%
                        String openTime = (branchDTO.getOpen() > 9 ? "" : "0") + branchDTO.getOpen() + ":00";
                        String closeTime = (branchDTO.getClose() > 9 ? "" : "0") + branchDTO.getClose() + ":00";
                    %>
                    <%=openTime%> ~ <%=closeTime%>
                </td>
                <td><%=(branchDTO.getAddress() != null ? branchDTO.getAddress() : "")%></td>
                <td><%=(branchDTO.getPhone() != null ? branchDTO.getPhone() : "")%></td>
                <td><%=(branchDTO.getFacilities() != null ? branchDTO.getFacilities().replaceAll(",", "<br/>") : "")%></td>
            </tr>
            <%
                        }
                    }
                }
            %>
            <%}%>

        </table>
    </div>
</div>