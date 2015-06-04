<%-- 
    Document   : item
    Created on : Feb 27, 2015, 11:00:31 PM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />    

<section id="main"> 

    <div id="bread">  
        <p><b>Home>Catalog>Item</b></p>  
    </div>

    <div>
        <p><img class="itemPic" src="${product.getImageURL()}" alt="book">
            <c:out value="${product.getDescription()}" />
        </p>
        <h1> <c:out value="${product.getProductName()}" /></h1>
        <h3> <c:out value="${product.getCategory()}" /> </h3>
        <h4>$ <c:out value="${product.getPrice()}" /></h4>
    </div>

    <form name="addToCart" method="post" action="order" >         
        <input type= "submit" value="Add To Cart"/> 
        <input type="hidden" name= "addToCart" value="${product.getProductCode()}"/>
    </form>
    <br>
    <button onclick="location.href = 'catalog'">Return to catalog</button>

</section>

<jsp:include page="/include/footer.jsp" />

