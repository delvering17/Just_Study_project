<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-18
  Time: 오전 6:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .studyapply-title-area{
        width: 100%;
        height: 200px;
        /*border: solid 1px #000;*/

        padding-top: 60px;
        margin-top: 60px;
    }

    .title-line{
        width: 80%;
        height: 3px;
        margin-top: 2%;
        margin-left: 10%;
        background: black;
    }

    #studyapply-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }
    .infobox{
        width: 80%;
        height: 50px;
        border: 1px solid #000;
        margin: 0 auto;
    }

    textarea{
        overflow:auto;
        width:772px;
        height:230px;
        padding:20px;
        border:1px solid #ececec
    ;background:#fff;
        font-family: 'NotoSansKR-DemiLight';
        font-size:16px;
        line-height:160%;
        outline-style: none;
        resize:none;
        color:#000;
    }

</style>



<div class="studyapply-title-area">
    <p id="studyapply-title">스터디 신청</p>
    <hr class="title-line">
</div>

<div class="infobox">
    <p style="font-weight: bold; float: left;">상담자 정보</p>
    <p>간단한 신청자 정보를 입력해 주세요.</p>
</div>

<form action="CommunityApplyInsertReg"> <%-- 지정해줘야함 --%>
    <table border="">
        <colgroup>
            <col width="200px"/>
            <col width="*"/>
        </colgroup>
        <tr>
            <th><label>닉네임</label></th>
            <td width="500px">아무개</td> <!-- db "pname"  -->
        </tr>
        <tr>
            <th><label>참여동기</label></th>
            <td>
                <textarea></textarea> <!-- db 추가해야할듯 -->
            </td>
        </tr>
        <tr>
            <th><label>참여목표</label></th>
            <td>
                <textarea></textarea> <!-- db 추가해야할듯 -->
            </td>
        </tr>
    </table>

    <button type="submit">등록</button>
</form>

