<%-- 
    Document   : test page
    Created on : Oct 31, 2022, 9:40:57 AM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%= session.getAttribute("orderID") %>
        <%= session.getAttribute("totalPrice") %>
    </body>
</html>
