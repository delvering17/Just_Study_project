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
        width: 1400px;
        height: fit-content;
        margin: 0 auto;
    }
    table{
        margin: 0 auto;
        padding-bottom: 50px;
    }
    .study-top {
        width: 1200px;
        height: 200px;
        text-align: center;
        margin: 0 auto;
        padding-top: 100px;
    }
    #study-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }
    .underline{
        width: 1200px;
        height: 3px;
        margin: 20px auto;
        background: black;
    }
    form{
        margin-top: 50px;
    }




    th{
        height: 70px;
        padding-top: 10px;
        text-align: center;
        border: 1px solid #000;
        border-left: none;
        background: #edecec;
    }
    td{
        border: 1px solid #000;
        border-left: none;
        border-right: none;
        height: 40px;
        text-align: center;
    }

    .tr-ten > td{
        border-bottom: none;
        border-top: none;
    }
    .tr-nine > td{
        border-bottom: none;
    }
    .main-table{
        width: 800px;
        /*border: 1px solid #000;*/
        margin: 0 auto;
    }
    #location_01{
        width: 150px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #startdate, #enddate{
        width: 150px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #title{
        width: 300px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    .user{
        width: 150px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #people{
        width: 150px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #open-url{
        width: 400px;
        height: 30px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    .tr-nine>th{
        border: none;
        background: none;
    }

</style>







<div class="community-modify-bg">

    <div class="study-top">
        <p id="study-title">스터디 수정</p>
        <hr class="underline">
    </div>

    <form id="community-modify-form" name="frmJoin">
        <table class="main-table">
            <input type="hidden" name="id" value="${communityDTO.id}"/>
            <tr class="tr-one">
                <th>지점명</th>
                <td colspan="3">
                    <select id="location_01" name="location" class="local-selector">
                        <c:forEach items="${branchList}" var="branch" varStatus="no">
                            <option value="${branch.name}">${branch.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr class="tr-two">
                <th>스터디 기간</th>
                <fmt:formatDate value="${communityDTO.startdate}" pattern="yyyy-MM-dd" var="startdateFmt"/>
                <fmt:formatDate value="${communityDTO.enddate}" pattern="yyyy-MM-dd" var="enddateFmt"/>
                <td><input type="date" id="startdate"  name="startdate" value="${startdateFmt}"> ~ <input type="date" id="enddate" name="enddate" value="${enddateFmt}"></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="tr-three">
                <th>타이틀</th>
                <td colspan="3"><input id="title" type="text" name="title" value="${communityDTO.title}"></td>
            </tr>
            <tr class="tr-four">
                <th>작성자</th>
                <input class="user" type="hidden" name="memId" value="${communityDTO.memId}">
                <td colspan="3"><input type="text" name="nickname" value="${communityDTO.nickname}" readonly></td>
            </tr>
            <tr class="tr-five">
                <th>모집인원</th>
                <td colspan="3"><input id="people" type="number" name="people" min="1" value="${communityDTO.people}"> 명</td>

            </tr>
            <tr class="tr-six">
                <th>스터디 구분</th>
                <td colspan="3">
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
            <tr class="tr-seven">
                <th>내용</th>
                <td colspan="3"><textarea name="content" cols="50" rows="10">${communityDTO.content}</textarea></td>
            </tr>
            <tr class="tr-eight">
                <th>오픈채팅 URL</th>
                <td colspan="3"><input id="open-url" type="text" name="openChatting" value="${communityDTO.openChatting}"/></td>
            </tr>
            <tr class="tr-nine">
                <th></th>
                <td>
                    <input type="button" onclick="goModify()" id="modifybtn" value="수정완료">
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

    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset() * 60000;
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("startdate").setAttribute("min", today);
    document.getElementById("enddate").setAttribute("min", today);


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


    function goModify() {

        const fff = document.frmJoin;

        if (fff.location.value == "") {
            alert("지점 선택을 해주세요.");
            fff.location.focus();
            return false;
        } else if (fff.startdate.value == "") {
            alert("시작 기간을 입력해주세요.");
            fff.startdate.focus();
            return false;
        } else if (fff.enddate.value == "") {
            alert("종료 기간을 입력해주세요.");
            fff.enddate.focus();
            return false;
        } else if (fff.title.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            fff.title.focus();
            return false;
        } else if (fff.people.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            fff.people.focus();
            return false;
        } else if (fff.content.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            fff.content.focus();
            return false;
        } else if (fff.openChatting.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            fff.openChatting.focus();
            return false;
        } else if (!$("input:checked[Name='studykind']").is(":checked")){
            alert("스터디 구분을 체크해주세요");
            $("#all").focus();
            return false;
        } else{
            $("#community-modify-form").attr("action", "CommunityModifyReg");
            $("#community-modify-form").attr("method", "post");
            $("#community-modify-form").submit();
        }

    }

</script>

