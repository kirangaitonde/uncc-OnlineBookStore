<%-- 
    Document   : catalog.jsp
    Created on : Feb 27, 2015, 10:59:44 PM
    Author     : K G
--%>

<%@page import="data.OrdersDB"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="business.Cart"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="data.UserDB" %>
<%@ page import="business.User" %>
<%@ page import="business.Orders" %>
<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />    

<section id="main"> 

    <div id="bread">  
        <p><b>Home>Catalog>OrderList</b></p>  
    </div>

    <%
        User u = new User();
        u = UserDB.getUser(request.getRemoteUser());
        session.setAttribute("loggedUser", u);
        List<Orders> orderList = OrdersDB.getOrders(u.getUserID());
        request.setAttribute("orderList", orderList);
        request.setAttribute("user", u);
    %>

    <div >  
        <table id = "table">
            <tr>
                <th>Order Number</th>
                <th>Customer Name</th>
                <th>Order Date</th>
                <th>Total</th>
            </tr>
            <tr >
                <td>------------</td>
                <td>------------</td>
                <td>------------</td>
                <td>------------</td>                
            </tr>
            <c:forEach var="ord" items="${orderList}"> 
                <tr>
                    <td><a href="order?orderNumber=${ord.getOrderNumber()}"><c:out value="${ord.getOrderNumber()}" /></a></td>
                    <td><c:out value="${user.getFirstName()}" />&nbsp<c:out value="${user.getLastName()}" /></td>
                    <td><c:out value="${ord.getOrderDate()}" /></td>
                    <td><c:out value="${ord.getTotalCost()}" /></td>  
                </tr>
            </c:forEach>    
        </table>
    </div>

</section>

<jsp:include page="/include/footer.jsp" />