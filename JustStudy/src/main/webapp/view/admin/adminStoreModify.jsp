<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        width: 1100px;
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

<div class="admin-store-modify-bg">
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
                            <%if (branchDTO.getRooms().contains(room)) {%>
                            <input type="checkbox" name="roomType" value="<%=room%>" checked/>
                            <%} else {%>
                            <input type="checkbox" name="roomType" value="<%=room%>"/>
                            <%}%>
                            <%
                                int cnt = 0;
                                if (!branchDTO.getRooms().equals("")) {
                                    for (String dtoRoom : branchDTO.getRooms().split(",")) {
                                        if (dtoRoom.contains(room)) {
                                            cnt++;
                                        }
                                    }
                                }
                            %>
                            <div><%=room%>
                            </div>
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
                        <select name="open">
                            <c:forEach var="i" begin="0" end="24" step="1">
                                <c:if test="${branchDTO.open == i}">
                                    <option selected>${i}</option>
                                </c:if>
                                <option>${i}</option>
                            </c:forEach>
                        </select>
                        :00 ~
                        <select name="close">
                            <c:forEach var="i" begin="0" end="24" step="1">
                                <c:if test="${branchDTO.close == i}">
                                    <option selected>${i}</option>
                                </c:if>
                                <option>${i}</option>
                            </c:forEach>
                        </select>
                        :00
                    </td>
                </tr>
                <tr>
                    <th>매장 주소</th>
                    <td><input type="text" id="input-address1" name="address" readonly
                               value="<%=branchDTO.getAddress() != null ? branchDTO.getAddress() : ""%>"/>
                        <input type="button" name="address-search" onclick="gofindAddress()" value="검색"/></td>
                </tr>
                <tr>
                    <th>상세 주소</th>
                    <td><input type="text" id="input-address2" name="addressDetail"
                               value="<%=branchDTO.getAddressDetail() != null ? branchDTO.getAddressDetail() : ""%>"/>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" name="phone"
                               value="<%=branchDTO.getPhone() != null ? branchDTO.getPhone() : ""%>"/></td>
                </tr>
                <tr>
                    <th>매장 사진</th>
                    <%if (!branchDTO.getImg().equals("")) {%>
                    <td>
                        <%=branchDTO.getImg()%>
                        <input type="button" value="파일 삭제" class="imgDelete"/>
                        <input type="hidden" name="img" value="<%=branchDTO.getImg()%>"/>
                    </td>
                    <%} else {%>
                    <td><input type="file" name="img"></td>
                    <%}%>

                </tr>
                <tr>
                    <th>편의 시설</th>
                    <td>
                        <%for (String facility : "정수기,휴게실,흡연실,프린터,빔프로젝터,컴퓨터,주차,와이파이".split(",")) {%>
                        <%if (branchDTO.getFacilities().contains(facility)) {%>
                        <div><input type="checkbox" name="facilities" value="<%=facility%>" checked><%=facility%>
                        </div>
                        <%} else {%>
                        <div><input type="checkbox" name="facilities" value="<%=facility%>"><%=facility%>
                        </div>
                        <%}%>
                        <%}%>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $("input[name=roomType]").change(function () {
        $(this).parent().children("input[name=roomNum]").attr("disabled", !$(this).parent().children("input[name=roomNum]").attr("disabled"));
        $(this).parent().children("input[type=button]").attr("disabled", !$(this).parent().children("input[type=button]").attr("disabled"))

    })

    $("input[name=roomMinus]").click(function () {
        if ($(this).parent().children("input[name=roomNum]").val() > 0) {
            $(this).parent().children("input[name=roomNum]").val($(this).parent().children("input[name=roomNum]").val() - 1)
        }
    })

    $("input[name=roomPlus]").click(function () {
        $(this).parent().children("input[name=roomNum]").val(parseInt($(this).parent().children("input[name=roomNum]").val()) + 1)
    })

    $(".admin-store-list").click(function () {
        location.href = "AdminStoreList"
    })

    $(".admin-store-save").click(function () {

        let form_data = {
            input_branchName: $("input[name=branchName]").val(),
            input_roomType: $("input[name=roomType]:checked").length,
            input_price: $("input[name=price]").val(),
            input_open: $("select[name=open]").val(),
            input_close: $("select[name=close]").val(),
            input_address: $("input[name=address]").val(),
            input_addressDetail: $("input[name=addressDetail]").val(),
            input_phone: $("input[name=phone]").val(),
            input_img: $("input[name=img]").val(),
            input_facilities: $("input[name=facilities]:checked").length
        }

        let nullCheck = true;
        big:for (let i in form_data) {
            switch (i) {
                case "input_branchName":
                    if (form_data[i].trim() == "") {
                        alert("지점명을 입력해주세요.")
                        nullCheck = false;
                        break big;
                    }
                    break;
                case "input_roomType":
                    if (form_data[i] == 0) {
                        alert("룸타입과 개수를 선택해주세요.")
                        nullCheck = false;
                        break big;
                    }
                    break;
                case "input_price":
                    if (form_data[i].trim() == "") {
                        alert("이용요금을 입력해주세요.")
                        nullCheck = false;
                        break big;
                    } else {
                        if (isNaN(form_data[i].trim())) {
                            alert("숫자를 입력해주세요.")
                            nullCheck = false;
                            break big;
                        }
                    }
                    break;
                case "input_open":
                case "input_close":
                    if (parseInt(form_data["input_open"]) >= parseInt(form_data["input_close"])) {
                        alert("마감시간은 오픈시간보다 빠를 수 없습니다.")
                        nullCheck = false;
                        break big;
                    }
                    break;
                case "input_address":
                case "input_addressDetail":
                    if (form_data[i].trim() == "") {
                        alert("주소를 입력해주세요.")
                        nullCheck = false;
                        break big;
                    }
                    break;
                case "input_phone":
                    if (form_data[i].trim() == "") {
                        alert("전화번호를 입력해주세요.")
                        nullCheck = false;
                        break big;
                    } else {
                        if (!form_data[i].match(/\d{2,3}-\d{3,4}-\d{4}/g)) {
                            alert("전화번호의 형식이 올바르지 않습니다.\n(ex: 00(0)-111(1)-2222)")
                            nullCheck = false;
                            break big;
                        }
                    }
                    break;
                case "input_img":
                    if (form_data[i].trim() == "") {
                        alert("매장 사진을 업로드해주세요.")
                        nullCheck = false;
                        break big;
                    } else {
                        if (!form_data[i].match(".*[.](jpeg|jpg|bmp|png|gif|pdf)")) {
                            alert("이미지 파일만 업로드 가능합니다.")
                            break big;
                        }
                    }
                    break;
                case "input_facilities":
                    if (form_data[i] == 0) {
                        alert("편의시설 종류를 선택해주세요.")
                        nullCheck = false;
                        break big;
                    }
                    break;
            }
        }

        if (nullCheck) {
            $.ajax({
                url: '<c:url value="/nonView/CheckBranchName"/>',
                type: "GET",
                async: false,
                data: "branchName=" + $("input[name=branchName]").val(),
                success: function (data) {
                    if (data == "0") {
                        $("form").submit()
                    } else if (data == "1") {
                        alert("중복된 지점명 입니다.")
                    }
                },
                error: function (e) {
                    console.log(e.responseText)
                }
            })
        }
    })

    $(".imgDelete").click(function () {
        if (confirm("정말 삭제하시겠습니까?")) {
            $(".admin-store-modify-form").attr("action", "AdminStoreImgDelete")
            $(".admin-store-modify-form").submit()
        }
    })

    function gofindAddress() {

        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("input-address1").value = data.address;
                document.getElementById("input-address2").focus();
            }
        }).open();

    }

</script>