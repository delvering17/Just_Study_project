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
        height: 2000px;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    #main > div:first-of-type > input[type=button] {
        padding: 5px 3px 5px 3px;
        border-radius: 5px;
        border: 0;
        background: rgb(138, 169, 238);
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }

    #main > div:nth-of-type(2) {
        margin: 10px 0px 0px 0px;

    }

    #main > div:nth-of-type(2) > select {
        height: 25px;
        border-radius: 4px;
    }

    #main > div:nth-of-type(2) > button {
        width: 25px;
        height: 25px;
    }

    table {
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

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 50px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2),
    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(7),
    tr:first-of-type > th:nth-of-type(8) {
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(6) {
        width: 250px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
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
        $(".admin-store-delete").click(function (){
            alert($("input[name=branch]:checked").attr("id"))

        })
    }

</script>
<div class="wrapper">

    <div id="headline">
        <b>지점관리</b>
        <input type="button" class="admin-store-delete" value="선택삭제">
        <input type="button" class="admin-store-modify" value="선택수정">
        <input type="button" class="admin-store-insert" value="지점추가">
    </div>

    <div id="main">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>지역</th>
                <th>지점명</th>
                <th>룸 타입</th>
                <th>1시간 당 가격</th>
                <th>운영 시간</th>
                <th>매장 주소</th>
                <th>전화번호</th>
                <th>편의 시설</th>
                <th></th>
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
                <td><%=branchDTO.getName()%></td>
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
                <th><input type="radio" name="branch" id="<%=branchDTO.getName()%>"></th>
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