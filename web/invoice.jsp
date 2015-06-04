<%-- 
    Document   : order
    Created on : Feb 28, 2015, 4:00:06 PM
    Author     : K G
--%>

<%@page import="java.util.List"%>
<%@page import="business.OrderItem"%>
<%@page import="data.OrderItemDB"%>
<%@page import="data.OrdersDB"%>
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

        int num = Integer.parseInt((String) request.getAttribute("orderNumber"));
        Orders o = OrdersDB.getOrderUsingOrderNumber(num);
        session.setAttribute("invoiceOrder", o);
        User u = new User();
        u = UserDB.getUser(o.getUserID());
        request.setAttribute("invoiceUser", u);
        List<OrderItem> invoiceOrderItems = OrderItemDB.getOrderItems(num);
        request.setAttribute("invoiceOrderItems", invoiceOrderItems);
        double subTotal = 0;
        for (OrderItem oi : invoiceOrderItems) {
            subTotal = subTotal + oi.getTotal();
        }
        request.setAttribute("invoiceSubTotal", subTotal);
    %>

    <div id="invoice1">
        <h3>&nbsp&nbspInvoice</h3>
        <p>
            &nbsp&nbsp<u>Order Invoice:</u><br>
        &nbsp&nbsp<c:out value="${invoiceUser.getFirstName()}" />&nbsp <c:out value="${invoiceUser.getLastName()}" /> <br>
        &nbsp&nbsp<c:out value="${invoiceUser.getAddressLine1()}" /><br>
        &nbsp&nbsp<c:out value="${invoiceUser.getAddressLine2()}" /><br>
        &nbsp&nbsp<c:out value="${invoiceUser.getCity()}" /><br>
        &nbsp&nbsp<c:out value="${invoiceUser.getPostCode()}" /><br>
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

            <c:forEach var="orderItem" items="${invoiceOrderItems}"> 
                <tr>
                    <td><c:out value="${orderItem.getProduct().getPrice()}" /></td>
                    <td><c:out value="${orderItem.getQuantity()}" /></td>
                    <td><c:out value="${invoiceUser.getPostCode()}" /></td> 
                    <td><c:out value="${orderItem.getTotal()}" /></td>
                </tr>
            </c:forEach> 

            <tr>
                <td></td>                
                <td></td>  
                <td><b>Subtotal</b></td>
                <td><c:out value="${invoiceSubTotal}" /></td> 
            </tr>
            <tr>
                <td></td>                
                <td></td>  
                <td><b>Tax</b></td>
                <td><c:out value="${invoiceOrder.getTax(invoiceSubTotal)}" /></td> 
            </tr>

            <tr>
                <td></td>                
                <td></td>  
                <td><b>Total</b></td>
                <td><c:out value="${invoiceOrder.getTotalCost()}" /></td>   
            </tr>
        </table>
    </div>
</section>

<jsp:include page="/include/footer.jsp" />
