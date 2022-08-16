<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
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

    .admin-store-modify-table {
        height: 700px;
        border: 1px solid rgb(97, 88, 88);
        margin-top: 10px;
    }

    .admin-store-modify-table > tbody > tr > th {
        width: 80px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-store-modify-table tr:nth-of-type(1),
    .admin-store-modify-table tr:nth-of-type(2),
    .admin-store-modify-table tr:nth-of-type(4),
    .admin-store-modify-table tr:nth-of-type(5),
    .admin-store-modify-table tr:nth-of-type(6),
    .admin-store-modify-table tr:nth-of-type(7) {
        height: 7%;
    }

    .admin-store-modify-table tr:nth-of-type(3),
    .admin-store-modify-table tr:nth-of-type(8) {
        height: 29%;
    }

    .admin-store-modify-table th {
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .admin-store-modify-table td {
        width: 400px;
        padding: 5px 0px 5px 10px;
        font-size: 13px;
        border: 1px solid rgb(97, 88, 88);
    }

    .admin-store-modify-table tr input[type=text] {
        height: 30px;
        padding-left: 5px;
        border: 1px solid rgb(184, 177, 177);
    }

    .admin-store-modify-table tr:nth-of-type(3) input[type=text],
    .admin-store-modify-table tr:nth-of-type(8) input[type=text] {
        width: 90px;
        height: 25px;
    }

    .admin-store-modify-table tr:nth-of-type(5) input[type=text] {
        width: 30px;
    }

    .admin-store-modify-table tr:nth-of-type(6) input[type=text] {
        width: 300px;
    }

    .admin-store-modify-table p {
        width: fit-content;
        height: 25px;
        line-height: 25px;
        float: left;
    }

    .admin-store-modify-table div {
        width: fit-content;
        height: fit-content;
        display: inline-block;
    }

    select[name=roomTypeSelect] {
        width: 80px;
        height: 25px;
        margin: 0px 10px 5px 10px;
    }

    select[name=facilitiesSelect] {
        width: 60px;
        height: 25px;
        margin: 0px 10px 5px 10px;
    }

    .admin-store-modify-table input[type=button] {
        width: 25px;
        height: 25px;
        clear: right;
    }

    .admin-store-modify-room-plus {
        display: block;
    }

</style>

<script type="text/javascript">
    window.onload = function () {
        $(".admin-store-list").click(function () {
            location.href = "AdminStoreList"
        })

        $(".admin-store-modify").click(function () {
            location.href = "AdminStoreModify?branchName=<%=request.getParameter("branchName")%>"
        })
    }
</script>


<%
    BranchDTO branchDTO = (BranchDTO) request.getAttribute("branchDTO");
%>

<script>
    window.onload = function () {

        $("select[name=roomTypeSelect]").change(function () {

            $("input[name=roomType]").eq($(this).index("select[name=roomTypeSelect]")).val($(this).children("option:selected").attr("name"))
        })

        $("select[name=facilitiesSelect]").change(function () {
            if ($(this).val() == "X") {
                $("input[class=facilities]").eq($(this).index("select[name=facilitiesSelect]")).attr("name", "facilitiesX")
            } else {
                $("input[class=facilities]").eq($(this).index("select[name=facilitiesSelect]")).attr("name", "facilitiesO")
            }
        })

        $(".admin-store-save").click(function (){
            $("form").submit()
        })
    }

</script>

<div id="headline">
    <b>지점관리 > 지점 수정</b>
    <input type="button" class="admin-store-list" value="목록으로">
    <input type="button" class="admin-store-save" value="저장">
</div>


<div id="main">
    <form action="AdminStoreModifyReg" method="post">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-modify-table">
            <tr>
                <th>지역</th>
                <td><input type="text" name="cityName" value="<%=branchDTO.getCity()%>" readonly/></td>
            </tr>
            <tr>
                <th>지점명</th>
                <td><input type="text" name="branchName" value="<%=branchDTO.getName()%>" readonly/></td>
            </tr>
            <tr>
                <th>룸타입</th>
                <td>
                    <%for (int i = 0; i < branchDTO.getRooms().split(",").length; i++) {%>
                    <div>
                        <p>룸<%=i + 1%>) <input type="text" name="roomType"
                                               value="<%=branchDTO.getRooms().split(",")[i].split(" ")[1]%>" readonly>
                        </p>
                        <select name="roomTypeSelect">
                            <option name="<%=branchDTO.getRooms().split(",")[i].split(" ")[1]%>">변경안함</option>
                            <option name="4인실">4인실</option>
                            <option name="6인실">6인실</option>
                            <option name="8인실">8인실</option>
                            <option name="대회의실">대회의실</option>
                        </select>
                        <input type="button" class="admin-store-modify-room-minus" value="-"/>
                    </div>
                    <%}%>
                    <input type="button" class="admin-store-modify-room-plus" value="+"/>
                </td>
            </tr>
            <tr>
                <th>가격(1시간)</th>
                <td><input type="text" name="price" value="<%=branchDTO.getPrice()%>"/>원</td>
            </tr>
            <tr>
                <th>운영 시간</th>
                <td>
                    <input type="text" name="open" value="<%=branchDTO.getOpen()%>">
                    :00 ~
                    <input type="text" name="close" value="<%=branchDTO.getClose()%>">
                    :00
                </td>
            </tr>
            <tr>
                <th>매장 주소</th>
                <td><input type="text" name="address"
                           value="<%=branchDTO.getAddress() != null ? branchDTO.getAddress() : ""%>"/></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="phone"
                           value="<%=branchDTO.getPhone() != null ? branchDTO.getPhone() : ""%>"/></td>
            </tr>
            <tr>
                <th>편의 시설</th>
                <td>
                    <%for (String facility : "정수기,휴게실,흡연실,프린터,빔프로젝터,컴퓨터,주차,와이파이".split(",")) {%>
                    <%if (branchDTO.getFacilities().contains(facility)) {%>
                    <input type="text" name="facilitiesO" class="facilities" value="<%=facility%>" readonly>
                    <select name="facilitiesSelect">
                        <option name="O" selected>O</option>
                        <option name="X">X</option>
                    </select>
                    <%} else {%>
                    <input type="text" name="facilitiesX" class="facilities" value="<%=facility%>" readonly>
                    <select name="facilitiesSelect">
                        <option name="O">O</option>
                        <option name="X" selected>X</option>
                    </select>
                    <%}%>
                    <%}%>
                </td>
            </tr>
        </table>
    </form>
</div>