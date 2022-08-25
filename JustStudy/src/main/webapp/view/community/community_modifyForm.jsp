<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-18
  Time: 오전 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    <c:if test="${msg!=null }">
    alert("${msg}")
    </c:if>
</script>

<style>
    .txt-wrapper p {
        font-weight: bold;
        font-size: 1rem;
        padding: 2%;
        float: left;
    }

    .community-modify-bg {
        width: 100%;
        height: fit-content;
    }

</style>



<div class="community-modify-bg">

    <form name="frmJoin" action="CommunityModifyReg" method="post" onclick="return CheckForm()">
        <table>
            <input type="hidden" name="id" value="${communityDTO.id}"/>
            <tr>
                <td>지점명</td>
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
                <fmt:formatDate value="${communityDTO.startdate}" pattern="yyyy-MM-dd" var="startdateFmt"/>
                <fmt:formatDate value="${communityDTO.enddate}" pattern="yyyy-MM-dd" var="enddateFmt"/>
                <td><input type="date"  name="startdate" value="${startdateFmt}"></td>
                <td> ~ <input type="date" name="enddate" value="${enddateFmt}"></td>
                <td></td>
            </tr>
            <tr>
                <td>타이틀</td>
                <td colspan="3"><input type="text" name="title" value="${communityDTO.title}"></td>
            </tr>
            <tr>
                <td>작성자</td>
                <input type="hidden" name="memId" value="${communityDTO.memId}">
                <td colspan="3"><input type="text" name="nickname" value="${communityDTO.nickname}" readonly></td>
            </tr>
            <tr>
                <td>모집인원</td>
                <td colspan="3"><input type="text" name="people" value="${communityDTO.people}"> 명</td>

            </tr>
            <tr>
                <td>스터디 구분</td>
                <td colspan="3">
                    <input type="checkbox" name="studykind" id="all" value="all" data-cate="0">
                    <label for="all">전체</label>
                    <input type="checkbox" name="studykind" id="cate_0" value="IT" data-cate="IT">
                    <label for="cate_0">IT</label>
                    <input type="checkbox" name="studykind" id="cate_1" value="토익" data-cate="토익">
                    <label for="cate_1">토익</label>
                    <input type="checkbox" name="studykind" id="cate_2" value="자격증" data-cate="자격증">
                    <label for="cate_2">자격증</label>
                    <input type="checkbox" name="studykind" id="cate_3" value="기타" data-cate="기타">
                    <label for="cate_3">기타</label>
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="3"><textarea name="content" cols="50" rows="10">${communityDTO.content}</textarea></td>
            </tr>
            <tr>
                <td>오픈채팅 URL</td>
                <td colspan="3"><input type="text" name="openChatting" value="${communityDTO.openChatting}"/></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" id="modifybtn" value="수정완료">
                </td>
            </tr>
        </table>

    </form>
</div>
<script type="text/javascript">

    $("select[name=location]>option").each(function (key, value){
          console.log("${communityDTO.location}")
        console.log(value.getAttribute("value"))
        if("${communityDTO.location}" == value.getAttribute("value")){
            value.setAttribute("selected", true)
        }
    })

    $("input[name=studykind]").each(function (key, value){
        if("${communityDTO.studykind}".includes(value.getAttribute("value"))){
            value.setAttribute("checked", true)
        }
    })


    $("#modifybtn").click(function(){

        var startDate = $( "input[name='startdate']" ).val();
        var startDateArr = startDate.split('-');

        var endDate = $( "input[name='enddate']" ).val();
        var endDateArr = endDate.split('-');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {

            alert("시작날짜와 종료날짜를 확인해 주세요.");

            return false;
        }

        $("#modifybtn").focus();
    });



    function CheckForm() {

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

    }

</script>

