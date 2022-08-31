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


<style>

    .txt-wrapper p {
        font-weight: bold;
        font-size: 1rem;
        padding: 2%;
        float: left;
    }

    .community-modify-bg {
        width: 1400px;
        margin: 0 auto;

        height: fit-content;
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

    .table-wrapper{
        width: 1400px;
        margin: 0 auto;
        padding-bottom: 50px;
    }

/*    table{
        margin: 0 auto;
        width: 500px;
        height: 100px;
    }*/
    table{
        width: 1100px;
        height: 200px;
        padding-bottom: 30px;
        padding-top: 30px;
        margin: 30px auto;

    }

/*    th{
        width: 200px;
        height: 100px;
        text-align: center;
        border: 1px solid #000;
    }
    td{
        width: 500px;
        height: 200px;
        text-align: center;
    }*/
    th{
        font-size: 1.3rem;
        text-align: center;
        border: 1px solid #000;
        border-left: none;
        border-right: none;
        background: #edecec;

    }
    td{
        border: 1px solid #000;
        padding-left: 30px;
        border-left: none;
        border-right: none;
    }


    #modify-btn{
        margin-left: 700px;
        margin-top: 50px;
    }
    textarea{
        width: 500px;
        height:100px;

    }


</style>

<div class="community-modify-bg">

    <div class="studyapply-title-area">
        <h1 id="studyapply-title">스터디 수정</h1>
        <hr class="title-line">
    </div>

    <div class="table-wrapper">
        <table>
            <input type="hidden" name="as_id" id="as-id" value="${applyStudyDTO.as_id}"/>
            <tr>
                <th>작성자</th>
                <td colspan="3"><input type="text" name="nickname" value="${nickname}" readonly></td>
            </tr>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3"><textarea name="content" id="as-content" cols="50" rows="10">${applyStudyDTO.as_content}</textarea></td>
            </tr>

        </table>
        <input id="modify-btn" type="button" onclick="goModify()" value="수정완료">

    </div>

</div>

<script type="text/javascript">

    function goModify() {
        let form_data = {
            as_id:$('#as-id').val(),
            as_content:$('#as-content').val()
        }
        if(form_data.as_id.trim() === "") {
            alert("빈칸을 입력해주세요");
        }else if(form_data.as_content.trim() === ""){
            alert("빈칸을 입력해주세요");
        }else{
            $.ajax({
                url:'<c:url value="/nonView/CommunityApplyModifyReg"/>',
                type:'GET',
                data: form_data,
                async:false,
                dataType:'JSON',
                success:function(response){

                    if(response.modifyResult === 'success') {
                        alert('수정되었습니다.')
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

