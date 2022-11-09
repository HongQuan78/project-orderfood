<%-- 
    Document   : tablebooking
    Created on : Nov 3, 2022, 7:27:19 AM
    Author     : vhqua
--%>
<%@page import="java.util.List"%>
<%@page import="com.Models.Table"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="importFavicon.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Table booking</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/tablebooking.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/footer.css">
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="title">
                <h1>Table</h1>
            </div>
            <div class="overall-table row">
                <%
                    List<Table> list = (List<Table>) request.getAttribute("list");
                    for (Table t : list) {

                %>
                <div class="tables-btn col-md-4">
                    <a href="/table/change/<%= t.getTable_ID() %>" class="btn btn-custom btn-lg <%= t.getT_Status().equals("true")?"":"btn-f" %> "><%= t.getTable_ID()%></a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
    </body>

</html>
