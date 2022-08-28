<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>
<form action="AdminNoticeInsertReg" name="myform" method="post" onsubmit="return check()">

    <table style="margin: 0 auto; padding-top: 100px">
        <tr>
            <td>타이틀</td>
            <td colspan="3"><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit" id="submit" value="등록" /></td>
        </tr>
    </table>
</form>
<script type="text/javascript">

    $(".admin-template-header>b").html("공지 목록")


    function check(){
        const f = document.myform;
        if(f.title.value.trim() == ""){
            alert("빈칸을 입력해주세요");
            f.title.focus();
            return false;
        }

        if(f.content.value.trim() == ""){
            alert("빈칸을 입력해주세요");
            f.content.focus();
            return false;
        }

    }





</script>
