<%-- 
    Document   : listfood
    Created on : Oct 28, 2022, 12:37:13 PM
    Author     : vhqua
--%>
<%@page import="com.Models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.Models.Foods"%>
<%@page import="com.DAOS.FoodDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="importFavicon.jsp" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/listfood.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/navbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/footer.css">
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <div class="control-carosel container-sm">
            <!-- Carousel wrapper -->
            <div id="carouselBasicExample" class="carousel slide carousel-fade" data-mdb-ride="carousel">
                <!-- Indicators -->
                <div class="carousel-indicators">
                    <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>

                <!-- Inner -->
                <div class="carousel-inner">
                    <!-- Single item -->
                    <div class="carousel-item active">
                        <img src="https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-table_181624-34062.jpg?w=1380&t=st=1666840620~exp=1666841220~hmac=9838750129f9cce32aa6c88f7a6d02c1a2e9dd6c5cfbbb50ebb3bc9ad071fad0"
                             class="d-block w-100 carousel-img img-responsive img-fluid" alt="Food 1" />
                    </div>
                    <!-- Single item -->
                    <div class="carousel-item">
                        <img src="https://img.freepik.com/free-photo/fried-spring-rolls-cutting-board_1150-17010.jpg?w=1380&t=st=1666840652~exp=1666841252~hmac=b53bb4bf73df71eaa506586548aa36b643b587aac139b16c2926bdf5f218f7c3"
                             class="d-block w-100 carousel-img" alt="Food 2" />
                    </div>
                    <!-- Single item -->
                    <div class="carousel-item">
                        <img src="https://img.freepik.com/free-photo/quail-eggs-stew-with-belly-pork-chinese-food_1205-10115.jpg?w=1380&t=st=1666840678~exp=1666841278~hmac=7ccd4b36edcb00ef298cc7f400baae6eda10c5865ef7f69e3c6fad84b10fa52e"
                             class="d-block w-100 carousel-img" alt="Food 3" />
                    </div>

                </div>
                <!-- Inner -->

                <!-- Controls -->
                <button class="carousel-control-prev" type="button" data-mdb-target="#carouselBasicExample"
                        data-mdb-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-mdb-target="#carouselBasicExample"
                        data-mdb-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- Carousel wrapper -->
        </div>
        <div class="container">
            <div class="row">
                <a href="/table/booking" class="btn btn-dark">Chọn bàn</a>
            </div>
            <div class="row my-5">
                <h3 class="">Table: <%= session.getAttribute("tableID") == null ? "Chua chon ban" : session.getAttribute("tableID").toString()%></h3>
            </div>
        </div>

        <form action="/order" method="post" id="form">
            <div class="container">
                <%
                    List<Category> listCate = (List<Category>) request.getAttribute("listCate");
                    for (Category cate : listCate) {
                %>
                <h1><%= cate.getCategory_Name()%></h1>
                <ul class="overall-card">
                    <%
                        FoodDAO fdao = new FoodDAO();
                        List<Foods> food = fdao.getFoodInCategory(cate.getCategory_ID());
                        for (Foods f : food) {
                    %>
                    <li class="single-cards">
                        <div class="cards">
                            <img src="<%= f.getURL_img()%>" class="card-img-top"
                                 alt="Fissure in Sandstone" />
                            <div class="food-card-title">
                                <h3 class="foods-name"><%= f.getFood_name()%></h3>
                                <br>
                                <h6 class="card-text text-center">Price: <%= fdao.getFoodPrice(f.getFood_ID())%></h6>
                            </div>
                            <div class="card-body">
                                <span class="btn btn-custom btn-dark" id="o" onclick="subFood('<%= f.getFood_ID()%>')"><i class="fa-solid fa-minus"></i></span>
                                <input type="number" class="input-amount amount-food" id="<%= f.getFood_ID()%>" name="orderfood" value="0"/>
                                <span class="btn btn-custom btn-dark" id="o" onclick="addFood('<%= f.getFood_ID()%>')"><i class="fa-solid fa-plus"></i></span>
                            </div>
                        </div>
                    </li>
                    <%}%>
                </ul>
                <%}%>
                <input type="text" id="bind-value" value = "" name="bind-value" style="display: none">
                <div class="btn-order-container">
                    <button name="btnOrder1" type="submit" id="btnOrder" class="btn btn-dark btn-lg"><i class="fa-solid fa-cart-shopping"></i></button>
                </div>
            </div>
        </form>
        <%@include file="footer.jsp" %>
        <script src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/js/listfood.js"></script>
    </body>
    
</html>