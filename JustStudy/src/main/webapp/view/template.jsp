<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-10
  Time: 오후 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    main {
        width: 100%;
        background: #F5F5F5;
    }
</style>
<head>
    <title>template</title>
    <script type="text/javascript" src="../jquery/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="../jquery/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-datepicker.css">
    <script src="../bootstrap/js/bootstrap-datepicker.js"></script>

    <script src="https://unpkg.com/scrollreveal"></script>
    <script
            type="text/javascript"
            src="../bootstrap/js/bootstrap.bundle.min.js"
    ></script>


    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

</head>
<body>
<header>
<jsp:include page="inc/header.jsp"/>
</header>
<%--    <jsp:include page="view/mypage/template.jsp"/>--%>
<main>
<jsp:include page="${mainUrl}"/>

</main>
<footer>

<jsp:include page="inc/footer.jsp"/>
</footer>
</body>
</html>
