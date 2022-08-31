<%@ page import="model_p.BranchDTO" %>
<%@ page import="model_p.BranchDAO" %>
<%@ page import="java.util.ArrayList" %>
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
        padding-top: 20px;
        padding-bottom: 60px;
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
        height: 750px;
        overflow: auto;
    }
    .find-branch-bottom-right {
        width: 500px;
        height: 750px;
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

    .branch-ll {
        z-index: 0;
    }
</style>
<%         ArrayList<BranchDTO> arr_BranchDTO = new BranchDAO().branchList();
%>
<div class="wrapper-find-branch">
    <div class="find-branch-top">
        <i class="fa fa-search fa-xl"></i>
        <input type="text" id="search" onkeyup="filter()" placeholder="지점명을 입력하세요">
        <%--        <button onclick="hideMarkers()">asdf</button>--%>
    </div>
    <div class="find-branch-bottom">
        <div class="find-branch-bottom-left list-group "  data-bs-spy="scroll">
            <ul class="branch-ll">
                <c:forEach items="<%=arr_BranchDTO%>" var="branchDTO">
                    <%--                    <li class="list-branch list-group-item list-group-item-action" onclick="goBranchInfo('${branchDTO.name}')">--%>
                    <li class="list-branch list-group-item list-group-item-action" onclick="goBranchInfo('${branchDTO.name}')">
                        <img src="<c:url value="/img/branch/"/>${branchDTO.img}" alt="" />
                        <div class="list-branch-description">
                            <h1>${branchDTO.city}</h1>
                            <h3 class="branch-name">${branchDTO.name}</h3>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="find-branch-bottom-right">
            <div id="map" style="width:500px;height:750px; z-index: 0"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3c5da3fc6108feaa82c28a0b561cdb3e&libraries=services"></script>
<script type="text/javascript">

    function goBranchInfo(i) {
        location.href = "BranchInfo?name=" + i;
    }


    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(35.95,128.25),
        level: 13
    };

    var map = new kakao.maps.Map(container, options);

    var markers = {};

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


        <% for ( BranchDTO branchDTO :  arr_BranchDTO) {%>

                var coords = new kakao.maps.LatLng(<%=branchDTO.getLatitude()%>, <%=branchDTO.getLongitude()%>);

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'<%=branchDTO.getName()%>'+'</div>'
                });

                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

                markers.<%=branchDTO.getName()%> = marker;

        <% } %>


    function goBranchMap(branchName) {
        alert(branchName);

    }

    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }

    function goBranchInfo(i) {
        location.href = "BranchInfo?name=" + i;
    }

    function hideMarkers() {
        setMarkers(null);
    }

    function setMarkers(map) {
        for(key in markers) {
            markers[key].setMap(map);
        }
    }

    function filter() {
        let search = document.getElementById("search").value.toLowerCase();
        let listInner = document.getElementsByClassName("list-branch");

        for (let i = 0; i < listInner.length; i++) {
            ttsrch = listInner[i].getElementsByClassName("branch-name");
            var nn = ttsrch[0].innerHTML

            if (ttsrch[0].innerHTML.toLowerCase().indexOf(search) != -1) {
                markers[nn].setMap(map);
                listInner[i].style.display = "flex";
            } else {
                markers[nn].setMap(null);
                listInner[i].style.display = "none";
            }
        }
    }

</script>
