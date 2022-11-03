<%-- 
    Document   : adminpage
    Created on : Oct 28, 2022, 4:44:17 PM
    Author     : vhqua
--%>
<%@page import="com.Models.Table"%>
<%@page import="com.DAOS.FoodDAO"%>
<%@page import="com.Models.OrderModel"%>
<%@page import="com.Models.MakePayment"%>
<%@page import="com.Models.Employee"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="importFavicon.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Report detail</title>
        <!--boostrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"/>
        <!--fontawesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/sidebar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/managerStyle.css">
    </head>
    <body id="body-pd">
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <a href="#">Manager</a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul>
                            <li>
                                <a href="/admin/employeemanager">Employee
                                </a>
                            </li>
                            <li>
                                <a href="/admin/foodmanager">Food</a>
                            </li>
                            <li>
                                <a href="/admin/report">Report</a>
                            </li>
                            <li>
                                <a href="/admin/table">Table</a>
                            </li>
                        </ul>
                    </div>
            </nav>

            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <%@include file="navbar.jsp" %>
                <div class="container-fluid">
                    <div class="container">
                        <h1 class="text-center">Table Manager</h1>
                        <table id="myTable" class="table table-hover responsive">
                            <thead>
                            <th>Table ID</th>
                            <th>Status</th>
                            </thead>
                            <tbody>
                                <%
                                    List<Table> list = (List<Table>) session.getAttribute("list");
                                    for (Table t : list) {
                                %>
                                <tr>
                                    <td><%= t.getTable_ID()%></td>
                                    <td>
                                        <select id="tableStatus" class="form-control form-select-sm">
                                            <option value="choose" disabled="true">Choose</option>
                                            <option value="true" <%= t.getT_Status().equals("true") ? "selected" : ""%>>Trong</option>
                                            <option value="false" <%= t.getT_Status().equals("false") ? "selected" : ""%>>Ban</option>
                                        </select>

                                    </td>
                                </tr>
                                <%
                                    }
                                %>


                            </tbody>
                        </table>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
            </main>
            <!-- page-content" -->

        </div>

        <!--Jquery-->
        <script language = "Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <!--datatable-->
        <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <!--sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/sidebar.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/tablemanager.js"></script>
    </body>
</html>
