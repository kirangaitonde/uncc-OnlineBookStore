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
        <h1>Your Cart</h1>

        <h4>To remove an item change quantity to zero</h4>


        <form name="upadteCart" method="post" action="order" >  
            <table id = "table" >
                <tr>
                    <th>Books</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>

                <c:forEach var="cartItem" items="${cartList}"> 
                    <tr>
                        <td><c:out value="${cartItem.getProduct().getProductName()}" /></td>
                        <td><c:out value="${cartItem.getProduct().getPrice()}" /></td>
                        <td><input type="text" name="${cartItem.getProduct().getProductCode()}" value="<c:out value="${cartItem.getQuantity()}" />"/></td> 
                        <td>$<c:out value="${cartItem.getTotal()}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <br>


            <input type="hidden" name= "upadteCart" value="upadteCart"/>
            <input type= "submit" value="Update Cart"/> 
        </form>  
        <br>       
        <form name="checkOut" method="post" action="order" > 
            <input type="hidden" name= "checkOut" value="checkOut"/>
            <input type= "submit" value="Check Out"/> 

        </form>  
    </div>
</section>

<jsp:include page="/include/footer.jsp" />