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
        안녕하세요 저는 나문의 제목입니다.
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
        ${inquiryDTO.inquiry_content}
    </div>

    <hr>

    <h3>답변</h3>





</div>


