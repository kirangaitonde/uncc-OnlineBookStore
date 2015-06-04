<%-- 
    Document   : header
    Created on : Feb 28, 2015, 12:13:15 AM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>KG BookStore</title>
        <link rel="stylesheet" href="styles/style.css" type="text/css"/>
    </head>

    <body>
        <header id="header1">
            <div id="header1a"> 
                <c:choose>
                    <c:when test="${pageContext.request.getRemoteUser()!= null}">
                        <p> <c:out value="${pageContext.request.getRemoteUser()}" /></p>
                    </c:when>
                    <c:otherwise>
                        <p> Not Signed in</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="header1b">  
                <h1>
                    <img id="logo" src="images/logo.jpg" alt="logo">  
                    KG's Book Store
                </h1>
            </div> 
        </header>