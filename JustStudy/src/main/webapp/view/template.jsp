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
        width: 100%;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
</style>
<head>
    <title>template</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script type="text/javascript" src="../jquery/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="../jquery/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script
            type="text/javascript"
            src="../bootstrap/js/bootstrap.bundle.min.js"
    ></script>
</head>
<body>
<div>
<jsp:include page="inc/header.jsp"/>
</div>
<%--    <jsp:include page="view/mypage/template.jsp"/>--%>
<div>
<jsp:include page="${mainUrl}"/>
</div>
<div>

<jsp:include page="inc/footer.jsp"/>
</div>
</body>
</html>
