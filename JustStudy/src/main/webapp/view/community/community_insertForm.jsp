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
    .main{
        width: 1400px;
        /*border: 1px solid  #000;*/
        margin: 0 auto;
        padding-top: 150px;
        padding-bottom: 50px;
    }

    .study-top {
        width: 1200px;
        height: 200px;
        text-align: center;
        margin: 0 auto;
    }
    #study-title{

        font-weight: bold;
        text-align: center;
    }
    .underline{
        width: 1200px;
        height: 3px;
        margin: 20px auto;
        background: black;
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
   #Date-start, #Date-end{
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
   #agree-chk{
       font-weight: bold;
   }

   .label{
       font-size: 1rem;

   }

</style>

<form name="frmJoin" action=" CommunityInsertReg" method="post" onsubmit="return CheckForm(this)">
    <div class="main">

        <div class="study-top">
            <h1 id="study-title">스터디 글작성</h1>
            <hr class="underline">
        </div>

    <table class="main-table">
        <tr class="tr-one">
            <th>지역</th>
            <td colspan="3">
                <select id="location_01" name="location" class="local-selector">
                    <option value="">지점 선택</option>
                    <c:forEach items="${branchList}" var="branch" varStatus="no">
                        <option value="${branch.name}">${branch.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr class="tr-two">
            <th>스터디 기간</th>
            <td><input type="date" id="Date-start" name="startdate"> ~ <input type="date" id="Date-end" name="enddate"></td>

        </tr>
        <tr class="tr-three">
            <th>타이틀</th>
            <td colspan="3"><input id="title" type="text" name="title"></td>
        </tr>
        <tr class="tr-four">
            <th>작성자</th>
            <input class="user" type="hidden" name="memId" value="${memberDTO.mem_id}"/>
            <td colspan="3"><input class="user" type="text" name="nickname" value="${memberDTO.mem_nickname}" readonly></td>
        </tr>
        <tr class="tr-five">
            <th>모집인원</th>
            <td colspan="3"><input id="people" type="number" min="1" name="people"> 명</td>

        </tr>
        <tr class="tr-six">
            <th>스터디 구분</th>
            <td colspan="3">
                <input class="chbox" type="checkbox" name="studykind" id="cate_0" value="IT" data-cate="IT" onclick="validate()" >
                <label class="label" for="cate_0">IT</label>
                <input class="chbox" type="checkbox" name="studykind" id="cate_1" value="토익" data-cate="토익" onclick="validate()">
                <label class="label" for="cate_1">토익</label>
                <input class="chbox" type="checkbox" name="studykind" id="cate_2" value="자격증" data-cate="자격증" onclick="validate()">
                <label class="label" for="cate_2">자격증</label>
                <input class="chbox" type="checkbox" name="studykind" id="cate_3" value="기타" data-cate="기타" onclick="validate()">
                <label class="label" for="cate_3">기타</label>
               </td>
        </tr>
        <tr class="tr-seven">
            <th>내용</th>
            <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
        </tr>
        <tr class="tr-eight">
            <th>오픈채팅 URL</th>
            <td colspan="3"><input id="open-url" type="text" name="openChatting"/></td>
        </tr>
        <tr class="tr-nine">
            <td colspan="4"><input type="checkbox" name="agree" id="agree" value="">
                <label id="agree-chk" for="agree">개인정보취급방침을 읽었으며 이에 동의합니다.</label></td>
        </tr>
        <tr class="tr-ten">
            <td colspan="4"><input type="submit" id="subbtn" value="등록"></td>
        </tr>
    </table>
    </div>
</form>

<script>
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("Date-start").setAttribute("min", today);
    document.getElementById("Date-end").setAttribute("min", today);

    $("#subbtn").click(function(){

        var startDate = $( "input[name='startdate']" ).val();
        var startDateArr = startDate.split('-');

        var endDate = $( "input[name='enddate']" ).val();
        var endDateArr = endDate.split('-');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1] - 1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1] - 1, endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {

            alert("시작날짜와 종료날짜를 확인해 주세요.");

            return false;
        }

        $("#subbtn").focus();
    });


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
        if (f.title.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }
        if (f.people.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.people.focus();
            return false;
        }

        if (f.content.value.trim() == "") {
            alert("빈칸을 입력해주세요");
            f.content.focus();
            return false;
        }
        if (f.openChatting.value.trim() == "") {
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