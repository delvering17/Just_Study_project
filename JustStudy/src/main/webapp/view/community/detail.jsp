<%@ page import="model_p.CommunityDTO" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CommunityDTO dto = new CommunityDTO();
%>

<style>
    /*    .header{
            width: 100%;
            height: 150px;
            background: #ffa;
            margin-bottom: 50px;
        }

        .footer{
            width: 100%;
            height: 150px;
            background: #faa;
            margin-top: 50px;
        }*/

    .noticebox{
        width: 80%;
        height: 200px;
        margin: 0 auto;
        margin-bottom: 50px;
        border: 1px solid #000;

    }

    .boximg{
        width: 150px;
        height: 150px;
        background: #ffa;
        float: left;
        margin-top: 25px;
        margin-left: 150px;
        margin-right: 100px;
    }

    .community-head{
        width: 80%;
        height: 400px;
        border: 1px solid #000;
        margin: 0 auto;
        padding: 50px 0;
    }

    .community-title-area{
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
        margin: 0 auto;
        background: black;
    }

    #community-title{
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .showtable{
        border-top: 1px solid #000;
        border-collapse: collapse;
        margin: 0 auto;
        margin-top: 100px;
        margin-bottom: 100px;
        font-size: 1.5rem;
    }
    .listlink{
        width: 80%;
        height: 100px;
        margin: 0 auto;
        text-align: center;
        border: 1px solid #000;
    }

    #apply{
        width: 100px;
        height: 50px;
        background: #ffa;
    }

</style>


<%--<div class="header"></div>--%>


<div class="community-title-area">
    <p id="community-title">커뮤니티</p>
</div>

<div style="text-align: center">
    <a style="background: #ffa" href="CommunityModifyForm?id=${dto.id }">수정</a>
    <a style="background: #ffa" href="CommunityDeleteForm?id=${dto.id }">삭제</a>
</div>
<div class="noticebox">

    <div class="boximg"></div>

    <p>· 새 글쓰기, 게시물 상세 내용은 로그인 후 이용 및 확인이 가능합니다.</p> <br/>
    <p>· 공지사항 필독, 위반사항에 대해서 랭스터디카페는 책임을 지지 않습니다.</p> <br/>
    <p>· 서로를 위해 존중하고 배려해 주세요.</p>

</div>

<hr class="title-line">

<div class="community-head">

</div>

<table class="showtable" border="">
    <colgroup>
        <col width="280px" />
        <col width="1220px" />
    </colgroup>
    <tr>
        <th height="65px"><label>스터디 구분</label></th>
        <td height="65px">${dto.studykind}</td> <!-- db: "studykind"  -->
    </tr>
    <tr>
        <th height="65px"><label>스터디 모집기간</label></th>
        <td height="65px">${dto.startdate} ~ ${dto.enddate}</td> <!-- db: "startdate,enddate" -->
    </tr>
    <tr>
        <th height="65px"><label>모집인원</label></th>
        <td height="65px">${dto.people}</td> <!-- db: "people" -->
    </tr>
    <tr>
        <th height="65px"><label>내용</label></th>
        <td height="65px">${dto.content}</td> <!-- db: "content" -->
    </tr>
</table>

<div class="listlink">
    <a href="CommunityPage">목록으로</a>

</div>
<a id="apply" href="CommunityApplyInsertForm">신청하기</a>


<%--
<table border="">
    <tr>
        <td width="100px">지역</td>
        <td  width="500px">${dto.location}</td>
    </tr>
    <tr>
        <td>기간</td>
        <td>${dto.startdate} ~ ${dto.enddate}</td>
    </tr>
    <tr>
        <td>타이틀</td>
        <td>${dto.title}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${dto.pname}</td>
    </tr>
    <tr>
        <td>모집인원</td>
        <td>${dto.people} 명</td>
    </tr>
    <tr>
        <td>스터디 구분</td>
        <td>${dto.studykind}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td>${dto.content}</td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <a href="CommunityPage">목록으로</a>
        </td>
    </tr>
</table>
--%>
