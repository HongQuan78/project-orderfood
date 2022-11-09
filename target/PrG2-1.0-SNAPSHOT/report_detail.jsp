<%-- 
    Document   : adminpage
    Created on : Oct 28, 2022, 4:44:17 PM
    Author     : vhqua
--%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css"/>
        <!--fontawesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/sidebar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/managerStyle.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/footer.css">
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
                                <a href="/admin/employeemanager">Quản lý nhân viên
                                </a>
                            </li>
                            <li>
                                <a href="/admin/foodmanager">Quản lý thức ăn</a>
                            </li>
                            <li>
                                <a href="/admin/report">Xem báo cáo </a>
                            </li>
                        </ul>
                    </div>
            </nav>

            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <%@include file="navbar.jsp" %>
                <div class="container-fluid">
                    <h4>Total in month: </h4>
                    <div class="container">
                        <h1 class="text-center">Các món ăn trong hóa đơn </h1>
                        <table id="myTable" class="table table-hover responsive">
                            <thead>
                            <th>Order ID</th>
                            <th>Food Name</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Table</th>
                            </thead>
                            <tbody>
                                <%
                                    List<OrderModel> list = (List<OrderModel>) request.getAttribute("list");
                                    FoodDAO fdao = new FoodDAO();
                                    for (OrderModel order : list) {
                                        
                                %>
                                <tr>
                                    <td><%= order.getOrder_ID() %></td>
                                    <td><%= fdao.getFoodName(order.getFood_ID()) %></td>
                                    <td><%= order.getQuantity() %></td>
                                    <td><%= fdao.getFoodPrice(order.getFood_ID()) * order.getQuantity() %></td>
                                    <td><%= order.getTable_ID() %></td>

                                </tr>
                                <%}
                                    
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/sidebar.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/report.js"></script>
    </body>
</html>
