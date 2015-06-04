<%-- 
    Document   : order
    Created on : Feb 28, 2015, 4:00:06 PM
    Author     : K G
--%>

<%@page import="business.Cart"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="data.UserDB" %>
<%@ page import="business.User" %>
<%@ page import="business.Orders" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />   


<section id="main"> 
    <div id="bread">  
        <p><b>Home>Order>Invoice</b></p>  
    </div>

    <%
        User u = new User();
        u = UserDB.getUser(request.getRemoteUser());
        session.setAttribute("loggedUser", u);
        Cart cart = (Cart) session.getAttribute("theShoppingCart");
        request.setAttribute("cartList", cart.getItems());
        String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        Orders order = new Orders(date, u.getUserID(), cart.getSubTotal(), false);
        session.setAttribute("currentOrder", order);
    %>

    <div id="invoice1">
        <h3>&nbsp&nbspInvoice</h3>
        <p>&nbsp&nbspDate:<c:out value="${order.getDate()}" /><br>
            &nbsp&nbsp<u>Ship To/Bill To:</u><br>
        &nbsp&nbsp<c:out value="${loggedUser.getFirstName()}" />&nbsp<c:out value="${loggedUser.getLastName()}" /> <br>
        &nbsp&nbsp<c:out value="${loggedUser.getAddressLine1()}" /><br>
        &nbsp&nbsp<c:out value="${loggedUser.getAddressLine2()}" /><br>
        &nbsp&nbsp<c:out value="${loggedUser.getCity()}" /><br>
        &nbsp&nbsp<c:out value="${loggedUser.getPostCode()}" /><br>
        </p>
    </div> 

    <div id="invoice2">
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
                    <td><c:out value="${cartItem.getQuantity()}" /></td> 
                    <td><c:out value="${cartItem.getTotal()}" /></td>
                </tr>
            </c:forEach> 

            <tr>
                <td></td>                
                <td></td>  
                <td><b>Subtotal</b></td>
                <td><c:out value="${theShoppingCart.getSubTotal()}" /></td> 
            </tr>
            <tr>
                <td></td>                
                <td></td>  
                <td><b>Tax</b></td>
                <td><c:out value="${currentOrder.getTax(theShoppingCart.getSubTotal())}" /></td> 
            </tr>

            <tr>
                <td></td>                
                <td></td>  
                <td><b>Total</b></td>
                <td><c:out value="${currentOrder.getTotal(theShoppingCart.getSubTotal())}" /></td> 
            </tr>

            <tr>
                <td></td>                
                <td></td>  
                <td></td>
                <td><button onclick="location.href = 'cart.jsp'">Back To Cart</button></td>                                
            </tr>

            <tr >
                <td></td>                
                <td></td>  
                <td></td> 
                <td><button onclick="location.href = 'payment.jsp'">Purchase</button></td>               
            </tr>
        </table>
    </div>
</section>

<jsp:include page="/include/footer.jsp" />
