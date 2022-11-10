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
        <%@include file="importFavicon.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Order manager</title>

        <!--Bootstrap-->
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css" rel="stylesheet" />
        <!--Table data-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/paymentcss.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/footer.css">
    </head>
    <%@include file="navbar.jsp" %>
    <body>
        <!-- User -->
        <div class="container" style="background-color: white; margin-top: 80px; padding: 10px 5px 10px 5px;">
            <div class="justify-content-center">
                <div style="padding: 15px 20px 15px 20px">
                    <!-- Tabs -->
                    <div class="tab">
                        <button id="default" class="tablinks" style="color: blue;"
                                onclick="openCity(event, 'order')">Order</button>
                    </div>
                    <%
                        if (session.getAttribute("tableID") == null) {
                    %>
                    <div>
                        <a href="/table/booking" class="btn btn-block btn-lg btn-dark text-center my-5 py-1 ">Vui lòng chọn bàn trước khi đặt món</a>
                    </div>

                    <%
                    } else {
                        if (session.getAttribute("checkOrder") != null) {
                    %>
                    <!-- Order -->
                    <div id="order" class="tabcontent">
                        <div style="height: 300px; overflow: auto">
                            <table id="tb_order" class="display">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name of food</th>
                                        <th id="amountTH">Amount</th>
                                        <th>Price (VND)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        HashMap<String, Integer> hash = (HashMap<String, Integer>) session.getAttribute("hash");
                                        String TableID = session.getAttribute("tableID").toString();
                                        Employee emp = (Employee) session.getAttribute("employee");
                                        FoodDAO fdao = new FoodDAO();
                                        OrderDAO ordao = new OrderDAO();
                                        double totalPrice = 0;
                                        for (String item : hash.keySet()) {
                                    %>
                                    <tr>

                                        <td><%= item%></td>
                                        <td><%= fdao.getFoodName(item)%></td>
                                        <td>
                                            <div class="amount-container container-fluid">
                                                <a href="/order/dec/<%=item%>" class="btn btn-custom btn-dark"><i class="fa-solid fa-minus"></i></a>
                                                <input type="text" class="amount-food" id="<%= item%>" name="orderfood" value="<%= hash.get(item)%>" disabled="true"/>
                                                <a href="/order/inc/<%=item%>" class="btn btn-custom btn-dark"><i class="fa-solid fa-plus"></i></a>
                                            </div>
                                        </td>
                                        <td><%= fdao.getFoodPrice(item)%> </td>
                                        <td><a href="/order/del/<%=item%>" name="btnRemove" class="btn btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <%  totalPrice += fdao.getFoodPrice(item) * hash.get(item);
                                        }
                                    %>
                                </tbody>

                            </table>
                        </div>
                        <hr>
                        <div class="container bot-container" style="margin-top: 20px; margin-bottom: 20px;">
                            <div class="container-fluid">
                                <h6 style="margin-bottom: 10px;">Employee: <%= emp.getEmp_name()%> </h6>
                                <h6 style="margin-bottom: 10px;">Table: <%= TableID%></h6>
                                <h4 style="color: green;">Order total: <%= totalPrice%> VNĐ (VAT)</h4>
                                <form action="/order" method="post">
                                    <button type="submit" name="btnPay" id="btnPay"
                                            style="background-color: green; height: 40px;"
                                            class="form-control btn btn-primary rounded submit px-3">ORDER</button>
                                </form>
                            </div>

                        </div>
                        <%}
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!--Jquery-->
        <script language ="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
        <!--Table data-->
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <script language = "Javascript" src="${pageContext.request.contextPath}/resouces/js/payment.js"></script>

    </body>

</html>