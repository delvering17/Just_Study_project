<%--
  Created by IntelliJ IDEA.
  User: userk
  Date: 2022-08-13
  Time: 오후 5:07
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
            width: 1400px;
            height: 40px;
            background: #fff;
            border-bottom: 1px solid rgb(184, 177, 177);
            padding-top: 15px;
            padding-left: 20px;
            margin-top: 50px;
            margin-left: 239px;
            position: fixed;

        }

        #main{
            width: 1300px;
            height: 2000px;
            margin: 0px 0px 0px 220px;
            padding: 120px 20px 20px 20px;
        }


        #main > div:nth-of-type(1){
            width: 1300px;
            background: #fff;
            margin: 10px 0px 0px 0px;

        }

        #main > div:nth-of-type(1) > h3{
            height: 40px;
            padding-top: 15px;

        }

        #main > h5{
            margin: 0px 0px 10px 20px;
        }

        #main > div:nth-of-type(1){
            width: 1280px;
            height: 20px;
            padding: 10px;
            font-size: 13px;
            background: rgb(212, 206, 206);
            margin: 0px 0px 10px 20px;

        }

        table{
            border: 1px solid rgb(122, 115, 115);
            margin: 10px 0px 10px 20px;
            font-size: 13px;
        }



        tr:nth-of-type(1){
            background: rgba(72, 92, 117, 0.801);
            color: #fff;
        }

        tr:nth-of-type(1) > th{
            height: 20px;
        }

        th{
            border: 1px solid rgb(97, 88, 88);
            padding: 5px;
        }

        td{
            border: 1px solid rgb(97, 88, 88);
            padding: 5px;
        }

        #userList, #recentlyPost{
            border: 0;
            width: 120px;
            height: 30px;
            background: darkolivegreen;
            color: #fff;
            margin-left: 740px;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
    <meta charset="UTF-8">
    <title>main</title>

    <div id="headline"><h3>관리자메인</h3></div>

    <div id="main">
        <h5>신규회원가입목록</h5>
        <div>총회원수 3,452명 중 차단 0명, 탈퇴 : 52명</div>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th width="100">회원아이디</th>
                <th width="100">이름</th>
                <th width="100">닉네임</th>
                <th width="70">권한</th>
                <th width="70">수신</th>
                <th width="70">공개</th>
                <th width="70">인증</th>
                <th width="70">차단</th>
                <th width="100">그룹</th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
            <tr>
                <td>********</td>
                <td>********</td>
                <td>********</td>
                <th>3</th>
                <th>예</th>
                <th>예</th>
                <th>아니오</th>
                <th>예</th>
                <th></th>
            </tr>
        </table>
        <button id="userList">회원 전체보기</button>

        <h5>최근게시물</h5>

        <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
            <tr>
                <th width="100">그룹</th>
                <th width="100">게시판</th>
                <th width="400">제목</th>
                <th width="100">이름</th>
                <th width="100">일시</th>
            </tr>
            <tr>
                <th>화성 스터디 룸</th>
                <th>후기</th>
                <th>우와 너무 싸요</th>
                <th>송찬욱</th>
                <th>2022-08-12</th>
            </tr>
            <tr>
                <th>사당 스터디 룸</th>
                <th>자유게시판</th>
                <th>여기 주변에 맛집 많아요</th>
                <th>송지은</th>
                <th>2022-08-13</th>
            </tr>
            <tr>
                <th>수원 스터디 룸</th>
                <th>1:1 문의</th>
                <th>옆 방이 자꾸 떠들어요</th>
                <th>김지원</th>
                <th>2022-07-24</th>
            </tr>
            <tr>
                <th>인천 스터디 룸</th>
                <th>후기</th>
                <th>스터디 끝나고 술 한 잔은 국룰이지</th>
                <th>김한솔</th>
                <th>2022-08-01</th>
            </tr>

        </table>
        <button id="recentlyPost">최근 게시물 더보기</button>
    </div>
</html>
