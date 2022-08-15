<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/15
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
</script>

<style>

    .mypage-inquiry {
        width: 900px;
        height: 100%;
        background: #F5F5F5;

    }

    .inquiry-top {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        font-size: 1rem;
        /* text-align: center; */
    }

    .inquiry-top button {
        border: 1px solid #a9a8a8;
        background: rgba(0, 0, 0, 0);
    }

    .inquiry-top > p{
        /* font-size: 1.2rem; */
        width: 150px;
        font-size: 1.2rem;
        vertical-align: middle;
        margin-block-start: 1em;
        text-align: center;
    }

    .inquiry-top > #inquiry-date-wave {
        width: 50px;
        text-align: center;
    }

    .top-dateselect-wrapper {
        width: 220px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .btn-inquiry {
        width: 60px;
        height: 40px;
    }

    #submit-find {
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .inquiry-top > .top-datepicker {
        width: 150px;
        height: 40px;
    }

    .inquiry-items {
        display: flex;
        flex-direction: row;
    }

    .inquiry-bottom {
        width: 500px;
        background: #ff0;
        margin: 0 auto;

    }

    .inquiry-bottom > a {
        width: 40px;
        /*background: #fff;*/
    }

    .inquiry-bottom > .inquiry-bottom-button {
        width: 60px;
        background: rgb(28, 63, 90);
        color: white;
    }





</style>
<div class="mypage-inquiry">
    <div class="inquiry-top">
        <p>문의일자 조회</p>
        <div class="top-dateselect-wrapper">
            <button class="btn-inquiry">오늘</button>
            <button class="btn-inquiry">7일</button>
            <button class="btn-inquiry">1개월</button>
            <button class="btn-inquiry">3개월</button>
        </div>
        <input class="top-datepicker" type="date">
        <p id="inquiry-date-wave">&#126;</p>
        <input class="top-datepicker" type="date">
        <button type="submit" class="btn-inquiry" id="submit-find">조회</button>
    </div>

    <hr/>
    <div class="inquiry-main">
        <c:forEach items="${arr_inquiryDTO}" var="inquiryDTO">
            <div class="inquiry-items">
                <div class="inquiry-items-title">
                    <a href="MypageInquiryDetail?inquiry_id=${inquiryDTO.inquiry_id}&nowPage=${nowPage}">${inquiryDTO.inquiry_title}</a>
                </div>
                <div class="inquiry-items-category">
                        ${inquiryDTO.inquiry_category}

                </div>
                <div class="inquiry-items-type">
                        ${inquiryDTO.inquiry_type}

                </div>
                <div class="inquiry-items-date">
                    ${inquiryDTO.inquiry_date_String}

                </div>
                <div class="inquiry-items-state">
                    ${inquiryDTO.inquiry_state}
                </div>
            </div>
        </c:forEach>
<%--        <p>문의하신 내용이 없습니다</p>--%>
    </div>
    <hr/>

    <div class="inquiry-bottom">
            <c:if test="${firstPage > 1}">
                <a class="inquiry-bottom-button" href="?nowPage=${firstPage - 1}" >이전</a>
            </c:if>
            <c:forEach begin="${firstPage}" end="${endPage}" var="i">
                <c:choose>
                    <c:when test="${i == nowPage}">
                        [${i}]
                    </c:when>
                    <c:otherwise>
                        <a href="?nowPage=${i}" >${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${endPage < totalPage}">
                <a class="inquiry-bottom-button" href="?nowPage=${endPage + 1}" >다음</a>
            </c:if>
    </div>

    <hr/>


</div>