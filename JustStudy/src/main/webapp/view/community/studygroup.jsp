<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-13
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link href="../css/style.css?after" rel="stylesheet" >
    <link href="../css/sub.css?after" rel="stylesheet" >
    <link rel="stylesheet" href="../css/community.css?after">


<title>커뮤니티 | ABOUT LANGS :: 랭스 커피&amp;워크 : 랭스터디카페</title>

<div id="content" class="sub_content">
    <div class="page_title_area">
        <p class="page_title title t_center">커뮤니티</p>
    </div>
    <!-- commu start -->
    <div class="commu">
        <div class="inner_1168">
            <div class="rel">
                <div class="search_wrap clearfix">
                    <div class="location_list">
                        <select id="location_01" class="local-selector">
                            <option value="">지역</option>
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
                    <form class="search" method="post" onsubmit="return false;">
                        <input type="text" placeholder="검색어를 입력하세요">
                        <button type="button" class="search_btn"></button>
                    </form>
                </div>
                <div class="comm_change_wrap">
                    <ul class="tabmenu fs_def inner">
                        <li class="on"><a href="#none" data-sca="">전체</a></li>
                        <li class=""><a href="#none" data-sca="ing">모집중</a></li>
                        <li class=""><a href="#none" data-sca="end">모집완료</a></li>
                    </ul>


                    <form class="devision_wrap" method="">
                        <p class="devision_ttl">스터디 구분</p>
                        <input type="checkbox" name="devision02" id="all" data-cate="0" checked>
                        <label for="all">전체</label>
                        <input type="checkbox" name="devision02" id="cate_0" data-cate="IT" checked>
                        <label for="cate_0">IT</label>
                        <input type="checkbox" name="devision02" id="cate_1" data-cate="토익" checked>
                        <label for="cate_1">토익</label>
                        <input type="checkbox" name="devision02" id="cate_2" data-cate="자격증" checked>
                        <label for="cate_2">자격증</label>
                        <input type="checkbox" name="devision02" id="cate_3" data-cate="기타" checked>
                        <label for="cate_3">기타</label>

                        <a href="CommunityInsertForm" class="devision_btn">새 글쓰기</a>
                    </form>
                    <ul class="commu_list_area fs_def">
                       <%-- if(신청마감이면){--%>
                        <c:forEach items="${mainData}" var="dto" varStatus="no">
                            <li class="commu_list deadline">
                                <div class="commu_list_wrap">
                                    <p class="commu_region no_b16">${dto.location}</p>
<%--                                    <div class="commu_profile bg" style="background-image:url('../img/common/user_noimg.png')"></div>--%>
                                    <p class="commu_title">${dto.title}</p>
                                    <div class="commu_cont fs_def t_center">

                                        <p class="commu_name no_r16">
                                                ${dto.studykind}                                           </p>
                                        <p class="commu_recruit no_b16">모집인원&nbsp; &colon; &nbsp;</p>
                                        <p class="commu_num no_r16">${dto.people}명</p>
                                    </div>
                                    <a href="CommunityDetail" class="commu_apply deadline">신청마감</a>
                                </div>
                            </li>
                        </c:forEach>
                        <%--}else {--%>
                   <%--     <c:forEach items="${mainData}" var="dto" varStatus="no"> // 이거 전체 묶을건지 이따보셈
                            <li class="commu_list ">
                                <div class="commu_list_wrap">
                                    <p class="commu_region no_b16">${dto.location}</p>
                                    <div class="commu_profile bg" style="background-image:url('../img/common/user_noimg.png')"></div>
                                    <p class="commu_title">${dto.title}</p>
                                    <div class="commu_cont fs_def t_center">

                                        <p class="commu_name no_r16">
                                                ${dto.studykind}                                           </p>
                                        <p class="commu_recruit no_b16">모집인원&nbsp; &colon; &nbsp;</p>
                                        <p class="commu_num no_r16">${dto.people}명</p>
                                    </div>
                                    <a href="CommunityDetail" class="commu_apply ">신청하기</a>
                                </div>
                            </li>
                        </c:forEach>--%>
                       <%-- } // else닫기--%>

                    </ul>
                    <div class="paging fs_def t_ccommu">
                        <ul class="paging_ul fs_def">      <li class="on"><span>1</span></li>
                            <li><a href="/html/community.html?type=list&comm_type=&page=2">2</a></li>
                            <li><a href="/html/community.html?type=list&comm_type=&page=3">3</a></li>
                            <li><a href="/html/community.html?type=list&comm_type=&page=4">4</a></li>
                            <li><a href="/html/community.html?type=list&comm_type=&page=5">5</a></li>
                        </ul>   <a href="/html/community.html?type=list&comm_type=&page=6" class="paging_prevnext paging_next"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //commu end -->
    <!-- <script type="text/javascript" src="/js/community.js">

    </script> -->
</div>
<a href="#none" class="top_btn"></a>