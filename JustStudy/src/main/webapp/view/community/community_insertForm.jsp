<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-14
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #community-title{
    font-size: 3.5rem;
    font-weight: bold;
    text-align: center;
    margin-top: 150px;
  }

  .info-wrapper{
    width: 80%;
    text-align: center;
    margin-left: 10%;
    margin-top: 150px;
    border: 1px solid #000;
  }
  #img{
    width: 200px;
    height: 200px;
    background: #090930;

    border-radius: 100px;
    margin: 2.5%;
    margin-left: 5%;
  }
  .txt-wrapper{
    width: 80%;
    margin-top: 3%;
    margin-left: 10%;
    border:1px solid #000;
  }
  .txt-wrapper p{
    font-weight: bold;
    font-size: 1rem;
    padding: 2%;
    float: left;
  }

  #location{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-time{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-title{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-name{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-people{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-select{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
  #study-content{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }

  .agree-wrapper{
    width: 80%;
    margin-left: 10%;
    border: 1px solid #000;
  }
</style>
<form action="CommunityInsertReg" method="post">

<%--  <table border="">--%>
<%--    <tr>--%>
<%--      <td width="100px">숫자적어라</td>--%>
<%--      <td  width="500px"><input type="text" name="mstudy"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>작성자</td>--%>
<%--      <td><input type="text"  name="pname"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>타이틀</td>--%>
<%--      <td><input type="text"  name="title"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>내용</td>--%>
<%--      <td><textarea cols="50" rows="5"  name="content" ></textarea></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td colspan="2" align="center">--%>
<%--        <input type="submit" value="등록" />--%>
<%--        <a href="StudyList">목록으로</a>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--  </table>--%>

    <table>
        <tr>
            <td>지역</td>
            <td colspan="3">
                <select id="location_01" name="location" class="local-selector">
                    <option value="">지점 선택</option>
                    <c:forEach items="${branchList}" var="branch" varStatus="no">
                        <option value="${branch.name}">${branch.name}</option>
                    </c:forEach>
                </select></td>
        </tr>
        <tr>
            <td>스터디 기간</td>
            <td><input type="date" name="startdate"></td>
            <td> ~ <input type="date" name="enddate"></td>
            <td></td>
        </tr>
        <tr>
            <td>타이틀</td>
            <td colspan="3"><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>작성자</td>
            <input type="hidden" name="memId" value="${memberDTO.mem_id}"/>
            <td colspan="3"><input type="text" name="nickname" value="${memberDTO.mem_nickname}" readonly></td>
        </tr>
        <tr>
            <td>모집인원</td>
            <td colspan="3"><input type="text" name="people"> 명</td>

        </tr>
        <tr>
            <td>스터디 구분</td>
            <td colspan="3">
                <input type="checkbox" name="studykind" id="all" value="all" data-cate="0" >
                <label for="all">전체</label>
                <input type="checkbox" name="studykind" id="cate_0" value="IT" data-cate="IT" >
                <label for="cate_0">IT</label>
                <input type="checkbox" name="studykind" id="cate_1" value="토익" data-cate="토익">
                <label for="cate_1">토익</label>
                <input type="checkbox" name="studykind" id="cate_2" value="자격증" data-cate="자격증">
                <label for="cate_2">자격증</label>
                <input type="checkbox" name="studykind" id="cate_3" value="기타" data-cate="기타">
                <label for="cate_3">기타</label>
               </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><textarea name="content" cols="50" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox"  id="agree">
                <label for="agree">개인정보취급방침을 읽었으며 이에 동의합니다.</label></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit" value="등록"></td>
        </tr>
    </table>














<%--      <p id="community-title">커뮤니티</p>--%>

<%--  <div class="info-wrapper">--%>
<%--    <div id="img"></div>--%>

<%--  </div>--%>

<%--  <div class="txt-wrapper">--%>
<%--    <div id="location">--%>
<%--      <p>지역</p>--%>
<%--      <input type="text" name="group">--%>
<%--      <input type="text" name="">--%>
<%--      <input type="text" name="">--%>
<%--    </div>--%>
<%--    <div id="study-time" >--%>
<%--      <p>스터디기간</p>--%>
<%--      <input type="date" name="">--%>
<%--      <input type="date" name="">--%>
<%--    </div>--%>
<%--    <div id="study-title">--%>
<%--      <p>타이틀</p>--%>
<%--      <input type="text" name="title">--%>
<%--    </div>--%>
<%--    <div id="study-name" name="">--%>
<%--      <p>작성자</p>--%>
<%--      <input type="text" name="pname">--%>
<%--    </div>--%>
<%--    <div id="study-people">--%>
<%--      <p>모집인원</p>--%>
<%--      <input type="text" name="">--%>
<%--    </div>--%>
<%--    <div id="study-select">--%>
<%--      <p>스터디구분</p>--%>

<%--    </div>--%>
<%--    <div id="study-content">--%>
<%--      <p>내용</p>--%>
<%--      <textarea cols="50" rows="5" name="content"></textarea>--%>
<%--    </div>--%>

<%--    <div class="agree-wrapper">--%>

<%--    </div>--%>

<%--    <input type="submit" value="등록">--%>
<%--    <a href=""></a>--%>
<%--  </div>--%>


</form>
<script>
    const lc = document.getElementById("location_01");
   /* alert('선택된 옵션 value 값=' + lc.options[lc.selectedIndex].value);*/

</script>