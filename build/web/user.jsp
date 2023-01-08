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
        <c:if test="${sessionScope.loginedUser == null}">
            <c:set scope="request" var="error" value="You have to login to access this page"/>
            <jsp:forward page="login.jsp"/>
        </c:if>
        <h1>Welcome ${sessionScope.loginedUser.sName}</h1>
        <form action="mainController" method="post"><input type="submit" name="action" value="logout"/></form>
        <form action="mainController" method="post">
            Sailor ID: <input type="number" name="sid" required="" value="${param.sid}"/>
            <br/>
            Boat ID: <input type="number" name="bid" required="" value="${param.bid}"/>
            <br/>
            Date: <input type="date" name="day" required="" value="${param.day}"/>
            <br/>
            <input type="submit" name="action" value="makeReserve"/>
            <br/>
            ${requestScope.noti}
        </form>
    </body>
</html>
