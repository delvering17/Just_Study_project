<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/16
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    .wrapper-branch-info {
        width: 1200px;
        background: rgb(245, 245, 245);
        margin: 0 auto;
    }

    .branch-info {
        width: 1200px;
        background: rgb(245, 245, 245);
    }

    .branch-info button {
        border: none;
    }

    .branch-info-top {
        width: 1200px;
        position: relative;
        display: flex;

        /* align-items: center;
        flex-direction: row; */
        justify-content: space-between;
    }

    .top-left {
        margin: 40px 0;
        width: 300px;
        height: 100px;
    }

    .top-left-review > p {
        margin-top: 20px;
        margin-bottom: 0;
    }

    .top-right {
        width: 200px;
        height: 100px;

        top: 10px;
        right: 40px;
        position: absolute;
    }

    .branch-info-bottom {
        width: 1200px;
        background: rgb(245, 245, 245);
        display: flex;
        /* align-items: center; */
        flex-direction: column;
        position: relative;
    }

    .branch-info-bottom-items {
        width: 800px;
        background: #ff0;
        margin-bottom: 40px;

        border-top: 1px solid #bbbbbb ;
    }

    .items-header {
        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 40px;
    }

    #bottom-infomation {
        height: 100%;
        display: flex;
        justify-content: space-between;
    }

    #bottom-infomation > img {
        width: 800px;
        height: 400px;
    }

    #information-branch-interaction {
        width: 350px;
        height: 350px;
        background: #fff;
        top: 0;

        margin-top: 140px;
        margin-left: 850px;
        position: fixed;
        display: flex;
        flex-direction: column;
        padding: 30px;
    }

    #information-branch-interaction > #interaction-header {
        margin-bottom: 30px;
        font-size: 1.2rem;
        font-weight: bold;

        margin-bottom: 40px;
    }

    #information-branch-interaction > p {
        font-size: 1.2rem;
    }

    #information-branch-interaction > button {
        height: 50px;

        font-size: 1.2rem;
        color: #fff;

        margin: 20px 0;
    }

    #btn-reservation {
        background: rgb(48, 48, 48);
    }

    #btn-inquiry {
        background: rgb(173, 153, 126);
    }

    #bottom-facilities {
        background: #ff0;
        /* padding: 40px; */
    }

    .facilities-item-wrapper {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 2rem;

        align-items: center;
        justify-content: center;
        text-align: center;

        /* margin: 0 auto; */
    }

    .facilities-item {
        width: 140px;
        height: 100px;

        background: #f00;
    }

    .facilities-item > i {
        font-size: 2.8rem;
    }

    .facilities-item > p {
        margin-top: 15px;
        font-size: 1.2rem;
    }

    #bottom-map {
        z-index: 0;
    }

    #branch-position-map {
        width: 800px;
        height: 300px;

        z-index: 1;
    }

    #bottom-review {
    }

    .review-item {
        margin: 10px 0;
    }

    .review-id {
        font-size: 1.2rem;
        font-weight: 600;
    }

    .review-date {
        color: rgb(125, 125, 125);
    }
    .review-star {
    }

    .review-content {
        font-size: 1rem;
        margin-top: 5px;
    }
</style>


<div class="wrapper-branch-info">
    <div class="branch-info">
        <div class="branch-info-top">
            <div class="top-left">
                <h1>${branchDTO.name}</h1>
                <div class="top-left-review">
                    <p>${reviewAverage}점</p>
                    <a href="">${reviewTotal}개 리뷰</a>

                </div>
            </div>
        </div>
        <div class="branch-info-bottom">
            <div class="branch-info-bottom-items" id="information-branch-interaction">
                <p id="interaction-header">
                    이 스터디룸에 관심이 있으십니까?
                </p>
                <p>클릭하여 바로 예약하세요!</p>
                <button id="btn-reservation">예약하기</button>
                <p>문의사항이 있으신가요?</p>
                <button id="btn-inquiry">문의하기</button>
            </div>

            <div class="branch-info-bottom-items" id="bottom-infomation">
                <img id="information-branch-img" src="<c:url value="/img/branch/"/>${branchDTO.img}"/>
            </div>
            <div class="branch-info-bottom-items" id="bottom-facilities">
                <p class="items-header">편의시설</p>

                <div class="facilities-item-wrapper">
                    <c:forEach items="${facilities}" var="fac">
                        <div class="facilities-item">
                            <c:choose>
                                <c:when test="${fac eq '정수기'}">
                                    <i class="fa-solid fa-glass-water"></i>
                                </c:when>
                                <c:when test="${fac eq '휴게실'}">
                                    <i class="fas fa-couch"></i>
                                </c:when>
                                <c:when test="${fac eq '흡연실'}">
                                    <i class="fas fa-smoking"></i>
                                </c:when>
                                <c:when test="${fac eq '프린터'}">
                                    <i class="fas fa-print"></i>
                                </c:when>
                                <c:when test="${fac eq '빔프로젝터'}">
                                    <i class="fas fa-video"></i>
                                </c:when>
                                <c:when test="${fac eq '컴퓨터'}">
                                    <i class="fas fa-desktop"></i>
                                </c:when>
                                <c:when test="${fac eq '주차'}">
                                    <i class="fas fa-parking"></i>
                                </c:when>
                                <c:when test="${fac eq '와이파이'}">
                                    <i class="fas fa-wifi"></i>
                                </c:when>
                            </c:choose>
                            <p>${fac}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="branch-info-bottom-items" id="bottom-map">
                <p class="items-header">위치</p>
                <div>
                    <p>${branchDTO.address}</p>
                    <p>${branchDTO.addressDetail}</p>

                </div>
                <div id="branch-position-map"></div>
            </div>
            <div class="branch-info-bottom-items" id="bottom-review">
                <p class="items-header">후기</p>
                <c:forEach items="${reviewList}" var="review" varStatus="no">
                    <div class="review-item">
                        <p class="review-id">${review.userNickname}</p>
                        <p class="review-date">${review.reviewDate}</p>
                        <div class="review-star">${review.star}</div>
                        <div class="review-content">${review.content}</div>
                    </div>
                </c:forEach>
                <c:if test="${reviewList.size() eq 0}">
                    <p>후기가 없습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	ff02c77cc518953296a556a4691cd2f8&libraries=services"></script>
<script type="text/javascript">
    $("#btn-reservation").click(function (){
        location.href = "../reservation/Studyroom?city=${branchDTO.city}&branch=${branchDTO.name}"
    })

    $("#btn-inquiry").click(function (){
        location.href = "../mypage/MypageInquiryInsertForm?inquiry_category=예약&inquiry_branch=${branchDTO.name}"
    })


    var mapContainer = document.getElementById('branch-position-map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(${branchDTO.latitude}, ${branchDTO.longitude}), // 지도의 중심좌표
            level: 8 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(${branchDTO.latitude}, ${branchDTO.longitude});

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

</script>
