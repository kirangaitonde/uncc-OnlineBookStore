<%-- 
    Document   : catalog.jsp
    Created on : Feb 27, 2015, 10:59:44 PM
    Author     : K G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/include/header.jsp" />

<jsp:include page="/include/user-navigation.jsp" />

<jsp:include page="/include/site-navigation.jsp" />    

<section id="main"> 

    <div id="bread">  
        <p><b>Home>Catalog</b></p>  
    </div>

    <div id="cat1">
        <form name="catalogCategory" method="get" action="catalog" >
            <h2> Genre <select id="catalogCategory" name="catalogCategory" >            
                    <option value="all" >All</option>
                    <option value="fiction" >Fiction</option>
                    <option value="nonFiction">Nonfiction</option>
                </select>
                <input type="submit" value="select"/></h2>
        </form>

    </div> 

    <div id="cat2">  
        <table id = "catTable">
            <tr>
                <th></th>
                <th>Book</th>
                <th>Genre</th>
                <th>Price</th>
            </tr>
            <c:forEach var="product" items="${productList}"> 
                <tr>
                    <td><img class="catalogPic" src="${product.getImageURL()}" alt="book"></td>
                    <td><a href="catalog?productCode=${product.getProductCode()}"><c:out value="${product.getProductName()}" /></a></td>
                    <td><c:out value="${product.getCategory()}" /></td>
                    <td>$<c:out value="${product.getPrice()}" /></td> 
                </tr>
            </c:forEach>
        </table>
    </div>

</section>

<jsp:include page="/include/footer.jsp" />