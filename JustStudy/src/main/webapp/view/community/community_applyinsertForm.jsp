<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-18
  Time: 오전 6:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .apply-wrapper{
        width: 1400px;
        min-height: 80%;
        margin: 0 auto;
        padding-bottom: 30px;
    }
    .studyapply-title-area{
        width: 1100px;
        height: 200px;
        /*border: solid 1px #000;*/
        padding-top: 100px;
        margin: 0 auto;
    }


    .title-line{
        width: 1100px;
        height: 3px;
        margin: 0 auto;
        background: black;
    }


    #studyapply-title{

        font-weight: bold;
        text-align: center;
    }
    .infobox{
        width: 1100px;
        height: 50px;

        margin: 50px auto;
    }
    .infobox > p{
        text-align: center;
    }

    textarea{
        width: 500px;
        height:100px;

    }
    #submit-btn{
        width: 70px;
        height: 30px;
        border-radius: 7px;
        margin-left: 700px;

    }
    table{
        width: 1100px;
        height: 200px;
        padding-bottom: 30px;
        padding-top: 30px;
        margin: 30px auto;

    }
    th{
        font-size: 1.3rem;
        text-align: center;
        border: 1px solid #000;
        border-left: none;
        border-right: none;
        background: #edecec;

    }
    td{
        font-size: 1.2rem;
        border: 1px solid #000;
        border-left: none;
        border-right: none;
    }
    #p2{
        font-size: 1.2rem;
        font-weight: bold;
    }


</style>


<div class="apply-wrapper">
<div class="studyapply-title-area">
    <h1 id="studyapply-title">스터디 신청</h1>
    <hr class="title-line">
</div>

<div class="infobox">
    <p style=" font-size: 2rem; font-weight: bold;">상담자 정보</p>
    <p id="p2">간단한 신청자 정보를 입력해 주세요.</p>
</div>

<table >
    <input type="hidden" name="mem_id" id="mem-id" value="${mem_id}">
    <input type="hidden" name="input_purpose" id="input-purpose" value="${input_purpose}">
    <colgroup>
        <col width="200px"/>
        <col width="*"/>
    </colgroup>
    <tr id="first">
        <th>닉네임</th>
        <td width="500px">
            ${memberDTO.mem_nickname}
        </td>
    </tr>
    <tr>
        <th>내용</th>
        <td>
            <textarea id="input-content" name="input_content" cols="30" rows="10"></textarea>
        </td>
    </tr>
</table>
<button id="submit-btn" onclick="goApplyInsert()">등록</button>
</div>

<script type="text/javascript">

    function goApplyInsert() {
        let form_data = {
            input_id:$('#mem-id').val(),
            input_content:$('#input-content').val(),
            input_purpose:$('#input-purpose').val()
        }

        if(form_data.input_content === ''){
            alert('빈 칸을 입력해주세요.')
            $('#input-content').focus()
        }else{
            $.ajax({
                url:'<c:url value="/nonView/CommunityApplyInsertReg"/>',
                type:'GET',
                data: form_data,
                async:false,
                dataType:'JSON',
                success:function(response){
                    if(response.applyResult === 'success') {
                        alert('신청되었습니다.')
                        location.href = 'CommunityApplyDetail?as_id=' + response.as_id
                    } else {
                        alert(response.applyResult)
                    }
                },
                error:function(e){
                    console.log(e.responseText)
                }
            })
        }


    }



</script>

