<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

    .admin-store-insert-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-store-insert-table {
        height: 730px;
        border: 1px solid rgb(97, 88, 88);
    }

    .admin-store-insert-table > tbody > tr > th {
        width: 80px;
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-store-insert-table tr:nth-of-type(1),
    .admin-store-insert-table tr:nth-of-type(2),
    .admin-store-insert-table tr:nth-of-type(4),
    .admin-store-insert-table tr:nth-of-type(5),
    .admin-store-insert-table tr:nth-of-type(6),
    .admin-store-insert-table tr:nth-of-type(7),
    .admin-store-insert-table tr:nth-of-type(9),
    .admin-store-insert-table tr:nth-of-type(8) {
        height: 7%;
    }

    .admin-store-insert-table tr:nth-of-type(3),
    .admin-store-insert-table tr:nth-of-type(10) {
        height: 22%;
    }

    .admin-store-insert-table th {
        padding: 10px;
        background: rgba(83, 104, 167, 0.856);
        color: white;
    }

    .admin-store-insert-table td {
        width: 400px;
        padding: 5px 0px 5px 10px;
        font-size: 13px;
        border: 1px solid rgb(97, 88, 88);
    }

    .admin-store-insert-table tr input[type=text] {
        height: 30px;
        padding-left: 5px;
        border: 1px solid rgb(184, 177, 177);
    }

    .admin-store-insert-table tr:nth-of-type(3) input[type=text],
    .admin-store-insert-table tr:nth-of-type(9) input[type=text] {
        width: 90px;
        height: 25px;
    }

    .admin-store-insert-table tr:nth-of-type(5) input[type=text] {
        width: 30px;
    }

    .admin-store-insert-table tr:nth-of-type(6) input[type=text],
    .admin-store-insert-table tr:nth-of-type(7) input[type=text] {
        width: 300px;
    }

    .admin-store-insert-table p {
        width: fit-content;
        height: 25px;
        line-height: 25px;
        float: left;
    }

    .admin-store-insert-table div {
        width: fit-content;
        height: fit-content;
        display: inline-block;
    }

    select[name=cityName] {
        width: 80px;
        height: 25px;
    }

    .admin-store-insert-table tr:nth-of-type(3) > td > div {
        height: 25px;
        line-height: 25px;
        margin-bottom: 7px;
    }

    .admin-store-insert-table tr:nth-of-type(3) > td > div > div {
        width: 100px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

    .admin-store-insert-table tr:nth-of-type(3) > td > div > input[type=text] {
        width: 20px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

    .admin-store-insert-table tr:nth-of-type(3) input[type=button] {
        width: 25px;
        height: 25px;
        clear: right;
    }

    input[name=address-search] {
        width: 40px;
        height: 25px;
    }

    .admin-store-insert-table tr:last-of-type div {
        width: 100px;
        height: 25px;
        line-height: 25px;
        display: inline-block;
    }

</style>

<div class="admin-store-insert-main">
    <form action="AdminStoreInsertReg" method="post" enctype="multipart/form-data">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-insert-table">
            <tr>
                <th>지역</th>
                <td>
                    <select name="cityName">
                        <option>서울</option>
                        <option>경기</option>
                        <option>부산</option>
                        <option>대구</option>
                        <option>인천</option>
                        <option>광주</option>
                        <option>대전</option>
                        <option>울산</option>
                        <option>세종</option>
                        <option>강원</option>
                        <option>충북</option>
                        <option>충남</option>
                        <option>전북</option>
                        <option>전남</option>
                        <option>경북</option>
                        <option>경남</option>
                        <option>제주</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>지점명</th>
                <td><input type="text" name="branchName"/></td>
            </tr>
            <tr>
                <th>룸타입</th>
                <td>
                    <%
                        for (String room : "4인실,6인실,8인실,대회의실".split(",")) { %>
                    <div>
                        <input type="checkbox" name="roomType" value="<%=room%>"/>
                        <div><%=room%>
                        </div>
                        <input type="button" name="roomMinus" value="-" disabled/>
                        <input type="text" name="roomNum" value="1" disabled readonly>
                        <input type="button" name="roomPlus" value="+" disabled/>
                    </div>

                    <%}%>

                </td>
            </tr>
            <tr>
                <th>이용요금<br/>(1시간)</th>
                <td><input type="text" name="price"/>원</td>
            </tr>
            <tr>
                <th>운영 시간</th>
                <td>
                    <select name="open">
                        <c:forEach var="i" begin="0" end="24" step="1">
                            <option>${i}</option>
                        </c:forEach>
                    </select>
                    :00 ~
                    <select name="close">
                        <c:forEach var="i" begin="0" end="24" step="1">
                            <option>${i}</option>
                        </c:forEach>
                    </select>
                    :00
                </td>
            </tr>
            <tr>
                <th>매장 주소</th>
                <td>
                    <input type="text" id="input-address1" name="address" readonly/>
                    <input type="button" name="address-search" onclick="gofindAddress()" value="검색"/>
                </td>
            </tr>
            <tr>
                <th>상세 주소</th>
                <td><input type="text" id="input-address2" name="addressDetail"/></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="phone"/></td>
            </tr>
            <tr>
                <th>매장 사진</th>
                <td><input type="file" name="img"></td>
            </tr>
            <tr>
                <th>편의 시설</th>
                <td>
                    <%for (String facility : "정수기,휴게실,흡연실,프린터,빔프로젝터,컴퓨터,주차,와이파이".split(",")) {%>
                    <div><input type="checkbox" name="facilities" value="<%=facility%>"><%=facility%>
                    </div>
                    <%}%>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    $(".admin-template-header>b").html("지점 목록 > 지점 추가")
    $(".admin-template-header>div").append("<input type=button class='admin-store-save' value='저장'/>")
    $(".admin-template-header>div").append("<input type=button class='admin-store-list' value='목록으로'/>")


    $(".admin-store-list").click(function () {
        location.href = "AdminStoreList"
    })

    $(".admin-store-insert").click(function () {
        location.href = "AdminStoreInsertReg?branchName=<%=request.getParameter("branchName")%>"
    })
    $("input[name=roomType]").change(function () {
        $(this).parent().children("input[name=roomNum]").attr("disabled", !$(this).parent().children("input[name=roomNum]").attr("disabled"))
        $(this).parent().children("input[type=button]").attr("disabled", !$(this).parent().children("input[type=button]").attr("disabled"))
    })

    $("input[name=roomMinus]").click(function () {
        if ($(this).parent().children("input[name=roomNum]").val() > 1) {
            $(this).parent().children("input[name=roomNum]").val($(this).parent().children("input[name=roomNum]").val() - 1)
        }
    })

    $("input[name=roomPlus]").click(function () {
        $(this).parent().children("input[name=roomNum]").val(parseInt($(this).parent().children("input[name=roomNum]").val()) + 1)
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

    $(".admin-store-list").click(function () {
        location.href = "AdminStoreList"
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