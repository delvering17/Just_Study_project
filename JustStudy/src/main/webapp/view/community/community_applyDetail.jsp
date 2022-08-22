<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model_p.CommunityDTO" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .community-detail-bg{
        width: 100%;
        height: fit-content;
    }

    .noticebox {
        width: 80%;
        height: 200px;
        margin: 0 auto;
        margin-bottom: 50px;

    }

    .noticebox-img {
        width: 150px;
        height: 150px;
        background: #001f4a;
        float: left;
        margin-top: 25px;
        margin-left: 150px;
        margin-right: 100px;
        border-radius: 100px;
        color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .fa-list{
        width: fit-content;
        font-size: 2rem;
    }

    .community-detail-main {
        width: 80%;
        height: fit-content;
        margin: 0 auto;
        padding: 50px 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .community-detail-main > .fa-circle-user{
        width: fit-content;
        color: lightgray;
        font-size: 8rem;
    }

    .community-detail-main > p,
    .community-detail-main > h2{
        width: fit-content;
    }

    .community-title-area {
        width: 100%;
        height: 200px;
        padding-top: 60px;
        margin-top: 60px;
    }

    .community-detail-table{
        width: 60%;
        margin-top: 50px;
        margin-bottom: 50px;
        border-bottom: 1px solid lightgray;
    }

    .community-detail-table tr{
        height: 80px;
        border-top: 1px solid lightgray;
    }

    .community-detail-table td:first-of-type{
        width: 30%;
        font-weight: bold;
        text-align: center;
    }

    .community-detail-table td:last-of-type{
        padding: 20px 0px 20px 0px;
    }

    #community-title {
        font-size: 3.5rem;
        font-weight: bold;
        text-align: center;
    }

    .community-detail-btns{
        width: 300px;
        height: 50px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .community-detail-btns i{
        width: fit-content;
    }

    .community-detail-btns a{
        width: fit-content;
    }

    .community-apply-btn{
        width: 200px;
        height: 50px;
        background: #001f4a;
        color: white;
        text-align: center;
        line-height: 50px;
        border-radius: 10px;
        cursor: pointer;
    }

    .community-modify-btn{
        width: 100px;
        height: 50px;
        background: darkolivegreen;
        color: white;
        text-align: center;
        line-height: 50px;
        border-radius: 10px;
        cursor: pointer;
    }


    .community-delete-btn{
        width: 100px;
        height: 50px;
        background: darkred;
        color: white;
        text-align: center;
        line-height: 50px;
        border-radius: 10px;
        cursor: pointer;

    }

</style>

<script type="text/javascript">


</script>

<div class="community-detail-bg">

    <div class="community-title-area">
        <p id="community-title">커뮤니티</p>
    </div>

    <div class="noticebox">
        <div class="noticebox-img"><i class="fa-solid fa-list"></i>공지사항</div>
        <p>· 새 글쓰기, 게시물 상세 내용은 로그인 후 이용 및 확인이 가능합니다.</p>
        <p>· 공지사항 필독, 위반사항에 대해서 랭스터디카페는 책임을 지지 않습니다.</p>
        <p>· 서로를 위해 존중하고 배려해 주세요.</p>
    </div>

    <div class="community-detail-main">
        <i class="fa-solid fa-circle-user"></i>
        <p>신청자:${nickname}</p>

        <table class="community-detail-table">
            <tr>
                <td>내용</td>
                <td>
                    ${applyStudyDTO.as_content_String}
                </td>
            </tr>
        </table>

        <div class="community-detail-btns">
            <a href="CommunityPage"><i class="fa-regular fa-circle-left"></i>목록</a>
            <c:choose>
                <c:when test="${login == null}"></c:when>
                <c:when test="${login == applyStudyDTO.as_mem_id}">
                    <div class="community-modify-btn">수정</div>
                    <div class="community-delete-btn">삭제</div>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>


<script type="text/javascript">

        $(".community-modify-btn").click(function (){
            location.href="CommunityApplyModifyForm?as_id=${applyStudyDTO.as_id}"
        })

        $(".community-delete-btn").click(function (){
            location.href="CommunityApplyDeleteForm?as_id=${applyStudyDTO.as_id}&as_mem_id=${applyStudyDTO.as_mem_id}"
        })


</script>