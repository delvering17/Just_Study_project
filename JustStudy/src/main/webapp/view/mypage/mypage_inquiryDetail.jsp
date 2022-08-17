<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: song-chanwook
  Date: 2022/08/15
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">

</style>

<div>
    <h1>1:1 문의</h1>
    <hr>
    <div>
        <h3>질문</h3>
        <p>제목</p>${inquiryDTO.inquiry_title}
    </div>
    <div>
        <p>카테고리</p>${inquiryDTO.inquiry_category}
    </div>
    <div>
        <p>종류</p>${inquiryDTO.inquiry_type}
    </div>
    <div>
        <p>문의 일자</p>${inquiryDTO.inquiry_date_String}
    </div>
    <div>
        <p>답변 상태</p>${inquiryDTO.inquiry_state}
    </div>
    <hr>

    <div>
        ${inquiryDTO.inquiry_content_String}
    </div>

    <hr>

    <c:if test="${answerDTO != null}">
        <div>
            <h3>답변</h3>
            <p>제목</p>${answerDTO.inquiry_title}
        </div>
        <div>
            <p>문의 일자</p>${answerDTO.inquiry_date_String}
        </div>
        <div>
                ${answerDTO.inquiry_content_String}
        </div>
    </c:if>


    <c:if test="${date_period != null}">
        <a href="MypageInquiryList?nowPage=${nowPage}&date_period=${date_period}">목록으로</a>
    </c:if>
    <c:if test="${date_before != null}">
        <a href="MypageInquiryList?nowPage=${nowPage}&date_before=${date_before}&date_after=${date_after}">목록으로</a>
    </c:if>
</div>


</div>


