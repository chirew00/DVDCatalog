<%-- 
    Document   : menu
    Created on : Nov 22, 2020, 8:48:47 PM
    Author     : USER
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.DvdTable"%>
<%@page import="model.Dvdcat1"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="emp" class="model.Dvdcat1" scope="request"/>
    <%
            EntityManager em = (EntityManager) session.getAttribute("entitymanager");
            Vector<Dvdcat1> empList = DvdTable.findAllEmployee(em);
            Iterator<Dvdcat1> itr = empList.iterator();
     %>
    <body>
        <center>
<h1>DVD Catalog</h1>
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
                   <td><%=emp.getDvdnames()%></td>
                   <td><%=emp.getRate()%></td>
                   <td><%=emp.getYears()%></td>
                   <td><%=emp.getPrice()%></td>
                  <form name='Quantity' action ='AddtoCartController' method='POST'>
                  <input name="nameDVD" type="hidden" value="<%=emp.getDvdnames()%>"></td>
                  <input name="rateDVD" type="hidden" value="<%=emp.getRate()%>"></td>
                  <input name="yearsDVD" type="hidden" value="<%=emp.getYears()%>"></td>
                  <input name="priceDVD" type="hidden" value="<%=emp.getPrice()%>"></td>
                  <td><input type="number" name="Qty" value=""size="7"/></td>
                  <td><input type="submit" name="submit" value="AddToCart"/></td>
                  </form>
                  <tr>
               <%}%>
                  
          
         
 </table>
 </center>
       
    </body>
    <center>
    <a href="shoppingcart.jsp">Go to Shopping Cart</a>
    </center>
</html>
