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
        <c:choose>
            <c:when test="${sessionScope.loginedUser != null}">
                <c:redirect url="user.jsp"/>
            </c:when>
            <c:otherwise>
                <p>Don't have an account? <a href="register.jsp">Register</a> Now!</p>
                <form action="mainController" method="post">
                    <table>
                        <tr>
                            <th>User Name</th>
                            <td><input type="text" name="txtname" value="${param.txtname}"></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><input type="password" name="txtpass" value="${param.txtpass}"></td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="login"/>
                </form>
                <p>${requestScope.error}</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
