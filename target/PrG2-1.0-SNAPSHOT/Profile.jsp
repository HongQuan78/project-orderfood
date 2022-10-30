<%-- 
    Document   : Profile
    Created on : Oct 25, 2022, 2:09:10 PM
    Author     : Admin
--%>

<%@page import="com.Models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resouces/css/profile.css">
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <%
            Employee emp = (Employee) session.getAttribute("employee");

        %>
        <div class="container">

            <div class="img_ava" align="center">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="Avatar"/>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card-body p-4">
                        <h1>PROFILE</h1>
                        <hr class="mt-0 mb-4">

                        <div class="row pt-1">
                            <div class="col-6 mb-6">
                                <h2>ID</h2>
                                <p class="text-muted"><%= emp.getEmp_ID()%></p>
                            </div>
                            <div class="col-6 mb-6">
                                <h2>Name</h2>
                                <p class="text-muted"><%= emp.getEmp_name()%></p>
                            </div>
                        </div>

                        <div class="row pt-1">
                            <div class="col-6 mb-6">
                                <h2>Ngày sinh</h2>
                                <p class="text-muted"><%= emp.getEmp_birthday()%></p>
                            </div>
                            <div class="col-6 mb-6">
                                <h2>Giới tính</h2>
                                <p class="text-muted"><%= emp.getEmp_ID()%></p>
                            </div>
                        </div>

                        <div class="row pt-1">
                            <div class="col-6 mb-6">
                                <h2>Số điện thoại</h2>
                                <p class="text-muted"><%= emp.getEmp_name()%></p>
                            </div>
                            <div class="col-6 mb-6">
                                <h2>Địa chỉ</h2>
                                <p class="text-muted"><%= emp.getEmp_address()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!--Jquery-->
        <script language = "Javascript" src="resouces/libaries/jquery-3.6.1.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
    </body>
</html>
