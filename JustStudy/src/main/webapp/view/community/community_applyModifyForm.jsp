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
        width: 100%;
        height: fit-content;
    }

</style>

<div class="community-modify-bg">

        <table>
            <input type="hidden" name="as_id" id="as-id" value="${applyStudyDTO.as_id}"/>
            <tr>
                <td>작성자</td>
                <td colspan="3"><input type="text" name="nickname" value="${nickname}" readonly></td>
            </tr>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="3"><textarea name="content" id="as-content" cols="50" rows="10">${applyStudyDTO.as_content}</textarea></td>
            </tr>
            <tr>
                <td>
                    <input onclick="goModify()" value="수정완료">
                </td>
            </tr>
        </table>


</div>

<script type="text/javascript">

    function goModify() {
        let form_data = {
            as_id:$('#as-id').val(),
            as_content:$('#as-content').val()
        }

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

</script>

