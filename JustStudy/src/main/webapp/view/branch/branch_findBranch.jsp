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
        width: 1000px;
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
            <div class="branch-map"></div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function goBranchInfo(i) {
        location.href = "BranchInfo?name=" + i;
    }


</script>