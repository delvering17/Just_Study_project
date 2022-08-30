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
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        padding-bottom: 100px;
    }

    .community-top {
        width: 1200px;
        height: 200px;
        text-align: center;
        padding-top: 100px;
        margin: 0 auto;
    }

    #community-title{

        font-weight: bold;
        text-align: center;
    }

    .community-bottom {
        width: 1200px;
        margin: 30px auto;
    }

    .commuity-bottom-selector {
        display: flex;
        flex-direction: row;
    }

    .main-list-selector {
        width: 600px;
        list-style: none;
        font-size: 1.5rem;
        display: flex;
        flex-direction: row;
        margin: 60px auto;
    }

    .main-list-selector > li {
        width: 200px;
        height: 70px;

        border-radius: 7px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .main-form {
        width: 100px;
        height: 40px;
        margin: 0 auto;
        border: 1px solid #000;
        border-radius: 7px;
        display: flex;
        flex-direction: row;
        margin-left: 600px;

    }

    .main-form > a {
        width: 100px;
        justify-content: center;
        text-align: center;
        margin: auto 0;
        color: white;
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

    .main-study-list-wrapper {
        list-style: none;
        margin-top: 30px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 4rem;
        place-items: center;
    }

    .study-list-item {
        width: 250px;
        background: #fff;
    }

    .study-item{
        width: 250px;
        height: 300px;
        border: 1px solid #c2c2c2;
        border-radius: 7px;
    }

    .event-srch-branch{
        font-weight: bold;
        font-size: 1.1rem;
        text-align: center;
        margin: 10px auto;
        color: #99996b;
    }

    .underline{
        width: 210px;
        height: 1px;
        margin: 10px auto;
        background: lightgray;
    }

    .event-srch-title{
        font-weight: bold;
        font-size: 1.1rem;
        text-align: center;
        margin: 20px auto;
        width: 250px;
        height: 50px;
    }

    .listInner{
        width: 250px;
        height: 300px;
    }

    .list-item-sub-text {
        display: flex;
        flex-direction: column;
        text-align: center;
    }

    .study-kind{
        text-align: center;
        font-size: 1rem;
        font-weight: bold;
        width: 250px;
        height: 20px;
        color: #ababab;
    }
    .study-people{
        text-align: center;
        font-size: 1rem;
        font-weight: bold;
        width: 250px;
        height: 40px;
        padding-top: 10px;
    }

    .btn-apply {
        text-align: center;
        width: 100px;
        height: 50px;
        padding: 4px 4px;
        border: 1px solid #000;
        border-radius: 7px;
        margin-left: 90px;
        background: #f0eeee;
    }
    .btn-close{
        text-align: center;
        width: 100px;
        height: 50px;
        border: 1px solid #000;
        margin-left: 90px;
    }

    .community-wrapper a{
        text-decoration: none;
    }
    .community-wrapper a:link{
        color: black;
    }
    .community-wrapper a:visited{
        color: black;
    }
    .community-wrapper a:hover{
        color: purple;
    }
    .community-wrapper a:active{
        color: black;
    }

    #city{
        width: 100px;
        height: 40px;
        text-align: center;
        border-radius: 7px;
    }
    #branch{
        width: 100px;
        height: 40px;
        text-align: center;
        border-radius: 7px;
        margin-left: 10px;
    }
    #search{
        width: 200px;
        height: 40px;
        border-radius: 7px;
        margin-left: 10px;
    }

    .offclicked {
        border: 1px solid #aaa;
    }

    .onclicked {
        border: 1px solid #000;
        font-weight: 600;
    }

</style>


<title>커뮤니티 | ABOUT LANGS :: 랭스 커피&amp;워크 : 랭스터디카페</title>

<div class="community-wrapper">

    <div class="community-top">
        <h1 id="community-title">커뮤니티</h1>
    </div>

    <div class="community-bottom">
        <div class="commuity-bottom-selector">
            <div>
                <select id="city" name="city">
                    <option>전체</option>
                    <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
                        <option>${city}</option>
                    </c:forTokens>
                </select>

            </div>
            <div>
                <select id="branch" name="branch">
                    <option>전체</option>
                </select>
                <%--<select name="jijum">
                    <option value="">지점 선택 👇</option>
                </select>--%>
            </div>
            <form>
                <input type="text" id="search" onkeyup="filter()" placeholder="제목을 입력하세요">
            </form>

            <form class="main-form">
                <a href="CommunityInsertForm">새 글쓰기</a>
            </form>

        </div>
        <div class="commuity-main">
            <ul class="main-list-selector">
                <li class="offclicked" id="select-all"><a href="CommunityPage?category=all" >전체</a></li>
                <li class="offclicked"  id="select-open"><a href="CommunityPage?category=open" >모집중</a></li>
                <li class="offclicked"  id="select-close"><a href="CommunityPage?category=close" >모집완료</a></li>
            </ul>
            <ul class="main-study-list-wrapper">
                <c:forEach items="${mainData}" var="dto" varStatus="no">
                    <div class="listInner">
                        <li class="study-list-item">
                            <div class="study-item">
                                    <p class="event-srch-branch">${dto.location}</p>
                                    <p class="event-srch-title" >${dto.title}</p>
                                <div class="list-item-sub-text">
                                    <p class="study-kind">${dto.studykind}</p>
                                        <hr class="underline">
                                    <p class="study-people">모집인원&nbsp;&colon; ${arr_nowPeople.get(no.index)} / ${dto.people}명</p>
                                </div>
                                <c:choose>
                                    <c:when test="${dto.status == '모집중'}">
                                        <a class="btn-apply" href="CommunityDetail?id=${dto.id}">신청하기</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn-close">신청마감</a>

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

    switch ('<%=request.getParameter("category")%>') {

        case 'all':
            $('#select-all').addClass('onclicked');

            break;
        case 'open':
            $('#select-open').addClass('onclicked');

            break;
        case 'close':
            $('#select-close').addClass('onclicked');
            break;
    }
</script>