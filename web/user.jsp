<%-- 
    Document   : user
    Created on : Oct 25, 2022, 1:56:03 PM
    Author     : Legion
--%>

<%@page import="dto.Sailors"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.loginedUser != null}">
                <h1>Hello ${sessionScope.loginedUser.sName}</h1>
                <form action="mainController">
                    <input type="submit" name="action" value="logout"/>
                </form>
                <form action="mainController" method="post">
                    <table>
                        <tr>
                            <th>Sailor ID</th>
                            <td><input type="number" name="sid" required="" value="${param.sid}"/></td>
                        </tr>
                        <tr>
                            <th>Boat ID</th>
                            <td><input type="number" name="bid" required="" value="${param.bid}"/></td>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <td><input type="date" name="day" required="" value="${param.day}"/></td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="makeReserve"/>
                    <p>${requestScope.noti}</p>
                </form>
            </c:when>
            <c:otherwise>
                <c:set var="noti" scope="request" value="You need to login to access"/>
                <jsp:forward page="login.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
