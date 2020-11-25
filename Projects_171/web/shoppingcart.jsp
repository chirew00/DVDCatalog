<%-- 
    Document   : shoppingcart
    Created on : Nov 24, 2020, 8:35:16 PM
    Author     : USER
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.CartTable"%>
<%@page import="model.Dvdcart"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="emp" class="model.Dvdcart" scope="request"/>
    <%
            EntityManager em = (EntityManager) session.getAttribute("entitymanager");
            Vector<Dvdcart> empList = CartTable.findAllDvdcart(em);
            Iterator<Dvdcart> itr = empList.iterator();
     %>
    <body>
        <center>
<h1>Shopping Cart</h1>
 <table border="1">
          <tr>
            <th>DVDNames</th>
            <th>Rate</th>
            <th>Year</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Add Cart</th>
          </tr>
          <%
               while(itr.hasNext()) {
                   emp = itr.next();%>
                   
                 <tr>
                   <td><%=emp.getCDvdnames()%></td>
                   <td><%=emp.getCRate()%></td>
                   <td><%=emp.getCYears()%></td>
                   <td><%=emp.getCPrice()%></td>
                   <td><%=emp.getCQuantity()%></td>
                  <form name='Quantity' action ='RemovefromCartController' method='POST'>
                  <input name="nameCDVD" type="hidden" value="<%=emp.getCDvdnames()%>"></td> 
                  <td><input type="submit" name="remove" value="Remove"/></td>
                  </form>
                  <tr>
               <%}%>
          
         
 </table>
 </center>
               <center>
                   <form name='Quantity' action ='CheckoutController' method='POST'>
                    <input type="submit" name="checkout" value="Checkout"/>
                   </form>
               </center>
    </body>
</html>
