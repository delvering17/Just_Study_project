<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model_p.CommunityDTO" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    <c:if test="${msg!=null }">
    alert("${msg}")
    </c:if>
</script>

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

    .community-detail-apply-list{
        width: 60%;
        height: fit-content;
        margin: 70px 0px;
        border-top: 1px black solid ;
    }

    .community-detail-apply-list .fa-circle-user{
        width: fit-content;
        margin-right: 20px;
        color: gray;
        font-size: 5rem;
        float: left;
    }

    .community-detail-apply-list > form > div{
        width: 100%;
        height: fit-content;
        border-bottom: 1px lightgray solid;
        padding: 20px 50px;
        display: flex;
        align-items: center;
    }

    .community-detail-apply-list > form > div > div:first-of-type{
        width: fit-content;
        float: left;
    }

    .community-detail-apply-list > form > div > div:last-of-type{
        width: fit-content;
        float: right;
    }

    .community-detail-apply-list p{
        width: fit-content;
    }

    .community-detail-apply-list input[type=submit]{
        display: block;
    }
</style>

<script type="text/javascript">
    window.onload = function (){
        $(".community-apply-btn").click(function (){
            location.href="CommunityApplyInsertForm?input_purpose=${communityDTO.id}"
        })

        $(".community-modify-btn").click(function (){
            location.href="CommunityModifyForm?id=${communityDTO.id}"
        })

        $(".community-delete-btn").click(function (){
            location.href="CommunityDeleteForm?id=${communityDTO.id}"
        })
    }

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
        <p>${communityDTO.location}</p>
        <h2>${communityDTO.title}</h2>
        <p>개설자: ${communityDTO.nickname}</p>
        <p>등록일: ${communityDTO.regDate}</p>

        <table class="community-detail-table">
            <tr>
                <td>스터디 구분</td>
                <td>${communityDTO.studykind}</td>
            </tr>
            <tr>
                <td>스터디 모집기간</td>
                <td>${communityDTO.startdate} ~ ${communityDTO.enddate}</td>
            </tr>
            <tr>
                <td>모집 인원</td>
                <td>${communityDTO.people}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td>${communityDTO.contentBr}</td>
            </tr>
            <tr>
                <td>오픈채팅 URL</td>
                <td>${communityDTO.openChatting}</td>
            </tr>
        </table>

        <div class="community-detail-btns">
            <a href="CommunityPage"><i class="fa-regular fa-circle-left"></i>목록</a>
            <c:choose>
                <c:when test="${login == null}"></c:when>
                <c:when test="${login == communityDTO.memId}">
                    <div class="community-modify-btn" onclick="">수정</div>
                    <div class="community-delete-btn">삭제</div>
                </c:when>
                <c:otherwise>
                    <div class="community-apply-btn">신청하기</div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="community-detail-apply-list">
            <c:forEach items="${applyList}" var="apply" varStatus="no">
                <form action="CommunityApplyAnswer">
                    <input type="hidden" name="studyId" value="${communityDTO.id}"/>
                    <input type="hidden" name="as_id" value="${apply.as_id}"/>
                    <div>
                        <i class="fa-solid fa-circle-user"></i>
                        <div>
                            <p>${applyMemList[no.index].mem_nickname}</p>
                            <p>${apply.as_content}</p>
                        </div>
                        <div>
                            <input type="submit" name="answer" value="승인"/>
                            <input type="submit" name="answer" value="반려"/>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>
</div>
