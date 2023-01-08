<%-- 
    Document   : login
    Created on : Oct 25, 2022, 1:18:02 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.loginedUser != null}">
            <jsp:forward page="user.jsp"/>
        </c:if>
        <form action="mainController" method="post">
            Name: <input type="text" name="txtname" placeholder="Input your name" value="${param.txtname}">
            <br/>
            Password: <input type="password" name="txtpass" placeholder="Input password" value="${param.txtpass}">
            <input type="submit" name="action" value="login"/>
            <br/>
            ${requestScope.error}
        </form>
    </body>
</html>
