<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<style type="text/css">
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    .header-wrapper {
        width: 100%;
        height: 180px;
        display: flex;

    }

    .wrapper {
        width: 100%;
        height: fit-content;
        /*background-image: url("
<%--    <%=request.getContextPath()%> --%>
    /img/background.jpeg");*/
    }


    .header-logo {
        /*width: 150px;*/
        /*height: 150px;*/
        /*margin-right: 30px;*/
        /*display: flex;*/
        /*align-items: center;*/
        /*background-color: #fff;*/
        /*margin-top: -25px;*/
        /*z-index: 3;*/
    }

    #logo {
        width: 150px;
        height: 150px;

    }

    .nav-wrapper {
        width: 100%;
        height: 130px;
        background: white;
        /*border: solid 1px #ff00ff;*/

        position: fixed;
        animation: down 0.5s ease;
        z-index: 2;
    }

    @keyframes down {
        0% {
            transform: translateY(-150px);
            background: black;

        }
        100% {
            transform: translateY(0px);
        }
    }

    nav {
        position: relative;
        width: 100%;
        height: 0px;
        background: red;
        margin-top: -25px;
        background: transparent;
        /*overflow: hidden;*/

    }


    .gnb {
        width: 1200px;
        position: relative;
        background: white;
        z-index: 3;


        margin: 60px auto 0;


    }


    .gnb > ul {
        height: 100px;
        list-style: none;
        padding: 0;

        display: flex;
        flex-direction: row;
        text-align: center;
    }

    .gnb > ul > li > a {
        text-decoration: none;
        color: black;
        font-size: 1rem;
        font-weight: bold;
    }

    .gnb-sub {
        position: absolute; /*이놈*/
        width: 100%;
        height: 200px;
        bottom: 0;
        left: 0;

        transition: .3s linear;
        background: transparent;
        visibility: hidden;
/*        padding-left: 50px;*/

        padding-top: 200px;
        /*padding-bottom: -500px;*/
    }

    .gnb-list-wrapper {
        /*position: absolute;*/
        width: 1200px;
        background: #ff0;

        margin: 0 auto;

        display: flex;
        flex-direction: row;
    }

    .gnb-sub-list {

        /*width: fit-content;*/
        list-style: none;
        margin-top: 10px;
        /*visibility: hidden;*/
        align-items: center;
        font-size: 0.9rem;
        padding-left: 0;
    }

    .gnb-sub-list > li {
        text-align: center;
    }

    .gnb-sub-list > li > a{
        width: 100%;
        margin: 20px 0px;
        text-align: center;
    }


    .gnb-sub, .gnb-active {
        background-color: white;
        /*background: transparent;*/
        /*bottom: -100px;*/
        /*opacity: 1;*/
        /*height: 100px;*/
        visibility: visible;
    }

    a:link {
        color: black;
        text-decoration: none;
    }

    a:visited {
        color: black;
        text-decoration: none;
    }

    a:hover {
        color: rgb(216, 205, 143);
        text-decoration: none;
    }


</style>


<div class="wrapper">

    <div class="header-wrapper">

        <div class="header-logo">
            <a href="header.jsp">
                <%--<img id="logo" src="<%=request.getContextPath()%>/img/logo3.jpg">--%>
            </a>
        </div>

        <div class="nav-wrapper">
            <nav>
                <div class="gnb">
                    <ul>
                        <li>
                            <a>ABOUT</a>
                        </li>
                        <li>
                            <a>RESERVATION</a>
                        </li>
                        <li>
                            <a>COMMUNITY</a>
                        </li>
                        <li>
                            <a>NOTICE</a>
                        </li>
                        <li>
                            <a>HELP</a>
                        </li>
                        <li><a href="?" style="">회원가입</a></li>
                        <li><a id="login" href="?"><i class="fa-solid fa-user"></i></a></li>

                    </ul>
                </div>

                <div class="gnb-sub">
                    <div class="gnb-list-wrapper">
                        <ul class="gnb-sub-list">
                            <li><a href="?">기업소개</a></li>
                            <li><a href="?">기업찾기</a></li>
                        </ul>
                        <ul class="gnb-sub-list">
                            <li><a href="?">이용안내</a></li>
                            <li><a href="?">스터디룸예약</a></li>
                        </ul>
                        <ul class="gnb-sub-list">
                            <li><a href="?">스터디모집</a></li>
                        </ul>
                        <ul class="gnb-sub-list">
                            <li><a href="notice_Notice.jsp">공지사항</a></li>
                            <li><a href="notice_Event.jsp">이벤트</a></li>
                            <li><a href="notice_News.jsp">뉴스</a></li>
                        </ul>
                        <ul class="gnb-sub-list">
                            <li><a href="?">1:1상담</a></li>
                            <li><a href="?">성FAQ</a></li>
                        </ul>
                        <ul class="gnb-sub-list">
                        </ul>
                        <ul class="gnb-sub-list">
                        </ul>
                    </div>
                </div>

            </nav>
        </div>
        <%--    <div class="gnb-login">
                <li><a id="login" href="?"><i class="fa-solid fa-user"></i></a></li>
                <li><a href="?">&nbsp;&nbsp;회원가입</a></li>
            </div>--%>
    </div>
</div>

<script type="text/javascript">

    const nav = document.querySelector("nav");

    const gnbSub = document.querySelector(".gnb-sub");
    // const header = document.querySelector(".header-wrapper");

    nav.addEventListener("mouseover", function () {
        gnbSub.classList.add("gnb-active");
        gnbSub.style.bottom = "-100px";

    })
    nav.addEventListener("mouseout", function () {
        gnbSub.classList.remove("gnb-active");
        gnbSub.style.bottom = "0px";

    })

    function navigo() {
        /*const main = document.querySelector('.main');*/
        const mainheight = main.clientHeight;
        document.addEventListener('scroll', onscroll, {passive: true});

        function onScroll() {
            const scrollposition = pageXOffset;
            const nav = document.querySelector('.nav-wrapper');
            if (mainheight <= scrollposition) {
                nav.classList.add('fix');
            } else {
                nav.classList.remove('fix');
            }
        }
    }
</script>