<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/16
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<style type="text/css">
    * {
        margin: 0;
        padding: 0;




        box-sizing: border-box;
    }

    .wrapper-find-branch {
        width: 100px;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
    }

    .find-branch-top {
        width: 1000px;
        height: 70px;
        background: rgb(245, 245, 245);

        display: flex;
        flex-direction: row;
        align-items: center;
    }

    #input-search {
        width: 300px;
        height: 40px;
        border: none;
        background: rgb(245, 245, 245);
        border: 1px solid #000;
        margin-left: 10px;
    }

    .find-branch-bottom {
        width: 1000px;
        display: flex;
        flex-direction: row;
        /* justify-content: space-between; */
    }

    .find-branch-bottom-left {
        width: 500px;
    }
    .find-branch-bottom-right {
        width: 500px;
        height: 750px;
        background: #ff0;
    }

    ul {
        padding: 0px;
        list-style: none;
    }

    .list-branch {
        display: flex;
    }

    .list-branch > img {
        width: 200px;
    }

    .list-branch > .list-branch-description {
        margin-left: 20px;
    }

    #branch-map {
        width: 500px;
        height: 750px;
    }
</style>

<div class="wrapper-find-branch">
    <div class="find-branch-top">
        <i class="fa fa-search fa-xl"></i>
        <input type="text" id="input-search" placeholder="지점명 검색.."/>
    </div>
    <div class="find-branch-bottom">
        <div class="find-branch-bottom-left list-group">
            <ul>
                <c:forEach items="${arr_BranchDTO}" var="branchDTO">
                    <li class="list-branch list-group-item list-group-item-action" onclick="goBranchInfo('${branchDTO.name}')">
                        <img src="<c:url value="/img/branch/"/>${branchDTO.img}" alt="" />
                        <div class="list-branch-description">
                            <h1>${branchDTO.city}</h1>
                            <h3>${branchDTO.name}</h3>
                            <h5>최고 좋은 ${branchDTO.name} 스터디룸 !</h5>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="find-branch-bottom-right">
            <div id="map" style="width:500px;height:750px;"></div>

        </div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	ff02c77cc518953296a556a4691cd2f8&libraries=services"></script>
<script type="text/javascript">

    function goBranchInfo(i) {
        location.href = "BranchInfo?name=" + i;
    }
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    // var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

    // // 마커를 생성합니다
    // var marker = new kakao.maps.Marker({
    //     position: markerPosition
    // });
    //
    // // 마커가 지도 위에 표시되도록 설정합니다
    // marker.setMap(map);


    //https://xianeml.tistory.com/75
    var geocoder = new kakao.maps.services.Geocoder();

    // // 주소로 좌표를 검색합니다
    geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });

</script>
