<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>
<form name="frmJoin" action=" CommunityInsertReg" method="post" onsubmit="return CheckForm(this)">

    <table>
        <tr>
            <td>지역</td>
            <td colspan="3">
                <select id="location_01" name="location" class="local-selector">
                    <option value="">지점 선택</option>
                    <c:forEach items="${branchList}" var="branch" varStatus="no">
                        <option value="${branch.name}">${branch.name}</option>
                    </c:forEach>
                </select></td>
        </tr>
        <tr>
            <td>스터디 기간</td>
            <td><input type="date" id="Date-start" name="startdate"></td>
            <td> ~ <input type="date" id="Date-end" name="enddate"></td>
            <td></td>
        </tr>
        <tr>
            <td>타이틀</td>
            <td colspan="3"><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>작성자</td>
            <input type="hidden" name="memId" value="${memberDTO.mem_id}"/>
            <td colspan="3"><input type="text" name="nickname" value="${memberDTO.mem_nickname}" readonly></td>
        </tr>
        <tr>
            <td>모집인원</td>
            <td colspan="3"><input type="number" name="people"> 명</td>

        </tr>
        <tr>
            <td>스터디 구분</td>
            <td colspan="3">
                <input type="checkbox" name="studykind" id="all" value="all" data-cate="0" onclick="validate()" >
                <label for="all">전체</label>
                <input type="checkbox" name="studykind" id="cate_0" value="IT" data-cate="IT" onclick="validate()" >
                <label for="cate_0">IT</label>
                <input type="checkbox" name="studykind" id="cate_1" value="토익" data-cate="토익" onclick="validate()">
                <label for="cate_1">토익</label>
                <input type="checkbox" name="studykind" id="cate_2" value="자격증" data-cate="자격증" onclick="validate()">
                <label for="cate_2">자격증</label>
                <input type="checkbox" name="studykind" id="cate_3" value="기타" data-cate="기타" onclick="validate()">
                <label for="cate_3">기타</label>
               </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
        </tr>
        <tr>
            <td>오픈채팅 URL</td>
            <td colspan="3"><input type="text" name="openChatting"/></td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox" name="agree" id="agree" value="">
                <label for="agree">개인정보취급방침을 읽었으며 이에 동의합니다.</label></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit" value="등록"></td>
        </tr>
    </table>

</form>

<script>
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("Date-start").setAttribute("min", today);
    document.getElementById("Date-end").setAttribute("min", today);
/*    var aa =  document.getElementById("Date-start").setAttribute("min", today);
    var bb =  document.getElementById("Date-end").setAttribute("min", today);*/


    function CheckForm(Join) {

        const f = document.frmJoin;


        if (f.location.value == "") {
            alert("지점 선택을 해주세요.");
            f.location.focus();
            return false;
        }

        if (f.startdate.value == "") {
            alert("시작 기간을 입력해주세요.");
            f.startdate.focus();
            return false;
        }
        if (f.enddate.value == "") {
            alert("종료 기간을 입력해주세요.");
            f.enddate.focus();
            return false;
        }
        if (f.title.value == "") {
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }
        if (f.people.value == "") {
            alert("빈칸을 입력해주세요");
            f.people.focus();
            return false;
        }

        if (f.content.value == "") {
            alert("빈칸을 입력해주세요");
            f.content.focus();
            return false;
        }
        if (f.openChatting.value == "") {
            alert("빈칸을 입력해주세요");
            f.openChatting.focus();
            return false;
        }
        if (!$("input:checked[Name='studykind']").is(":checked")){
            alert("스터디 구분을 체크해주세요");
            $("#all").focus();
            return false;
        }
        if (!$("input:checked[Name='agree']").is(":checked")){
            alert("개인정보 취급방침을 동의해주세요");
            $("#agree").focus();
            return false;
        }
    }



</script>