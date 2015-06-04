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
        <p><b>Home>Login</b></p>  
    </div>

    <div>
        <h1>Login Error</h1>

        <h4 id="error">There was an error while logging. Try again</h4>
        <form name="login" method="post" action="j_security_check" >  
            <h5>Email ID <input type="email" name="j_username" /></h5>
            <h5>Password <input type="password" name="j_password" /></h5>

            <input type="hidden" name= "login" value="login"/>
            <input type= "submit" value="Login"/> 
        </form>  
        <br>   
    </div>
</section>

<jsp:include page="/include/footer.jsp" />