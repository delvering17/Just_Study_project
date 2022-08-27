<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<style type="text/css">

    ul > li {
        list-style: none;
    }

    .ul-header {
        margin: 0;
        padding: 0;
    }

    #logo  {
        margin: 0 20px;

        height: 100px;
    }

    .header-wrapper {
        width: 100%;
        position: fixed;
        z-index: 1;
    }

    .header-front {
        background: yellowgreen;
        position: sticky;

        z-index: 2;
    }

    .ul-front-wrapper {
        display: flex;
        flex-direction: row;
    }

    .ul-front-nav-left-wrapper {
        height: 100px;

        display: flex;
        flex-direction: row;

        margin-left: 150px;
    }

    .ul-front-nav-left-wrapper > li {
        /*width: 140px;*/
        margin: auto 30px;
        font-size: 1.4rem;
        font-weight: 600;
    }

    .ul-front-nav-right-wrapper {
        height: 100px;

        display: flex;
        flex-direction: row;

        margin-left: 50px;
    }

    .ul-front-nav-right-wrapper > li{
        margin: auto 30px;
        font-size: 1.5rem;
        font-weight: 600;
    }

    .li-header-front-wrapper {
        display: flex;
        flex-direction: row;
    }

    /* behind*/
    .behind-sizebox {
        margin-left: 290px;
    }

    .header-behind {
        width: 100%;
        background: yellow;

        display: flex;
        flex-direction: row;

        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;

    }

    .ul-behind-nav-left-wrapper {
        display: flex;
        flex-direction: row;

    }

    .ul-behind-wrapper {
        display: flex;
        flex-direction: column;

        /*margin: auto 30px;*/
    }

    /* 드르륵 메뉴 넓이 조정*/
    .ul-behind-nav-left-wrapper > ul:nth-of-type(1) {
        width: 136px;
        background: red;

    }

    .ul-behind-nav-left-wrapper > ul:nth-of-type(2) {
        width: 208px;
        background: red;

    }

    .ul-behind-nav-left-wrapper > ul:nth-of-type(3) {
        width: 197px;
        background: red;

    }

    .ul-behind-nav-left-wrapper > ul:nth-of-type(4) {
        width: 141px;
        background: red;

    }

    .ul-behind-nav-left-wrapper > ul:nth-of-type(5) {
        width: 116px;
        background: red;

    }

    .ul-behind-wrapper > li {
        margin: 5px auto;
    }

    .header-behind a {
        text-decoration: none;
        color: #bbbbbb;
        font-size: 1rem;
    }


    <%--    .wrapper * {--%>
<%--         width: 100%;--%>
<%--         box-sizing: border-box;--%>
<%--         margin: 0;--%>
<%--         padding: 0;--%>
<%--    }--%>

<%--    .header-wrapper {--%>
<%--        width: 100%;--%>
<%--        height: 150px;--%>
<%--        display: flex;--%>

<%--    }--%>


<%--    .wrapper {--%>
<%--        /*width: 100%;*/--%>
<%--        height: fit-content;--%>
<%--        /*background-image: url("--%>
<%--&lt;%&ndash;    <%=request.getContextPath()%> &ndash;%&gt;--%>
<%--    /img/background.jpeg");*/--%>
<%--    }--%>


<%--    .header-logo {--%>
<%--        width: 150px;--%>
<%--        height: 150px;--%>
<%--        /*margin-right: 30px;*/--%>
<%--        position: sticky;--%>
<%--        /*align-items: center;*/--%>
<%--        /*background-color: #fff;*/--%>
<%--        z-index: 3;--%>
<%--    }--%>

<%--    #logo {--%>
<%--        width: 150px;--%>
<%--        height: 150px;--%>

<%--    }--%>

<%--    .nav-wrapper {--%>
<%--        width: 100%;--%>
<%--        height: 150px;--%>
<%--        background: yellowgreen;--%>
<%--        /*border: solid 1px #ff00ff;*/--%>
<%--        position: fixed;--%>
<%--        /*animation: down 0.5s ease;*/--%>
<%--        z-index: 2;--%>
<%--    }--%>

