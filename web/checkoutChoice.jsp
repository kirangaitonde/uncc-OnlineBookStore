<%-- 
    Document   : cart.jsp
    Created on : Feb 27, 2015, 10:59:30 PM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />   

<section id="main"> 

    <div id="bread">  
        <p><b>Home>Catalog>Cart</b></p>  
    </div>

    <div>
        <h1>Login or create new user</h1>

        <h4>Select one of the two options below to proceed with checkout</h4>

        <button onclick="location.href = 'order.jsp'">Login as Existing User</button>
        <br>
        <br>
        <br>
        <button onclick="location.href = 'userInfo.jsp'">Create New User</button>

    </div>
</section>

<jsp:include page="/include/footer.jsp" />