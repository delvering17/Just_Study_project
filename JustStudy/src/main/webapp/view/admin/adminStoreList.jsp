<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-16
  Time: 오후 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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

        tr:nth-of-type(3),
        tr:nth-of-type(5),
        tr:nth-of-type(7),
        tr:nth-of-type(9){
            /*background: rgba(227, 233, 240, 0.726);*/
        }

        th{
            border: 1px solid rgb(97, 88, 88);
            font-size: 13px;
        }

        td{
            border: 1px solid rgb(97, 88, 88);
            text-align: center;
            font-size: 13px;
        }

        tr > td > div > input[type=radio]{
            margin-left: 20px;
            width: 10px;
        }

        tr:first-of-type > th:first-of-type,
        tr:first-of-type > th:nth-of-type(2){
            width: 50px;
            height: 50px;
            padding: 10px;
            color: #fff;
            background: rgba(83, 104, 167, 0.856);
        }

        tr:nth-of-type(n+1) > th{

        }

        tr:first-of-type > th:nth-of-type(3),
        tr:first-of-type > th:nth-of-type(4),
        tr:first-of-type > th:nth-of-type(5),
        tr:first-of-type > th:nth-of-type(6),
        tr:first-of-type > th:nth-of-type(7),
        tr:first-of-type > th:nth-of-type(8),
        tr:first-of-type > th:nth-of-type(9),
        tr:first-of-type > th:last-child{
            width: 140px;
            background: rgba(83, 104, 167, 0.856);
            color: #fff;
        }



        tr:nth-of-type(2) > td{
            height: 200px;
        }

    </style>
    <meta charset="UTF-8">
    <title>storemanagement</title>
</head>
<body>
<div class="wrapper">

    <div id="headline">
        <b>지점관리</b>
        <input type="button" value="선택수정">
        <input type="button" value="선택삭제">
    </div>

    <div id="main">
        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th><input type="checkbox" name="user" onclick="selectAll(this)"></th>
                <th>지역</th>
                <th>지점명</th>
                <th>운영 시간</th>
                <th>1시간 당 가격</th>
                <th>룸 타입</th>
                <th>매장 주소</th>
                <th>전화번호</th>
                <th>편의 시설</th>
            </tr>
            <tr>
                <th rowspan="5"><input type="checkbox" name="user"></th>
                <td rowspan="5">
                    서울
                </td>
            </tr>
            <tr>
               <td>강남점</td>
               <td>08:00 ~ 23:00</td>
               <td>2500원</td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td>사당점</td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td>신촌점</td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td>교대점</td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>

        </table>
    </div>
</div>
</body>
<script>

</script>
</html>
