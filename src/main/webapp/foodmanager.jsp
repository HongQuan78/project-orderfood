<%-- 
    Document   : adminpage
    Created on : Oct 28, 2022, 4:44:17 PM
    Author     : vhqua
--%>

<%@page import="com.DAOS.FoodDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.Models.Foods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="importFavicon.jsp" %>
        <%@include file="importFavicon.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food manager</title>
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
                        </ul>
                    </div>
            </nav>

            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <%@include file="navbar.jsp" %>
                <div class="container-fluid">
                    <a href="/food/add" class="btn btn-dark text-center">Add new food</a>
                    <h1 class="text-center">Food Manager</h1>
                    <table id="myTable" class="display table table-hover responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th>Food ID</th>
                                <th>Food Name</th>
                                <th>Status</th>
                                <th>Price</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                FoodDAO fdao = new FoodDAO();
                                List<Foods> list = (List<Foods>) request.getAttribute("listFood");
                                for (Foods f : list) {
                            %>
                            <tr>
                                <td><%= f.getFood_ID()%></td>
                                <td><%= f.getFood_name()%></td>
                                <td>
                                    <select id="selectStatus" class="form-control form-select form-select-sm">
                                        <option value="choose" disabled="true">choose</option>
                                        <option value="/food/true-<%= f.getFood_ID()%>" <%= fdao.getFoodStatus(f.getFood_ID()).equals("true") ? "selected" : ""%>>Con hang</option>
                                        <option value="/food/false-<%= f.getFood_ID()%>"<%= fdao.getFoodStatus(f.getFood_ID()).equals("false") ? "selected" : ""%> >Het hang</option>
                                    </select>
                                </td>
                                <td><%= f.getPrice()%></td>
                                <td>
                                    <a href="#" class="icon-a"><i class="fa-solid fa-pen-to-square"></i></a>
                                </td>
                                <td>
                                    <a href="#" class="icon-a icon-delete" id=""><i class="fa-solid fa-trash"></i></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
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
        <script src="${pageContext.request.contextPath}/resouces/js/foodmanager.js"></script>

    </body>
</html>
