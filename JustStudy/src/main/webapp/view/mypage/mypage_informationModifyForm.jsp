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

    .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    #btn-memberclose {
        background: rgb(173, 153, 126);
    }

    #btn-confirm-modify {
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


    .notice-wrapper {
        width: 200px;
        height: 50px;

    }

    .notice-wrapper > .signin-notice {
        width: 200px;
        font-size: 0.8rem;
        color: red;
    }

    .hide {
        display: none;
    }

    .show {
        visibility: visible;
    }


</style>

<div class="info-modify">

        <ul>
            <form id="form-modify">
            <li class="info-modify-form-items">
                <p>이름</p>
                <input type="text" class="user-input" id="input-realname" value="${memberDTO.mem_realname}">
            </li>
            <li class="info-modify-form-items">
                <p>닉네임</p>
                <input type="checkbox" id="isNicknamedoubleCheck" checked hidden/>
                <input type="text" class="user-input" id="input-nickname" value="${memberDTO.mem_nickname}">
                <button type="button" onclick="goNicknamedoubleCheck()" class="btn-modify">중복체크</button>
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
                <input type="text" class="user-input" id="input-address2" value="${memberDTO.mem_address2}">
            </li>
            <li class="info-modify-form-items">
                <p></p>
            </form>
                <div id="info-modify-confirm-wrapper">
                    <button type="button" class="btn-modify" id="btn-memberclose" onclick="gogo()">회원 탈퇴</button>
                    <button class="btn-modify" id="btn-confirm-modify" onclick="goInformationModify()">수정하기</button>
                </div>
            </li>
        </ul>

</div>
<script type="text/javascript">

    $('#input-nickname').change(function () {
        $('#isNicknamedoubleCheck').attr("checked",false);
    })

    function goNicknamedoubleCheck() {
        if($('#input-nickname').val() === '') {
            alert('빈 칸을 입력해주세요')
        } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
            alert('한글 2~6자리를 입력해주세요')
        } else if(/\s/g.test($('#input-nickname').val())) {
            alert('공백을 제거해 주세요')
        } else {

            let input_nickname = $('#input-nickname').val()
            $.ajax({
                url:'<c:url value="/memberNonView/MemberSigninDoubleCheck"/>',
                type: 'GET',
                data: 'input_nickname='+input_nickname,
                async: false,
                success:function (response){
                    if(response === 'success') {
                        $('#isNicknamedoubleCheck').attr("checked",true);
                        $("#input-nickname").attr("readonly",true);
                        alert('사용가능한 닉네임 입니다')
                    } else if(response === 'regex'){
                        alert('한글은 2~6자리를 입력해주세요')
                    } else {
                        alert('중복된 닉네임 입니다.')
                    }

                },
                error:function(e){
                    console.log(e.responseText)
                }
            });
        }

    }




    function goInformationModify() {
        let form_data = {
            input_realname:$('#input-realname').val(),
            input_nickname:$('#input-nickname').val(),
            input_address1:$('#input-address1').val(),
            input_address2:$('#input-address2').val()
        }

        if(form_data.input_nickname === '') {
            alert('빈 칸을 입력해주세요.')
            $('#input-nickname').focus()
        } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
            alert('한글 2~6자리를 입력해주세요.')
            $('#input-nickname').focus()
        } else if(/\s/g.test($('#input-nickname').val())) {
            alert('닉네임 공백을 제거해 주세요')
            $('#input-nickname').focus()
        } else if($('#isNicknamedoubleCheck').is(":checked") === false) {
            alert('닉네임 중복 확인을 해주세요.')
        } else if(form_data.input_realname === '') {
            alert('빈 칸을 입력해주세요.')
            $('#input-realname').focus()
        } else if(/\s/g.test($('#input-realname').val())) {
            alert('이름 공백을 제거해 주세요')
            $('#input-userid').focus()
        } else if(form_data.input_address1 === '') {
            alert('주소 검색을 이용해 주소를 입력해주세요.')
            $('#input-address1').focus()
        } else if(form_data.input_address2 === '') {
            alert('빈 칸을 입력해주세요.')
            $('#input-address2').focus()
        } else {
            $.ajax({
                url:'<c:url value="/mypageNonView/MypageInformationModifyReg"/>',
                type:'GET',
                data: form_data,
                async:false,
                dataType:'JSON',
                success:function(response){
                    alert(response.modifyResult)

                    // location.href = "/mypage/MypageInformationModifyForm"
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


    }

    function gogo() {
        if(confirm('정말 탈퇴하시겠습니까?')) {
            $.ajax({
                url:'<c:url value="/mypageNonView/MypageSignoutReg"/>',
                type:'GET',
                async:false,
                dataType: 'JSON',
                success:function(response){
                    if(response.signoutResult === "success") {
                        alert('회원 탈퇴되었습니다.')
                        location.href = '../board/MainPage'
                    } else {
                        alert('현재 예약 건이 있으므로 탈퇴를 할 수 없습니다.')
                        // location.href = "../mypage/MyReservationList"
                    }
                },
                error:function(e){
                    console.log(e.responseText)
                }
            })
        }


    }
</script>