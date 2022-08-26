<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script type="text/javascript">
    $("#r5").attr("checked", true)
</script>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    #headline {
        width: 1330px;
        height: 40px;
        background: #fff;
        border-bottom: 1px solid rgb(184, 177, 177);
        padding-top: 15px;
        padding-left: 20px;
        margin-top: 50px;
        margin-left: 239px;
        position: fixed;
        flex-direction: row;
    }

    #headline > b {
        width: 100px;
        font-size: 20px;
    }

    #headline > input {
        float: right;
        margin: 0px 10px 50px 0px;

    }

    #main {
        width: 2000px;
        height: 2000px;
        margin: 0px 0px 0px 220px;
        padding: 120px 20px 20px 40px;
    }

    #main > div:first-of-type > input[type=button] {
        padding: 5px 3px 5px 3px;
        border-radius: 5px;
        border: 0;
        background: rgb(138, 169, 238);
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }

    #main > div:nth-of-type(2) {
        margin: 10px 0px 0px 0px;

    }

    #main > div:nth-of-type(2) > select {
        height: 25px;
        border-radius: 4px;
    }

    #main > div:nth-of-type(2) > button {
        width: 25px;
        height: 25px;
    }

    table {
        width: 400px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
    }

    tr:first-of-type > th:first-of-type,
    tr:first-of-type > th:last-of-type {
        width: 50px;
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    tr:first-of-type > th:nth-of-type(2),
    tr:first-of-type > th:nth-of-type(3),
    tr:first-of-type > th:nth-of-type(4),
    tr:first-of-type > th:nth-of-type(5),
    tr:first-of-type > th:nth-of-type(7),
    tr:first-of-type > th:nth-of-type(8) {
        width: 140px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    tr:first-of-type > th:nth-of-type(6) {
        width: 250px;
        background: rgba(83, 104, 167, 0.856);
        color: #fff;
    }

    td {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .branch:nth-of-type(2n) {
        background: rgba(227, 233, 240, 0.726)
    }
</style>


<div class="wrapper">

    <div id="headline">
        <b>1:1 문의 상세보기</b>
    </div>
    <div id="main">
        <h2>문의</h2>
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>문의 일자</th>
                <td>${inquiryDTO.inquiry_date}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${inquiryDTO.inquiry_title}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${inquiry_writer}</td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>${inquiryDTO.inquiry_category}</td>
            </tr>
            <tr>
                <th>종류</th>
                <td>${inquiryDTO.inquiry_type}</td>
            </tr>
            <tr>
                <th>지점</th>
                <td>${inquiryDTO.inquiry_branch}</td>

            </tr>
            <tr>
                <th>답변 상태</th>
                <c:choose>
                    <c:when test="${inquiryDTO.inquiry_state == 1}">
                        <td>미답변</td>
                    </c:when>
                    <c:otherwise>
                        <td>답변</td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <th>문의 내용</th>
                <td>${inquiryDTO.inquiry_content_String}</td>
            </tr>
        </table>

        <h2>답변</h2>
        <c:choose>
            <c:when test="${inquiryDTO.inquiry_state == 2}">
                <form id="form-answer">
                    <input type="hidden" name="input_purpose" value="${inquiryDTO.inquiry_id}"/>
                    <input type="hidden" name="input_id" value="${answerDTO.inquiry_id}"/>
                    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                        <tr>
                            <th>답변 일자</th>
                            <td><input type="text" name="input_date" id="input-date" value="${answerDTO.inquiry_date}" readonly></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="input_title" id="input-title" value="${answerDTO.inquiry_title}"></td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <input type="hidden" name="input_writer"  value="${answerDTO.inquiry_writer}">
                            <td><input type="text" id="input-writer" value="${answerWriterName}" readonly></td>
                        </tr>
                        <tr>
                            <th>답변 내용</th>
                            <td><textarea name="input_content" id="input-content" cols="30" rows="10">${answerDTO.inquiry_content}</textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="button" onclick="answerInsert()">수정</button>
                                <button type="submit" formaction="AdminInquiryDelete" formmethod="get">삭제</button>
                            </td>
                        </tr>
                        <tr></tr>

                    </table>

            </c:when>
            <c:otherwise>
                <form action="AdminInquiryInsert" method="post" id="inquiry-form1">
                    <input type="hidden" name="input_purpose" value="${inquiryDTO.inquiry_id}"/>
                    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                        <tr>
                            <th>제목</th>
                            <td><input name="input_title" id="input_title1"  type="text" ></td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <input type="hidden" name="input_writer" value="${sessionScope.login}" readonly>
                            <td><input type="text" id="" value="${mem_realname}" readonly></td>
                        </tr>
                        <tr>
                            <th>답변 내용</th>
                            <td><textarea name="input_content" id="input_content1" cols="30" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <button type="button" onclick="inquiryInsert()">답변</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </c:otherwise>

        </c:choose>
                    <a href="AdminInquiryList">목록으로</a>
    </div>
</div>

<script type="text/javascript">
    function inquiryInsert() {
        let input_title1 = $('#input_title1').val()
        let input_content1 = $('#input_content1').val()

        if(input_title1 === '') {
            alert('제목을 입력해주세요.')
            $('#input_title1').focus()
        } else if(input_content1 === '') {
            alert('내용을 입력해주세요.')
            $('#input_content1').focus()
        } else {

            let inquiry_form1 = $('#inquiry-form1');
            inquiry_form1.action = "AdminInquiryInsert"
            inquiry_form1.method = "get"
            inquiry_form1.submit()
        }

    }
    function answerInsert() {
        let input_title = $('#input-title').val()
        let input_content = $('#input-content').val()

        if(input_title === '') {
            alert('제목을 입력해주세요.')
            $('#input-title').focus()
        } else if(input_content === '') {
            alert('내용을 입력해주세요.')
            $('#input-content').focus()
        } else {
            let answer_form = document.getElementById('form-answer');
            answer_form.action = "AdminInquiryModify"
            answer_form.method = "get"
            answer_form.submit()
        }
    }

</script>