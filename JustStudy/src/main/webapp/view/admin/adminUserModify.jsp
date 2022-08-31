<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-17
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r2").attr("checked", true)
    $(".admin-template-header>b").html("회원 정보 수정")
    $(".admin-template-header>div").append("<input type=button class='admin-user-modify' value='수정'/>")
</script>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    table{
        width: 320px;
        height: 200px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th{
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
        padding: 10px 0px 10px 0px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    input{
        margin-left: 10px;
    }

    input[name=userid],
    input[name=realname],
    input[name=nickname]{
        width: 150px;
    }

    input[name=address1],
    input[name=address2]{
        width: 200px;
    }

    button[type=button]{
        float: right;
        margin-right: 10px;
    }

</style>

<div id="main">

    <form action="AdminUserModifyReg?&nowPage=${nowPage}" class="admin-user-modify-action" method="get">
        <input type="hidden" name="id" value="${adminModifyDTO.mem_id}"/>
        <table border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>이메일</th>
                <td><input type="text" name="userid" value="${adminModifyDTO.mem_userid}" readonly/></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="realname" value="${adminModifyDTO.mem_realname}"/></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                    <input type="text" name="nickname" id="input-nickname" value="${adminModifyDTO.mem_nickname}"/>
                    <input type="checkbox" id="isNicknamedoubleCheck" hidden/>
                    <button type="button" onclick="goNicknamedoubleCheck()" class="btn-signin">중복체크</button>
                </td>

            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" id="address1" name="address1" value="${adminModifyDTO.mem_address1}"
                           readonly/>
                    <button type="button" id="address2" class="btn-signin" id="btn-findaddress"
                            onclick="gofindAddress()">검색
                    </button>
                </td>
            </tr>
            <tr>
                <th>상세주소</th>
                <td><input type="text" name="address2" value="${adminModifyDTO.mem_address2}"/></td>
            </tr>
        </table>
    </form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    function gofindAddress() {

        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("address1").value = data.address;
                document.getElementById("address2").focus();
            }
        }).open();
    }

    $(".admin-user-modify").click(function () {
        if($('#isNicknamedoubleCheck').is(":checked") === false) {
            alert('닉네임 중복 확인을 해주세요.')
        } else {
            $(".admin-user-modify-action").submit()
        }
    })


    function goNicknamedoubleCheck() {
        if($('#input-nickname').val() === '') {
            alert('빈 칸을 입력해주세요')
        } else if(!/^(?=[ㄱ-ㅎ|가-힣]).{2,8}$/.test($('#input-nickname').val())) {
            alert('한글 2~6자리를 입력해주세요')
            $('#notice-nickname').removeClass('hide')
            $('#notice-nickname').addClass('show')
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
                        $('#notice-nickname').removeClass('show')
                        $('#notice-nickname').addClass('hide')
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

</script>





