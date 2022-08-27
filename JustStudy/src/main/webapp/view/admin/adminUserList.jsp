<%@ page import="model_p.MemberDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-13
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $("#r2").attr("checked", true)
</script>

    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        #headline{
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

        #headline > b{
            width: 100px;
            font-size: 20px;
        }

        #headline > input{
            float: right;
            margin: 0px 10px 50px 0px;

        }

        #main{
            width: 2000px;
            height: 2000px;
            margin: 0px 0px 0px 220px;
            padding: 120px 20px 20px 40px;
        }

        #main > div:first-of-type > form{
            display: flex;
            text-align: center;
        }

        #main > div:first-of-type > form > button{
            padding: 5px 3px 5px 3px;
            border-radius: 5px;
            border: 0;
            background: rgb(138, 169, 238);
            color: #fff;
            cursor: pointer;
            font-size: 15px;
            margin-right: 10px;
        }

        #main > div:first-of-type > form > div:nth-of-type(1){
            width: 150px;
            padding: 5px 3px 5px 3px;
            border-radius: 5px;
            border: 0;
            background: rgb(138, 169, 238);
            color: #fff;
            margin-right: 10px;
        }

        #main > div:first-of-type > form > div:nth-of-type(2){
            width: 80px;
            padding: 5px 3px 5px 3px;
            border-radius: 5px;
            border: 0;
            background: rgb(138, 169, 238);
            color: #fff;
            margin-right: 10px;
        }

        #main > div:nth-of-type(2){
            margin: 10px 0px 0px 0px;

        }

        #main > div:nth-of-type(2) > select{
            height: 25px;
            border-radius: 4px;
        }

        #main > div:nth-of-type(2) > input[type=text]{
            height: 22px;
        }

        #main > div:nth-of-type(2) > button{
            width: 25px;
            height: 25px;
        }

        table{
            border: 1px solid rgb(122, 115, 115);
            margin-top: 10px;

        }

        input[type="checkbox"]{
            margin-right: 5px;
        }

        tr:nth-of-type(5),
        tr:nth-of-type(6),
        tr:nth-of-type(9),
        tr:nth-of-type(10){
            background: rgba(227, 233, 240, 0.726);
        }

        th{
            border: 1px solid rgb(97, 88, 88);
            font-size: 13px;
            padding: 10px 0px 10px 0px;
        }
        td{
            border: 1px solid rgb(97, 88, 88);
            text-align: center;
            font-size: 13px;
            padding: 10px 0px 10px 0px;
        }

        tr > td > div > input[type=radio]{
            margin-left: 20px;
            width: 10px;
        }

        tr:first-of-type > th:first-child{
            height: 50px;
            padding: 10px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(2),
        tr:first-of-type > th:nth-of-type(3){
            width:150px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(4){
            width:100px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(5),
        tr:first-of-type > th:nth-of-type(6),
        tr:first-of-type > th:nth-of-type(7){
            width:220px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(9){
            width: 140px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(8),
        tr:first-of-type > th:last-child{
            width: 50px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:nth-of-type(2) > th{
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:nth-of-type(3) > th:first-child,
        tr:nth-of-type(5) > th:first-child,
        tr:nth-of-type(7) > th:first-child,
        tr:nth-of-type(9) > th:first-child{
            height: 50px;
            padding: 10px;
        }

        tr:nth-of-type(2) > th:first-of-type,
        tr:nth-of-type(4) > th:first-of-type,
        tr:nth-of-type(6) > th:first-of-type,
        tr:nth-of-type(8) > th:first-of-type{
            width: 70px;
        }
    </style>

    <meta charset="UTF-8">
    <title>usermanagement</title>


<div class="wrapper">

    <div id="headline">
        <b>회원관리</b>

    </div>

    <div id="main">
        <div>
            <form action="AdminUserAllList">
                <button type="submit" name="allUserList">전체 목록</button>

                    <div>총 회원수 ${userStatus}명</div>
                    <div>차단 ${blackStatus}명</div>
            </form>
        </div>
        <div>
            <form action="AdminUserListSearch">
                <select name="userList-search">
                    <option value="mem_userid" selected>아이디</option>
                    <option value="mem_nickname">닉네임</option>
                    <option value="mem_realname">이름</option>
                </select>
                <input type="text" name="searchUserList-input" id="searchUserList-input-id"/>
                <button type="submit" ><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>

        </div>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th rowspan="2">회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th rowspan="2">SNS로그인</th>
                <th rowspan="2">주소</th>
                <th rowspan="2">상세주소</th>
                <th rowspan="2">권한</th>
                <th rowspan="2">관리</th>
            </tr>
            <tr>
                <th>비밀번호</th>
                <th>닉네임</th>
            </tr>

            <c:forEach items="${adminData}" var="i">
                <tr>
                    <form action="" method="">
                        <th rowspan="2"><input type="hidden" name="user" value="${i.mem_id}">${i.mem_id}
                        </th>
                        <td>${i.mem_userid}</td>
                        <td>${i.mem_realname}</td>
                        <td rowspan="2">${i.mem_social}</td>
                        <td rowspan="2">${i.mem_address1}</td>
                        <td rowspan="2">${i.mem_address2}</td>
                        <td rowspan="2">${i.mem_level}</td>
                        <td rowspan="2">
                            <c:if test="${i.mem_level==1}">
                                <button formaction="AdminUserModify" formmethod="get">수정</button>
                                <button formaction="AdminUserDelete" formmethod="get">탈퇴</button>
                                <button formaction="AdminBlackListAdd" formmethod="get">블랙</button>
                            </c:if>
                            <c:if test="${i.mem_level==3}">
                                <button formaction="AdminUserModify" formmethod="get">수정</button>
                                <button formaction="AdminUserDelete" formmethod="get">탈퇴</button>
                            </c:if>
                        </td>
                    </form>
                </tr>
                <tr>
                    <td>${i.mem_password}</td>
                    <td>${i.mem_nickname}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>

<script type="text/javascript">

</script>