<%--    @keyframes down {--%>
<%--        0% {--%>
<%--            transform: translateY(-150px);--%>
<%--            background: black;--%>

<%--        }--%>
<%--        100% {--%>
<%--            transform: translateY(0px);--%>
<%--        }--%>
<%--    }--%>

<%--    nav {--%>
<%--        position: relative;--%>
<%--        width: 100%;--%>
<%--        height: 0px;--%>
<%--        margin-top: -25px;--%>
<%--        background: transparent;--%>
<%--        /*overflow: hidden;*/--%>

<%--    }--%>


<%--    .gnb {--%>
<%--        width: 1200px;--%>
<%--        position: relative;--%>
<%--        background: white;--%>
<%--        z-index: 3;--%>


<%--        margin: 60px auto 0;--%>


<%--    }--%>


<%--    .gnb > ul {--%>
<%--        height: 100px;--%>
<%--        list-style: none;--%>
<%--        padding: 0;--%>

<%--        display: flex;--%>
<%--        flex-direction: row;--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    .gnb > ul > li > a {--%>
<%--        text-decoration: none;--%>
<%--        color: black;--%>
<%--        font-size: 1rem;--%>
<%--        font-weight: bold;--%>
<%--    }--%>

<%--    .gnb-sub {--%>
<%--        position: absolute; /*이놈*/--%>
<%--        width: 100%;--%>
<%--        height: 100px;--%>
<%--        bottom: 0;--%>
<%--        left: 0;--%>

<%--        transition: .3s linear;--%>
<%--        background: transparent;--%>
<%--        visibility: hidden;--%>
<%--/*        padding-left: 50px;*/--%>

<%--        padding-top: 100px;--%>
<%--        /*padding-bottom: -500px;*/--%>
<%--    }--%>

<%--    .gnb-list-wrapper {--%>
<%--        /*position: absolute;*/--%>
<%--        width: 100%;--%>
<%--        background: #ff0;--%>

<%--        margin: 0 auto;--%>

<%--        display: flex;--%>
<%--        flex-direction: row;--%>
<%--    }--%>

<%--    .gnb-sub-list {--%>

<%--        /*width: fit-content;*/--%>
<%--        list-style: none;--%>
<%--        margin-top: 10px;--%>
<%--        /*visibility: hidden;*/--%>
<%--        align-items: center;--%>
<%--        font-size: 0.9rem;--%>
<%--        padding-left: 0;--%>
<%--    }--%>

<%--    .gnb-sub-list > li {--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    .gnb-sub-list > li > a{--%>
<%--        width: 100%;--%>
<%--        margin: 20px 0px;--%>
<%--        text-align: center;--%>
<%--    }--%>


    .header-behind, .gnb-active {
        /*background: transparent;*/
        /*bottom: -100px;*/
        /*opacity: 1;*/
        /*height: 100px;*/
        visibility: visible;
    }

<%--    a:link {--%>
<%--        color: black;--%>
<%--        text-decoration: none;--%>
<%--    }--%>

<%--    a:visited {--%>
<%--        color: black;--%>
<%--        text-decoration: none;--%>
<%--    }--%>

    /*a:hover {*/
    /*    color: rgb(216, 205, 143);*/
    /*    text-decoration: none;*/
    /*}*/

</style>



    <div class="header-wrapper">
        <div class="header-front">
            <ul class="ul-header ul-front-wrapper">
                <li>
                    <div class="header-logo">
                        <a href="<c:url value="/board/MainPage"/>">
                            <img id="logo" src="<c:url value="/img/inc/logo.png"/>">
                        </a>
                    </div>
                </li>
                <li class="li-header-front-wrapper">
                    <ul class="ul-header ul-front-nav-left-wrapper">
                        <li><a>ABOUT</a></li>
                        <li><a>RESERVATION</a></li>
                        <li><a>COMMUNITY</a></li>
                        <li><a>NOTICE</a></li>
                        <li><a>HELP</a></li>

                    </ul>
                    <ul class="ul-header ul-front-nav-right-wrapper">
                        <c:choose>
                            <c:when test="${sessionScope.login == null}">
                                <li><a href="../member/MemberLoginForm" ><i class="fa-solid fa-user"></i></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="../member/MemberLogout"><i class="fa-solid fa-door-open"></i></a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sessionScope.login == null}">
                                <li><a href="../member/MemberSigninForm" >회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="../mypage/MypageInfomationModifyForm" >마이페이지</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="header-behind">
            <div class="behind-sizebox">

            </div>
            <div class="ul-behind-nav-left-wrapper">
                <ul class="ul-header ul-behind-wrapper">
                    <li><a href="">기업소개</a></li>
                    <li><a href="../branch/BranchFind">지점찾기</a></li>
                </ul>
                <ul class="ul-header  ul-behind-wrapper">
                    <li><a href="../reservation/UsageInfo">이용안내</a></li>
                    <c:choose>
                        <c:when test="${sessionScope.mem_level == 3}">
                            <li><a href="../member/MemberLevelAlert">스터디룸예약</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="../reservation/Studyroom">스터디룸예약</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <ul class="ul-header ul-behind-wrapper">
                    <c:choose>
                        <c:when test="${sessionScope.mem_level == 3}">
                            <li><a href="../member/MemberLevelAlert">스터디모집</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="../community/CommunityPage?category=all">스터디모집</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
                <ul class="ul-header ul-behind-wrapper">
                    <li><a href="../notice/NoticePage">공지사항</a></li>
                    <li><a href="../event/EventPage">이벤트</a></li>
                    <li><a href="../news/NewsPage">뉴스</a></li>
                </ul>
                <ul class="ul-header ul-behind-wrapper">

                    <li><a href="../mypage/MypageInquiryInsertForm">1:1 문의</a></li>
                    <li><a href="../customer/Faq?category=usage">FAQ</a></li>
                </ul>
            </div>
<%--            <ul class="ul-header ">--%>

<%--                <c:if test="${sessionScope.mem_level == 2}">--%>
<%--                    <li><a href="../admin/AdminPage" >관리자 페이지</a></li>--%>
<%--                </c:if>--%>
<%--            </ul>--%>
<%--            <ul class="ul-header">--%>
<%--                <li></li>--%>
<%--                <li></li>--%>
<%--                <li></li>--%>
<%--            </ul>--%>
        </div>
    </div>

</body>
</html>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script defer type="text/javascript">

    const header_front = document.querySelector(".header-front");
    //
    const header_behind = document.querySelector(".header-behind");
    // // const header = document.querySelector(".header-wrapper");
    //
    header_front.addEventListener("mouseover", function () {
        header_behind.classList.add("gnb-active");
        header_behind.style.top = "100px";

    })
    header_front.addEventListener("mouseout", function () {
        header_behind.classList.remove("gnb-active");
        header_behind.style.top = "0px";

    })
    //
    // function navigo() {
    //     /*const main = document.querySelector('.main');*/
    //     const mainheight = main.clientHeight;
    //     document.addEventListener('scroll', onscroll, {passive: true});
    //
    //     function onScroll() {
    //         const scrollposition = pageXOffset;
    //         const nav = document.querySelector('.nav-wrapper');
    //         if (mainheight <= scrollposition) {
    //             nav.classList.add('fix');
    //         } else {
    //             nav.classList.remove('fix');
    //         }
    //     }
    // }

    // const naverLogin = new naver.LoginWithNaverId(
    //     {
    //         clientId: "SM6kP7n6zyadJ15rvs6z",
    //         callbackUrl: "http://localhost:8080/JustStudy_war_exploded2/member/MemberLoginForm"
    //     }
    // );
    // naverLogin.init();

    // const naverLogin = new naver.LoginWithNaverId(
    //     {
    //         clientId: "SM6kP7n6zyadJ15rvs6z",
    //         callbackUrl: "http://localhost:8080/JustStudy_war_exploded2/member/NaverLogin",
    //         loginButton: {color: "green", type: 2, height: 40}
    //     }
    // );
    //
    // function goNaverLogout() {
    //      naverLogin.logout();
    //     location.href = "../member/MemberLogout";
    // }

</script>