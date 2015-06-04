<%-- 
    Document   : login
    Created on : Apr 11, 2015, 2:47:17 PM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />   

<section id="main"> 

    <div id="bread">  
        <p><b>Home>Cart>Payment</b></p>  
    </div>

    <div>
        <h1>Payment Success</h1>
        <h4>Your order has been placed. A confirmation mail has been sent to the email id provided.</h4><br>
        <h4>Thank you for shopping with us!</h4>

    </div>
</section>

<jsp:include page="/include/footer.jsp" />