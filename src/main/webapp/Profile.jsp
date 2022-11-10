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
        <%@include file="importFavicon.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/profile.css">
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <%
            Employee emp = (Employee) session.getAttribute("employee");
        %>
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                    <h5>ROLE</h5>
                                    <p><%= emp.getEmp_role().equals("emp") ? "Nhân Viên" : "Quản Lý"%></p>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Name</h6>
                                                <p class="text-muted"><%= emp.getEmp_name()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Gender</h6>
                                                <p class="text-muted"><%= emp.getEmp_gender()%></p>
                                            </div>
                                        </div>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted"><%= emp.getEmp_address()%></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted"><%= emp.getEmp_phone()%></p>
                                            </div>
                                        </div>
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Birthday</h6>
                                                <p class="text-muted"><%= emp.getEmp_birthday()%></p>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-start">
                                            <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                            <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                            <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%@include file="footer.jsp" %>
        </section>

        <!--Jquery-->
        <script language = "Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
    </body>
</html>
