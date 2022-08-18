<%--
  Created by IntelliJ IDEA.
  User: whgml
  Date: 2022-08-18
  Time: 오전 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .txt-wrapper p{
        font-weight: bold;
        font-size: 1rem;
        padding: 2%;
        float: left;
    }
</style>

<form action="CommunityModifyReg">
<table>
    <tr>
        <td>지역</td>
        <td colspan="3">
            <select id="location_01" name="location" class="local-selector">
                <option value="">지역 선택</option>
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
        <td colspan="3"><input type="text" name="pname"></td>
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
        <td>
            <input type="submit" value="수정완료">
        </td>
    </tr>
</table>

</form>