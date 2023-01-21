<%-- 
    Document   : register
    Created on : Dec 20, 2022, 11:12:21 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.loginedUser != null}">
                <c:redirect url="user.jsp"/>
            </c:when>
            <c:otherwise>
                <!--[sname],[password],[rating],[age]-->
                <form action="mainController" method="get">
                    <table>
                        <tr>
                            <th>Name</th>
                            <td><input type="text" name="txtname" value="${param.txtname}"/></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><input type="password" name="txtpass" value="${param.txtpass}"/></td>
                        </tr>
                        <tr>
                            <th>Rating</th>
                            <td><input type="number" name="txtrate" min="1" max="5" value="${param.txtrate}"/></td>
                        </tr>
                        <tr>
                            <th>Age</th>
                            <td><input type="number" name="txtage" value="${param.txtage}"/></td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="register"/>
                </form>
                <p>${requestScope.noti}</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
