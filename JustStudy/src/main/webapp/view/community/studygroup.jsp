<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.ArrayList" %><%--
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
                <select name="city">
                    <option>전체</option>
                    <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
                        <option>${city}</option>
                    </c:forTokens>
                </select>
                <%--<select name="local">
                    <option value="">지역 선택 👇</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                </select>--%>
            </div>
            <div>
                <select name="branch">
                    <option>전체</option>
                </select>
                <%--<select name="jijum">
                    <option value="">지점 선택 👇</option>
                </select>--%>
            </div>
            <form>
                <input type="text" id="search" onkeyup="filter()" placeholder="제목을 입력하세요">
            </form>

        </div>
        <div class="commuity-main">
            <ul class="main-list-selector">
                <li><a href="CommunityPage?category=all" >전체</a></li>
                <li><a href="CommunityPage?category=open" >모집중</a></li>
                <li><a href="CommunityPage?category=close" >모집완료</a></li>
            </ul>

            <form class="main-form">
                <a href="CommunityInsertForm">새 글쓰기</a>
            </form>
            <ul class="main-study-list-wrapper">
                <c:forEach items="${mainData}" var="dto" varStatus="no">
                    <div class="listInner">
                        <li class="study-list-item">
                            <div>
                                    <p class="event-srch-branch">${dto.location}</p>
                                    <span class="event-srch-title" style="display: inline">${dto.title}</span>
                                <div class="list-item-sub-text">
                                    <p>${dto.studykind}</p>
                                    <p>모집인원&nbsp;&colon; ${arr_nowPeople.get(no.index)} / ${dto.people}명</p>
                                </div>
                                <c:choose>
                                    <c:when test="${dto.status == '모집중'}">
                                        <a class="btn-apply" href="CommunityDetail?id=${dto.id}">신청하기</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a>신청마감</a>

                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </div>
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

    function filter() {
        let search = document.getElementById("search").value.toLowerCase();
        let listInner = document.getElementsByClassName("listInner");

        for (let i = 0; i < listInner.length; i++) {
            ttsrch = listInner[i].getElementsByClassName("event-srch-title");

            if (ttsrch[0].innerHTML.toLowerCase().indexOf(search) != -1
            ) {
                listInner[i].style.display = "inline"
            } else {
                listInner[i].style.display = "none"
            }
        }

    }


    <%ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");%>

    $("select[name=city]").change(function (){
        $("select[name=branch]").html("<option>전체</option>")
        <%for(BranchDTO branchDTO : branchList){%>
        if($("select[name=city]").val() == "<%=branchDTO.getCity()%>"){
            $("select[name=branch]").append("<option><%=branchDTO.getName()%></option>")
        }
        <%}%>
    });


/////////////////////////////////////////////////////////////////


    $(function(){
        $('select[name="branch"] ').on('change', function()  {

            let search = $('select[name="branch"]').val();
            let listInner = document.getElementsByClassName("listInner");

            for (let i = 0; i < listInner.length; i++) {
                ttsrch = listInner[i].getElementsByClassName("event-srch-branch");

                if (ttsrch[0].innerHTML.toLowerCase().indexOf(search) != -1
                ) {
                    listInner[i].style.display = "inline"
                } else {
                    listInner[i].style.display = "none"
                }
            }

        });
    });




</script>