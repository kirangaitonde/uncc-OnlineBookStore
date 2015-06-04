<%-- 
    Document   : site-navigation
    Created on : Feb 28, 2015, 12:13:46 AM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="navigator">
    <a href="index.jsp">Home</a><br>
    <a href="<c:url value='/catalog' />">Catalog</a><br>
    <a href="about.jsp">About</a><br>
    <a href="contact.jsp">Contact Us</a><br>
</aside> 