<%-- 
    Document   : user-navigation
    Created on : Feb 28, 2015, 12:13:32 AM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header id="header2">

    <c:choose>
        <c:when test="${pageContext.request.getRemoteUser()!= null}">
            <b> Welcome!!</b>
        </c:when>
        <c:otherwise>
            <b> <a href="index_loggedin.jsp">Sign In</a>  </b>
        </c:otherwise>
    </c:choose>

    &nbsp;&nbsp; |&nbsp;&nbsp;   
    <b> <a href="cart.jsp">Cart</a>   &nbsp;&nbsp; |&nbsp;&nbsp;
        <b><a href="orderList.jsp">My Orders</a></b> 
</header>


