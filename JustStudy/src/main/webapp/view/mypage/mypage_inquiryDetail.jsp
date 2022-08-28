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
    .inquiry-insert {
        width: 700px;
        margin-top: 50px;

    }

    .inquiry-insert-form-items {
        display: flex;
    }

    .inquiry-insert-form-items > p {
        width: 100px;
        height: 40px;
        font-size: 1.2rem;
    }

    .inquiry-insert-form-items .user-input{
        width: 400px;
        height: 40px;
        border: 0;
    }

    .inquiry-insert-form-items .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    .inquiry-insert-form-items #btn-memberclose {
        background: rgb(173, 153, 126);
    }

    .inquiry-insert-form-items #btn-confirm-modify {
        background: rgb(48, 48, 48);
    }

    #inquiry-insert-confirm-wrapper {
        width: 400px;
        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-around;
    }

    #inquiry-insert-confirm-wrapper > .btn-modify{
        width:150px;
    }

    .user-input-radio {
        width: 20px;
        height: 20px;
        margin: 0 10px;
    }

    #input_branch {
        width: 120px;
        height: 30px;
    }

    .input-content {
        width: 400px;

    }

    .btn-golist {
        width: 100px;
        margin-left: 50% ;
        text-decoration: none;
        color: black;
    }

    .btn-golist:hover {
        color: rgb(173, 153, 126);

    }
</style>

<div>
    <h1>1:1 문의</h1>
    <hr>
    <h3>질문</h3>
    <ul>
        <li class="inquiry-insert-form-items">
            <p>제목</p>
            <input type="text" class="user-input" name="input_title"  value="${inquiryDTO.inquiry_title}" id="input-title" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>문의일자</p>
            <input type="text" class="user-input" name="input_title"  value="${inquiryDTO.inquiry_date_String}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>카테고리</p>
            <input type="text" class="user-input" name="input_title"  value="${inquiryDTO.inquiry_category}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>종류</p>
            <input type="text" class="user-input" name="input_title"  value="${inquiryDTO.inquiry_type}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>지점</p>
            <input type="text" class="user-input" name="input_title"  value="${inquiryDTO.inquiry_branch}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>문의 내용</p>
            <textarea class="input-content" name="input_content" cols="30" rows="10" readonly>
                ${inquiryDTO.inquiry_content_String}
            </textarea>
        </li>
    </ul>
    <hr>
    <ul>
        <li class="inquiry-insert-form-items">
            <p>제목</p>
            <input type="text" class="user-input" name="input_title"  value="${answerDTO.inquiry_title}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>답변일자</p>
            <input type="text" class="user-input" name="input_title"  value="${answerDTO.inquiry_date_String}" readonly>
        </li>
        <li class="inquiry-insert-form-items">
            <p>답변 내용</p>
            <textarea class="input-content"  name="input_content"  cols="30" rows="10" readonly>
                ${inquiryDTO.inquiry_content_String}
            </textarea>
        </li>
    </ul>


    <c:if test="${date_period != null}">
        <a class="btn-golist" href="MypageInquiryList?nowPage=${nowPage}&date_period=${date_period}">목록으로</a>
    </c:if>
    <c:if test="${date_before != null}">
        <a class="btn-golist" href="MypageInquiryList?nowPage=${nowPage}&date_before=${date_before}&date_after=${date_after}">목록으로</a>
    </c:if>

</div>


</div>


