<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-12
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/plugin/slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<style>
    .mainpage-bg, #slider-div{
        width: 100%;
        height: 100%;
    }

    #slider-div>img:nth-of-type(1){
        width: 100vw;
        height: 100vh;
    }

</style>

<div class="mainpage-bg">
    <div id="slider-div">
        <img src="../img/main/main_img_1.png" alt="">
        <img src="../img/main/main_img_2.png" alt="">
        <img src="../img/main/main_img_3.png" alt="">
    </div>
</div>

<script type="text/javascript">
        $('#slider-div').slick({
            slide: 'img',		//슬라이드 되어야 할 태그 ex) div, li
            infinite : true, 	//무한 반복 옵션
            slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
            speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
            dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,			// 자동 스크롤 사용 여부
            autoplaySpeed : 3000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : false,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,		// 세로 방향 슬라이드 옵션
/*            prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정*/
/*            dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정*/
            draggable : true, 	//드래그 가능 여부

/*            responsive: [ // 반응형 웹 구현 옵션
                {
                    breakpoint: 960, //화면 사이즈 960px
                    settings: {
                        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                        slidesToShow:3
                    }
                },
                {
                    breakpoint: 768, //화면 사이즈 768px
                    settings: {
                        //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                        slidesToShow:2
                    }
                }
            ]*/
        });
</script>