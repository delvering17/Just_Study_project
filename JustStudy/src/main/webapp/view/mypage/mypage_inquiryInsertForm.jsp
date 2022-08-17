<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">

    <%--function goInformationModify() {--%>
    <%--    let form_data = {--%>
    <%--        input_realname:$('#input-realname').val(),--%>
    <%--        input_nickname:$('#input-nickname').val(),--%>
    <%--        input_phone:$('#input-phone').val(),--%>
    <%--        input_address1:$('#input-address1').val(),--%>
    <%--        input_address2:$('#input-address2').val()--%>
    <%--    }--%>
    
    <%--    $.ajax({--%>
    <%--        url:'<c:url value="/mypageNonView/MypageInformationModifyReg"/>',--%>
    <%--        type:'GET',--%>
    <%--        data: form_data,--%>
    <%--        async:false,--%>
    <%--        dataType:'JSON',--%>
    <%--        success:function(response){--%>
    <%--            alert(response.modifyResult)--%>
    <%--            location.href = "/mypage/MypageInformationModifyForm"--%>
    <%--            &lt;%&ndash;if(response.modifyResult === 'success') {&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    alert(msg)&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    location.href = '<c:url value="/board/MainPage"/>'&ndash;%&gt;--%>
    <%--            &lt;%&ndash;} else {&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    alert(response.modifyResult)&ndash;%&gt;--%>
    <%--            &lt;%&ndash;}&ndash;%&gt;--%>
    <%--        },--%>
    <%--        error:function(e){--%>
    <%--            console.log(e.responseText)--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    
    <%--function gogo() {--%>
    <%--    location.href = "../mypage/MypageSignoutForm"--%>
    <%--}--%>
</script>




<style type="text/css">
    .inquiry-insert {
        width: 700px;
        margin-top: 50px;

    }

    .inquiry-insert-form-items {
        display: flex;
    }

    .inquiry-insert-form-items > p {
        width: 100px;
        height: 40px;
        font-size: 1.2rem;
    }

    .inquiry-insert-form-items .user-input{
        width: 400px;
        height: 40px;
        border: 0;
    }

    .inquiry-insert-form-items .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .inquiry-insert-form-items #btn-memberclose {
        background: rgb(173, 153, 126);
    }

    .inquiry-insert-form-items #btn-confirm-modify {
        background: rgb(48, 48, 48);
    }

    #inquiry-insert-confirm-wrapper {
        width: 400px;
        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-around;
    }

    #inquiry-insert-confirm-wrapper > .btn-modify{
        width:150px;
    }
</style>

<div class="inquiry-insert">
    <form id="inquiry-insert-form">
        <input type="hidden" name="input_writer" id="input-writer" value="${memberDTO.mem_id}">
        <ul>
            <li class="inquiry-insert-form-items">
                <p>이름</p>
                <input type="text" class="user-input" name="input_realname" id="input-realname" value="${memberDTO.mem_realname}" readonly>
            </li>
            <li class="inquiry-insert-form-items">
                <p>닉네임</p>
                <input type="text" class="user-input" name="input_nickname" id="input-nickname" value="${memberDTO.mem_nickname}" readonly>
            </li>
            <li class="inquiry-insert-form-items">
                <p>제목</p>
                <input type="text" class="user-input" name="input_title"  id="input-title">
            </li>
            <li class="inquiry-insert-form-items">
                <p>카테고리</p>
                <input type="radio" class="user-input" name="input_category" id="input-reveravtion" value="예약">예약
                <input type="radio" class="user-input" name="input_category" id="input-study" value="스터디">스터디
            </li>
            <li class="inquiry-insert-form-items">
                <p>종류</p>
                <input type="radio" class="user-input" name="input_type" id="input-service" value="서비스">서비스
                <input type="radio" class="user-input" name="input_type" id="input-suggest" value="제안">제안
                <input type="radio" class="user-input" name="input_type" id="input-declaration" value="신고">신고
            </li>
            <li class="inquiry-insert-form-items">
                <p>지점</p>
                <select id="input_branch">
                    <c:forEach items="${arr_branchName}" var="branchName">
                        <option value="${branchName}">${branchName}</option>
                    </c:forEach>
                </select>
            </li>
            <li class="inquiry-insert-form-items">
                <p>문의 내용</p>
                <textarea name="input_content" id="" cols="30" rows="10"></textarea>
            </li>
            <li class="inquiry-insert-form-items">
                <p></p>
                <div id="inquiry-insert-confirm-wrapper">
                    <button type="button" class="btn-modify" onclick="goInquiryInsert()">문의 제출</button>
                    <button type="button" class="btn-modify" onclick="gogo()">문의 내역</button>
                </div>
            </li>
        </ul>
    </form>
</div>
<script>
    function goInquiryInsert() {
        let form_data = {
            input_writer:$('#input-writer').val(),
            input_title:$('#input-title').val(),
            input_content:$('#input-content').val(),
            input_category: $("input[name='input_category']:checked").val(),
            input_type: $("input[name='input_type']:checked").val(),
            input_branch: $("#input_branch option:selected").val()
        }

        $.ajax({
            url:'<c:url value="/mypageNonView/MypageInsertInquiryReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'JSON',
            success:function(response){
                alert(response.insertResult)
                <%--location.href = "/mypage/MypageInformationModifyForm"--%>
                <%--if(response.insertResult === 'success') {--%>
                <%--    alert(msg)--%>
                <%--    location.href = '<c:url value="/board/MainPage"/>'--%>
                <%--} else {--%>
                <%--    alert(response.modifyResult)--%>
                <%--}--%>
            },
            error:function(e){
                console.log(e.responseText)
            }
        })
    }

    function gogo() {
        location.href = "MypageInquiryList?date_period=day7&nowPage=1"
    }

</script>