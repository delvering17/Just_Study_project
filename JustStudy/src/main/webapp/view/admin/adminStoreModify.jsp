<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
<%
    if(request.getAttribute("msg") != null){%>
        alert("<%=request.getAttribute("msg")%>")
  <%}%>
</script>

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
        height: 730px;
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
    .admin-store-modify-table tr:nth-of-type(7),
    .admin-store-modify-table tr:nth-of-type(9),
    .admin-store-modify-table tr:nth-of-type(8) {
        height: 7%;
    }

    .admin-store-modify-table tr:nth-of-type(3),
    .admin-store-modify-table tr:nth-of-type(10) {
        height: 22%;
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
    .admin-store-modify-table tr:nth-of-type(9) input[type=text] {
        width: 90px;
        height: 25px;
    }

    .admin-store-modify-table tr:nth-of-type(5) input[type=text] {
        width: 30px;
    }

    .admin-store-modify-table tr:nth-of-type(6) input[type=text],
    .admin-store-modify-table tr:nth-of-type(7) input[type=text] {
        width: 300px;
    }

    .admin-store-modify-table p {
        width: fit-content;
        height: 25px;
        line-height: 25px;
        float: left;
    }

    .admin-store-modify-table tr:nth-of-type(3) > td > div {
        height: 25px;
        line-height: 25px;
        margin-bottom: 7px;
    }

    .admin-store-modify-table tr:nth-of-type(3) > td > div > div {
        width: 100px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

    .admin-store-modify-table tr:nth-of-type(3) > td > div > input[type=text] {
        width: 20px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

    .admin-store-modify-table tr:last-of-type div {
        width: 100px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

    .admin-store-modify-table tr:nth-of-type(3) input[type=button] {
        width: 25px;
        height: 25px;
        clear: right;
    }

</style>

<%
    BranchDTO branchDTO = (BranchDTO) request.getAttribute("branchDTO");
%>


<div id="headline">
    <b>지점관리 > 지점 수정</b>
    <input type="button" class="admin-store-list" value="목록으로">
    <input type="button" class="admin-store-save" value="저장">
</div>


<div id="main">
    <form action="AdminStoreModifyReg" method="post" enctype="multipart/form-data" class="admin-store-modify-form">
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
                    <%
                        for (String room : "4인실,6인실,8인실,대회의실".split(",")) { %>
                    <div>
                        <%if(branchDTO.getRooms().contains(room)){%>
                            <input type="checkbox" name="roomType" value="<%=room%>" checked/>
                    <%} else{%>
                            <input type="checkbox" name="roomType" value="<%=room%>"/>
                        <%}%>
                        <%
                            int cnt = 0;
                            if(!branchDTO.getRooms().equals("")) {
                                for (String dtoRoom : branchDTO.getRooms().split(",")) {
                                    if (dtoRoom.contains(room)) {
                                        cnt++;
                                    }
                                }
                            }
                        %>
                        <div><%=room%></div>
                        <%if (branchDTO.getRooms().contains(room)) {%>
                            <input type="button" name="roomMinus" value="-"/>
                            <input type="text" name="roomNum" value="<%=cnt%>" readonly>
                            <input type="button" name="roomPlus" value="+"/>
                        <%} else {%>
                            <input type="button" name="roomMinus" value="-" disabled/>
                            <input type="text" name="roomNum" value="<%=cnt%>" disabled readonly>
                            <input type="button" name="roomPlus" value="+" disabled/>
                        <%}%>

                    </div>

                    <%}%>

                </td>
            </tr>
            <tr>
                <th>이용요금<br/>(1시간)</th>
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
                           value="<%=branchDTO.getAddress() != null ? branchDTO.getAddress() : ""%>"/>
                    <input type="button" name="address-search" value="검색"/></td>
            </tr>
            <tr>
                <th>상세 주소</th>
                <td><input type="text" name="addressDetail"
                           value="<%=branchDTO.getAddressDetail() != null ? branchDTO.getAddressDetail() : ""%>"/></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="phone"
                           value="<%=branchDTO.getPhone() != null ? branchDTO.getPhone() : ""%>"/></td>
            </tr>
            <tr>
                <th>매장 사진</th>
                <%if (!branchDTO.getImg().equals(null)) {%>
                        <td>
                            <%=branchDTO.getImg()%>
                            <input type="button" value="파일 삭제" class="imgDelete"/>
                            <input type="hidden" name="img" value="<%=branchDTO.getImg()%>"/>
                        </td>
                <%} else{%>
                    <td><input type="file" name="img"></td>
                 <%}%>

            </tr>
            <tr>
                <th>편의 시설</th>
                <td>
                    <%for (String facility : "정수기,휴게실,흡연실,프린터,빔프로젝터,컴퓨터,주차,와이파이".split(",")) {%>
                    <%if (branchDTO.getFacilities().contains(facility)) {%>
                        <div><input type="checkbox" name="facilities" value="<%=facility%>" checked><%=facility%></div>
                    <%} else {%>
                        <div><input type="checkbox" name="facilities" value="<%=facility%>"><%=facility%></div>
                    <%}%>
                    <%}%>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
        $("input[name=roomType]").change(function (){
            $(this).parent().children("input[name=roomNum]").attr("disabled", !$(this).parent().children("input[name=roomNum]").attr("disabled"));
            $(this).parent().children("input[type=button]").attr("disabled", !$(this).parent().children("input[type=button]").attr("disabled"))

        })

        $("input[name=roomMinus]").click(function () {
            if($(this).parent().children("input[name=roomNum]").val() > 0){
                $(this).parent().children("input[name=roomNum]").val($(this).parent().children("input[name=roomNum]").val()-1)
            }
        })

        $("input[name=roomPlus]").click(function () {
            $(this).parent().children("input[name=roomNum]").val(parseInt($(this).parent().children("input[name=roomNum]").val())+1)
        })

        $(".admin-store-list").click(function () {
            location.href = "AdminStoreList"
        })

        $(".admin-store-save").click(function () {
            $("form").submit()
        })

        $(".imgDelete").click(function (){
            if(confirm("정말 삭제하시겠습니까?")){
                $(".admin-store-modify-form").attr("action", "AdminStoreImgDelete")
                $(".admin-store-modify-form").submit()
            }
        })


</script>