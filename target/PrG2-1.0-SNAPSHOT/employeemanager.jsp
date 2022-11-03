<%-- 
    Document   : adminpage
    Created on : Oct 28, 2022, 4:44:17 PM
    Author     : vhqua
--%>
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
        <title>Employeee manager</title>
        <!--boostrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"/>
        <!--datatable-->
        <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
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
                        <h1 class="text-center">Employee Management</h1>
                        <table id="myTable" class="table table-hover responsive">
                            <thead>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Role</th>
                            <th>Birthday</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Update</th>
                            <th>Delete</th>
                            </thead>
                            <tbody>
                                <%
                                    List<Employee> list = (List<Employee>) request.getAttribute("listEmp");
                                    for (Employee emp : list) {
                                        if (!emp.getEmp_role().equals("admin")) {
                                %>
                                <tr>
                                    <td><%= emp.getEmp_ID()%></td>
                                    <td><%= emp.getEmp_name()%></td>
                                    <td>Nhan vien</td>
                                    <td><%= emp.getEmp_birthday()%></td>
                                    <td><%= emp.getEmp_gender()%></td>
                                    <td><%= emp.getEmp_address()%></td>
                                    <td><%= emp.getEmp_phone()%></td>
                                    <td>
                                        <a href="/employee/employeemanager/admin/update/<%= emp.getEmp_ID() %>" class="icon-a"><i class="fa-solid fa-pen-to-square"></i></a>
                                    </td>
                                    <td>
                                        <a href="#" class="icon-a icon-delete" id=""><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                                <%}
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <a href="/employee/employeemanager/admin/add" class="btn btn-dark text-center">Add new account</a>
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
        <script src="${pageContext.request.contextPath}/resouces/js/empmanager.js"></script>
    </body>
</html>
