<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-13
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    .community-wrapper {
        width: 100%;

    }

    .community-top {
        text-align: center;
        font-size: 3.4rem;
        font-weight: bold;
    }

    .community-bottom {
        width: 1200px;
        background: #ff0;
        margin: 0 auto;
    }

    .commuity-bottom-selector {

        display: flex;
        flex-direction: row;

        background: white;
    }

    .main-list-selector {
        width: 600px;
        list-style: none;
        font-size: 1.5rem;

        display: flex;
        flex-direction: row;
        margin: 0 auto;
    }

    .main-list-selector > li {
        width: 200px;
        height: 70px;
        border: 1px solid #aaa;

        display: flex;
        align-items: center;
        justify-content: center;

    }

    dl, ol, ul {
        padding-left: 0px;
        margin-bottom: 0px;

    }

    .main-form {

        width: 1000px;
        height: 100px;
        margin: 0 auto;
        background: #f0f;

        display: flex;
        flex-direction: row;
    }

    .main-form > p {

        width: 200px;
        height: 50px;
        text-align: center;
        font-weight: bold;
        font-size: 1.1rem;
        line-height: 50px;
        margin: auto 0;

        border-right: 1px solid #aaa;
    }

    .main-form > a {
        width: 100px;
        justify-content: center;
        margin: auto 0;
    }

    .label-main-form {
        width: 60px;

        display: flex;
        align-items: center;
    }

    .main-form-item-wrapper {

        margin-left: 20px;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
    }

    .main-study-list-wrapper {
        list-style: none;

        margin-top: 30px;

        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 2rem;
        place-items: center;


    }

    .study-list-item {

        width: 200px;
        border: 1px solid #aaa;
        background: #fff;
    }

    .list-item-sub-text {

        display: flex;
        flex-direction: column;
        text-align: center;

    }

    .btn-apply {
        text-align: center;
    }


</style>


<title>커뮤니티 | ABOUT LANGS :: 랭스 커피&amp;워크 : 랭스터디카페</title>

<div class="community-wrapper">
    <div class="community-top">
        <p>커뮤니티</p>
    </div>
    <div class="community-bottom">
        <div class="commuity-bottom-selector">
            <div>
                <select>
                    <option value="">지역 선택 👇</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="인천">인천</option>
                    <option value="광주">광주</option>
                    <option value="대전">대전</option>
                    <option value="울산">울산</option>
                    <option value="세종">세종</option>
                    <option value="경기">경기</option>
                    <option value="강원">강원</option>
                    <option value="충북">충북</option>
                    <option value="충남">충남</option>
                    <option value="전북">전북</option>
                    <option value="전남">전남</option>
                    <option value="경북">경북</option>
                    <option value="경남">경남</option>
                    <option value="제주">제주</option>
                </select>
            </div>
            <form>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button">검색</button>
            </form>
        </div>
        <div class="commuity-main">
            <ul class="main-list-selector">
                <li><a href="" >전체</a></li>
                <li><a href="" >모집중</a></li>
                <li><a href="" >모집완료</a></li>
            </ul>

            <form class="main-form">
                <p>스터디 구분</p>
                <div class="main-form-item-wrapper">
                <input class="input-main-form" type="checkbox" name="devision02" id="all" data-cate="0" checked>
                <label class="label-main-form" for="all" >전체</label>
                <input class="input-main-form" type="checkbox" name="devision02" id="cate_0" data-cate="IT" checked>
                <label class="label-main-form" for="cate_0">IT</label>
                <input class="input-main-form" type="checkbox" name="devision02" id="cate_1" data-cate="토익" checked>
                <label class="label-main-form" for="cate_1">토익</label>
                <input class="input-main-form" type="checkbox" name="devision02" id="cate_2" data-cate="자격증" checked>
                <label class="label-main-form" for="cate_2">자격증</label>
                <input class="input-main-form" type="checkbox" name="devision02" id="cate_3" data-cate="기타" checked>
                <label class="label-main-form" for="cate_3">기타</label>
                </div>
                <a href="">새 글쓰기</a>
            </form>
            <ul class="main-study-list-wrapper">
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate var = "today" value="${now}" pattern="yyyy-MM-dd"/>

                <c:forEach items="${mainData}" var="dto" varStatus="no">
                        <li class="study-list-item">
                            <div>
                                <p>${dto.location}</p>
                                <p>${dto.title}</p>
                                <div class="list-item-sub-text">
                                    <p>${dto.studykind}</p>
                                    <p>모집인원&nbsp;&colon; ${dto.people}명</p>
                                </div>
                                <c:choose>
                                    <c:when test="${today < dto.enddate}">
                                        <a class="btn-apply" href="CommunityDetail?id=${dto.id}">신청하기</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a>신청마감</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<a href="#none" class="top_btn"></a>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script>
    $(document).ready( function() {

        $('.commu_list_area').isotope({
            itemSelector: '.commu_list',
        });

        $('.tabmenu').on( 'click', 'li', function() {
            var filterValue = $(this).children().attr('data-filter');
            $('.commu_list_area').isotope({ filter: filterValue });
            $('.tabmenu li').removeClass('on');
            $(this).addClass('on');
        });
    })

</script>