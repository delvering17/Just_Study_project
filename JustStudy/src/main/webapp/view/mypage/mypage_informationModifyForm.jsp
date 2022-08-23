<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>






<style type="text/css">
    .info-modify {
        width: 700px;
        margin-top: 50px;

    }

    .info-modify-form-items {
        display: flex;
    }

    .info-modify-form-items > p {
        width: 100px;
        height: 40px;
        font-size: 1.2rem;
    }

    .info-modify-form-items .user-input{
        width: 400px;
        height: 40px;
        border: 0;
    }

    .info-modify-form-items .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .info-modify-form-items #btn-memberclose {
        background: rgb(173, 153, 126);
    }

    .info-modify-form-items #btn-confirm-modify {
        background: rgb(48, 48, 48);
    }

    #info-modify-confirm-wrapper {
        width: 400px;
        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-around;
    }

    #info-modify-confirm-wrapper > .btn-modify{
        width:150px;
    }
</style>

<div class="info-modify">
    <form>
        <ul>
            <li class="info-modify-form-items">
                <p>이름</p>
                <input type="text" class="user-input" id="input-realname" value="${memberDTO.mem_realname}">
            </li>
            <li class="info-modify-form-items">
                <p>닉네임</p>
                <input type="text" class="user-input"id="input-nickname" value="${memberDTO.mem_nickname}">
                <button type="button" class="btn-modify">중복체크</button>
            </li>
<%--            <li class="info-modify-form-items">--%>
<%--                <p>휴대전화</p>--%>
<%--                <input type="text" class="user-input" id="input-phone" value="${memberDTO.mem_phone}"/>--%>
<%--                <input type="text" class="user-input" value="1999.10.1" readonly>--%>
<%--                <button type="button" class="btn-modify" id="">변경</button>--%>
<%--            </li>--%>
            <li class="info-modify-form-items" >
                <p>주소</p>
                <input type="text" class="user-input" id="input-address1" value="${memberDTO.mem_address1}" readonly>
                <button type="button" class="btn-modify" id="btn-findaddress">검색</button>
            </li>
            <li class="info-modify-form-items">
                <p></p>
                <input type="text" class="user-input" id="input-address2" value="${memberDTO.mem_address2}" readonly>
            </li>
            <li class="info-modify-form-items">
                <p></p>
                <div id="info-modify-confirm-wrapper">
                    <button type="button" class="btn-modify" id="btn-memberclose" onclick="gogo()">회원 탈퇴</button>
                    <button class="btn-modify" id="btn-confirm-modify" onclick="goInformationModify()">수정하기</button>
                </div>
            </li>
        </ul>
    </form>
</div>
<script type="text/javascript">

    function goInformationModify() {
        let form_data = {
            input_realname:$('#input-realname').val(),
            input_nickname:$('#input-nickname').val(),
            input_address1:$('#input-address1').val(),
            input_address2:$('#input-address2').val()
        }

        $.ajax({
            url:'<c:url value="/mypageNonView/MypageInformationModifyReg"/>',
            type:'GET',
            data: form_data,
            async:false,
            dataType:'JSON',
            success:function(response){
                alert(response.modifyResult)
                location.href = "/mypage/MypageInformationModifyForm"
                <%--if(response.modifyResult === 'success') {--%>
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
        location.href = "../mypage/MypageSignoutForm"
    }
</script>