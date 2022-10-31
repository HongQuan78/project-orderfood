<%@page import="com.DAOS.OrderDAO"%>
<%@page import="com.Models.Employee"%>
<%@page import="com.Models.MakePayment"%>
<%@page import="com.DAOS.MakePaymentDAO"%>
<%@page import="com.Models.OrderModel"%>
<%@page import="com.DAOS.FoodDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Order manager</title>

        <!--Bootstrap-->
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />

        <!--Table data-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <link rel="stylesheet" href="resouces/css/paymentcss.css"/>
        <style>

        </style>
    </head>
    <%@include file="navbar.jsp" %>
    <body style="background-color:#FFD230;">
        <!-- User -->
        <div class="container" style="background-color: white; margin-top: 80px; padding: 10px 5px 10px 5px;">
            <div class="justify-content-center">
                <div style="padding: 15px 20px 15px 20px">
                    <% String TableID = session.getAttribute("tableID").toString();%>
                    <!-- Tabs -->
                    <div class="tab">
                        <button id="default" class="tablinks" style="color: blue;"
                                onclick="openCity(event, 'order')">Order</button>
                        <button class="tablinks" style="color: red;" onclick="openCity(event, 'unpaid')">Unpaid</button>
                        <button class="tablinks" style="color: green;" onclick="openCity(event, 'paid')">Paid</button>
                    </div>

                    <!-- Order -->
                    <div id="order" class="tabcontent">
                        <div style="height: 300px; overflow: auto">
                            <table id="tb_order" class="display">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name of food</th>
                                        <th>Amount</th>
                                        <th>Price (VND)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<OrderModel> list = (List<OrderModel>) session.getAttribute("ListOrder");
                                        FoodDAO fdao = new FoodDAO();
                                        Employee emp = (Employee) session.getAttribute("employee");
                                        OrderDAO ordao = new OrderDAO();
                                        for (OrderModel order : list) {
                                    %>
                                    <tr>
                                        <td><%= order.getFood_ID()%></td>
                                        <td><%= fdao.getFoodName(order.getFood_ID())%></td>
                                        <td>
                                            <div>
                                                <button type="submit" name="btnReduce"
                                                        class="btn btn-secondary btn-sm">-</button><span><%= order.getQuantity()%></span><button
                                                        type="submit" name="btnIncrease"
                                                        class="btn btn-secondary btn-sm">+</button>
                                            </div>
                                        </td>
                                        <td><%= fdao.getFoodPrice(order.getFood_ID())%></td>
                                        <td><button type="submit" name="btnRemove" class="btn btn-danger">Remove</button>
                                        </td>
                                    </tr>
                                    <%}

                                    %>
                                </tbody>
                            </table>
                        </div>
                        <hr>
                        <div style="margin-top: 20px; margin-bottom: 20px;">
                            <div class="container">
                                <h6 style="margin-bottom: 10px;">Employee: </h6>
                                <h6 style="margin-bottom: 10px;">Table: <%= TableID%></h6>
                                <h6 style="margin-bottom: 10px;">Discount: 0 VNĐ</h6>
                                <h4 style="color: green;">Order total: <%= ordao.getTotalPrice(session.getAttribute("orderID").toString()) %> VNĐ (VAT)</h4>
                                <form action="/order">
                                    <button type="submit" name="btnPay" id="btnPay" onclick="return checkAgree()"
                                            style="background-color: green; height: 40px;"
                                            class="form-control btn btn-primary rounded submit px-3">ORDER</button>
                                </form>
                            </div>

                        </div>
                    </div>

                    <!-- Unpaid -->
                    <div id="unpaid" class="tabcontent">
                        <div style="height: 500px; overflow:auto;">
                            <table id="tb_unpaid" class="display">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Table</th>
                                        <th>Total price (VND)</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><button type="submit" name="btnPay" id="btnPay"
                                                    class="btn btn-danger">Pay</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <hr>
                    </div>
                    <!-- Paid -->
                    <div id="paid" class="tabcontent">
                        <div style="height: 500px; overflow:auto;">
                            <table id="tb_paid" class="display">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Pay ID</th>
                                        <th>Table</th>
                                        <th>Total price (VND)</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>8965F1A4AC84F</td>
                                        <td>8965F1A4AC84F</td>
                                        <td>3</td>
                                        <td>135.000</td>
                                        <td style="color: green;">Paid</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!--Jquery-->
        <script language ="Javascript" src="resouces/libaries/jquery-3.6.1.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
        <!--Table data-->
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <script language = "Javascript" src="resouces/js/payment.js"></script>

    </body>

</html>