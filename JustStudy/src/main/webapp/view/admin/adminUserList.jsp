<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-13
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <style type="text/css">

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

        #main > div:first-of-type > input[type=button]{
            padding: 5px 3px 5px 3px;
            border-radius: 5px;
            border: 0;
            background: rgb(138, 169, 238);
            color: #fff;
            cursor: pointer;
            margin-top: 10px;
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
        }

        tr:first-of-type > th:nth-of-type(2),
        tr:first-of-type > th:nth-of-type(3){
            width:180px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

        tr:first-of-type > th:nth-of-type(4),
        tr:first-of-type > th:nth-of-type(5),
        tr:first-of-type > th:nth-of-type(6),
        tr:first-of-type > th:nth-of-type(7),
        tr:first-of-type > th:nth-of-type(8),
        tr:first-of-type > th:nth-of-type(9){
            width: 140px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }

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

<div class="wrapper">

    <div id="headline">
        <b>회원관리</b>
        <input type="button" value="선택수정">
        <input type="button" value="선택삭제">
    </div>

    <div id="main">
        <div>
            <input type="button" value="전체목록"/>
            <input type="button" value="총 회원수 3,548명"/>
            <input type="button" value="차단 0명"/>
            <input type="button" value="탈퇴 43명"/>
        </div>
        <div>
            <select name="sortfillter">
                <option selected>아이디</option>
                <option>닉네임</option>
                <option>이름</option>
                <option>이메일</option>
                <option>전화번호</option>
                <option>가입일시</option>
            </select>
            <input type="text">
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th rowspan="2"><input type="checkbox" name="user" onclick="selectAll(this)"></th>
                <th colspan="2">아이디</th>
                <th rowspan="2">본인확인</th>
                <th>메일인증</th>
                <th>정보공개</th>
                <th>메일수신</th>
                <th>상태</th>
                <th>휴대폰</th>
                <th>마지막스터디</th>
                <th rowspan="2">관리</th>
            </tr>
            <tr>
                <th>이름</th>
                <th>닉네임</th>
                <th>SMS수신</th>
                <th>본인인증</th>
                <th>접근차단</th>
                <th>권한</th>
                <th>전화번호</th>
                <th>가입일</th>
            </tr>
            <tr>
                <th rowspan="2"><input type="checkbox" name="user"></th>
                <td colspan="2">*******</td>
                <td rowspan="2">
                    <input type="radio" name="certification">간편인증<br/>
                    <input type="radio" name="certification">휴대폰<br/>
                    <input type="radio" name="certification">아이핀<br/>
                </td>
                <td style="color: red">Yes</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>정상</td>
                <td></td>
                <td></td>
                <td rowspan="2">
                    <input type="button" value="수정">
                    <input type="button" value="그룹">
                </td>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>
                    <select name="powerlevel">
                        <option>1</option>
                        <option selected>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th rowspan="2"><input type="checkbox"  name="user"></th>
                <td colspan="2">*******</td>
                <td rowspan="2">
                    <input type="radio" name="certification">간편인증<br/>
                    <input type="radio" name="certification">휴대폰<br/>
                    <input type="radio" name="certification">아이핀<br/>
                </td>
                <td style="color: red">Yes</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>정상</td>
                <td></td>
                <td></td>
                <td rowspan="2">
                    <input type="button" value="수정">
                    <input type="button" value="그룹">
                </td>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>
                    <select name="powerlevel">
                        <option>1</option>
                        <option selected>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th rowspan="2"><input type="checkbox" name="user"></th>
                <td colspan="2">*******</td>
                <td rowspan="2">
                    <input type="radio" name="certification">간편인증<br/>
                    <input type="radio" name="certification">휴대폰<br/>
                    <input type="radio" name="certification">아이핀<br/>
                </td>
                <td style="color: red">Yes</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>정상</td>
                <td></td>
                <td></td>
                <td rowspan="2">
                    <input type="button" value="수정">
                    <input type="button" value="그룹">
                </td>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>
                    <select name="powerlevel">
                        <option>1</option>
                        <option selected>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th rowspan="2"><input type="checkbox" name="user"></th>
                <td colspan="2">*******</td>
                <td rowspan="2">
                    <input type="radio" name="certification">간편인증<br/>
                    <input type="radio" name="certification">휴대폰<br/>
                    <input type="radio" name="certification">아이핀<br/>
                </td>
                <td style="color: red">Yes</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>정상</td>
                <td></td>
                <td></td>
                <td rowspan="2">
                    <input type="button" value="수정">
                    <input type="button" value="그룹">
                </td>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td><input type="checkbox"></td>
                <td>
                    <select name="powerlevel">
                        <option>1</option>
                        <option selected>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    function selectAll(selectAll)  {
        const checkboxes = document.querySelectorAll('input[name="user"]');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
    }
</script>

