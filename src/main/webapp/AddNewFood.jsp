<%-- 
    Document   : AddNewFood
    Created on : Oct 25, 2022, 2:08:44 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.DAOS.FoodDAO"%>
<%@page import="com.Models.Foods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta htxtp-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add new food</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/addnewfoodstyle.css">
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <%
            Foods food = (Foods) session.getAttribute("FOOD");
        %>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><%= session.getAttribute("add_update").equals("update") ? "UPDATE" : "ADD NEW"%></h3>
                                <form method="POST" action="FoodController" id="addnew" onsubmit="return checkAllDate()">

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_id">Food ID</label>
                                                <input type="text" id="f_id" name="f_id" class="form-control form-control-lg"
                                                       required="required" onblur="checkF_id()" value="<%= (food != null) ? food.getFood_ID() : ""%>" <%= (food != null) ? "readonly" : ""%>/>
                                                <a onclick="FoodIDGenerate()" href="#" style="color: #024FA0">Food ID generate</a>
                                            </div>
                                            <div class="error" id="f_idMess"></div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_name">Food name</label>
                                                <input type="text" id="f_name" name="f_name" class="form-control form-control-lg"
                                                       required="required" onblur="checkF_name()" value="<%= (food != null) ? food.getFood_name() : ""%>"/>
                                            </div>
                                            <div class="error" id="f_nameMess"></div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">
                                            <div class="form-outline">
                                                <label class="form-label" for="price">Price</label>
                                                <input type="text" id="price" name="f_price" class="form-control form-control-lg"
                                                       required="required" onblur="checkPrice()" value="<%= (food != null) ? food.getPrice() : ""%>"/>
                                            </div>
                                            <div class="error" id="priceMess"></div>
                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="f_s">Food Status</label>
                                                <select name="f_s" id = "f_s" class="form-control form-control-lg">
                                                    <option value="choose" disabled="">Choose</option>
                                                    <option value="true">Con hang</option>
                                                    <option value="false">Het hang</option>
                                                </select>
                                            </div>
                                            <div class="error" id="f_sMess"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2 txt">
                                            <div class="form-outline ">
                                                <label class="form-label" for="img">URL Image</label>
                                                <input type="tel" id="img" name="f_img" class="form-control form-control-lg"
                                                       required="required" onblur="checkURL()" value="<%= (food != null) ? food.getURL_img() : ""%>"/>
                                            </div>
                                            <div class="error" id="urlMess"></div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <label class="form-label" for="phoneNumber">Category</label>
                                            <br>
                                            <%
                                                FoodDAO dao = new FoodDAO();
                                                ResultSet rs = dao.getAllCategoryID();
                                            %>
                                            <select name="Category_id" class="c_opt"> 
                                                <%
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%= rs.getString("Category_ID")%>" <%= (food != null && food.getCategory_ID().equals(rs.getString("Category_ID"))) ? "selected" : ""%> ><%= rs.getString("Category_Name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2" align="right">                                       
                                        <input class="btn btn-lg btnInsert" name="btnAddNewFood" type="submit" value="Submit"/>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <!--Jquery-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/addfood.js"></script>
        <script src="${pageContext.request.contextPath}/resouces/js/randomfoodid.js"></script>
    </body>
</html>
