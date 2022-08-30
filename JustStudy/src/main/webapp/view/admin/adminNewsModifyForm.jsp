<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-21
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    $("#r5").attr("checked", true)
    $(".admin-template-header>b").html("뉴스 수정")
    $(".admin-template-header>div").append("<input type='button' id='submit-btn' value='수정' />")

</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<style>
    #main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
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
        width: 1300px;
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
        width: 120px;
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
    #news_title{
        width: 400px;
    }
    #news-thumbnail-img{
        width: 300px;
        height: 300px;
    }
    #news-img{
        width: 1100px;
        height: 600px;
    }
    .file-btn-wrapper{
        width: 1100px;
        height: 50px;
    }
    .file-btn-wrapper>input{
        width: 150px;
        height: 40px;
        margin-left: 80px;
        font-weight: bold;

    }
    #submit-btn{
        width: 100px;
        height: 30px;
        font-weight: bold;
        margin: 30px 10px 20px 650px;
    }
    img{
        border-radius: 7px;
    }

</style>


<script>
    <%
        if(request.getAttribute("msg") != null){%>
    alert("<%=request.getAttribute("msg")%>")
    <%}%>
</script>

<div id="main">
    <form action="AdminNewsModifyReg" name="myform" method="post" enctype="multipart/form-data"
          class="admin-modify-form" >
        <input type="hidden" name="news_id" value="${dto.news_id}">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th>타이틀</th>
                <td><input type="text" id="news_title" name="news_title" value="${dto.news_title}">
            </tr>
            <tr>
                <th>뉴스 썸네일 사진</th>
                <c:choose>
                    <c:when test="${dto.news_thumbnail_img != null}">
                        <td>
                            <div class="file-btn-wrapper" >
                                <input type="button" value="썸네일삭제" onclick="deleteThumbNailNewsImg('뉴스썸네일사진삭제')"/>
                            </div>

                            <input type="hidden"  name="news_thumbnail_img" value="${dto.news_thumbnail_img}">
                            <img id="news-thumbnail-img" src="<c:url value="/img/news/${dto.news_thumbnail_img}"/>"/>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>
                            <input type="file" name="news_thumbnail_img" value="">
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <th>뉴스 사진</th>
                <c:choose>
                    <c:when test="${dto.news_img != null}">
                        <td>
                            <div class="file-btn-wrapper">
                                <input type="button" value="파일삭제" onclick="deleteNewsImg('뉴스사진삭제')"/>
                            </div>

                            <input type="hidden"  name="news_img" value="${dto.news_img}">
                            <img id="news-img" src="<c:url value="/img/news/${dto.news_img}"/>"/>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>
                            <input type="file" name="news_img" value="">
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>

            <tr>
                <th>내용</th>
                <td><textarea name="news_content" cols="100%" rows="10">${dto.news_content}</textarea></td>
            </tr>
        </table>
        <%--<input id="submit-btn" type="submit" value="등록">--%>
    </form>
</div>

<script type="text/javascript">


    function deleteNewsImg(pp) {
        $(".admin-modify-form").attr("action", "AdminNewsImgDelete?type=" + pp);
        $(".admin-modify-form").submit();
    }

    function deleteThumbNailNewsImg(pp) {
        $(".admin-modify-form").attr("action", "AdminNewsImgThumbNailDelete?type=" + pp);
        $(".admin-modify-form").submit();
    }



    $("#submit-btn").click(function () {

            const f = document.myform;
            if (f.news_title.value.trim() == "") {
                alert("빈칸을 입력해주세요");
                f.news_title.focus();
                return false;
            }
            if (f.news_thumbnail_img.value == "") {
                alert("썸네일 사진을 첨부해주세요");
                f.news_thumbnail_img.focus();
                return false;
            }
            if (f.news_img.value == "") {
                alert("내용 사진을 첨부해주세요");
                f.news_img.focus();
                return false;
            }
            if (f.news_content.value.trim() == "") {
                alert("빈칸을 입력해주세요");
                f.news_content.focus();
                return false;
            }
            else if(!/^.+\.(jpe?g|gif|png)$/i.test(f.news_thumbnail_img.value)){
                alert("썸네일 사진 파일 형식을 맞춰주세요")
                return false;
            }
            else if(!/^.+\.(jpe?g|gif|png)$/i.test(f.news_img.value)){
                alert("내용 사진 파일 형식을 맞춰주세요")
                return false;
            }
            else{
                $(".admin-modify-form").attr("action", "AdminNewsModifyReg")
                $(".admin-modify-form").submit()
            }


    })

</script>