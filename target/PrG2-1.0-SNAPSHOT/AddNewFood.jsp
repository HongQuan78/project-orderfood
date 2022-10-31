<%-- 
    Document   : AddNewFood
    Created on : Oct 25, 2022, 2:08:44 PM
    Author     : Admin
--%>

<<<<<<< HEAD
=======
<%@page import="java.sql.ResultSet"%>
<%@page import="com.DAOS.FoodDAO"%>
<%@page import="com.Models.Foods"%>
>>>>>>> 8759554 (dcmgit)
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add new food</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<<<<<<< HEAD
        <link rel="stylesheet" href="resouces/css/style.css">
=======
        <link rel="stylesheet" href="${pageContext.request.contextPath} /resouces/css/style.css">
>>>>>>> 8759554 (dcmgit)
    </head>

    <body>
        <%--<%@include file="/component/navbar.jsp" %>--%>
        <%@include file="navbar.jsp" %>
<<<<<<< HEAD
=======
        <%
            Foods food = (Foods) session.getAttribute("FOOD");
        %>
>>>>>>> 8759554 (dcmgit)
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">ADD FOOD</h3>
<<<<<<< HEAD
                                <form method="post" action="" id="addnew">
=======
                                <form method="POST" action="FoodController" id="addnew" onsubmit="return checkAllDate()">

>>>>>>> 8759554 (dcmgit)
                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_id">Food ID</label>
<<<<<<< HEAD
                                                <input type="text" id="f_id" name="f_id" class="form-control form-control-lg" />
                                            </div>
                                            
=======
                                                <input type="text" id="f_id" name="f_id" class="form-control form-control-lg"
                                                       required="required" onblur="checkF_id()" value="<%= (food != null) ? food.getFood_ID() : ""%>" <%= (food != null) ? "readonly" : ""%>/>
                                                <a onclick="FoodIDGenerate()" href="#" style="color: #024FA0">Food ID generate</a>
                                            </div>
                                            <div class="error" id="f_idMess"></div>
>>>>>>> 8759554 (dcmgit)
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_name">Food name</label>
<<<<<<< HEAD
                                                <input type="text" id="f_name" class="form-control form-control-lg"
                                                      />
                                            </div>
=======
                                                <input type="text" id="f_name" name="f_name" class="form-control form-control-lg"
                                                       required="required" onblur="checkF_name()" value="<%= (food != null) ? food.getFood_name() : ""%>"/>
                                            </div>
                                            <div class="error" id="f_nameMess"></div>
>>>>>>> 8759554 (dcmgit)
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">

                                            <div class="form-outline">
                                                <label class="form-label" for="price">Price</label>
<<<<<<< HEAD
                                                <input type="text" id="price" class="form-control form-control-lg"
                                                       />
                                            </div>
=======
                                                <input type="text" id="price" name="f_price" class="form-control form-control-lg"
                                                       required="required" onblur="checkPrice()" value="<%= (food != null) ? food.getPrice() : ""%>"/>
                                            </div>
                                            <div class="error" id="priceMess"></div>

>>>>>>> 8759554 (dcmgit)
                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="f_s">Food Status</label>
<<<<<<< HEAD
                                                <input type="text" id="f_s" class="form-control form-control-lg"
                                                       />
                                            </div>
=======
                                                <input type="text" id="f_s" name="f_s" class="form-control form-control-lg"
                                                       required="required" onblur="checkF_status()" value="<%= (food != null) ? food.getF_Status() : ""%>"/>
                                            </div>
                                            </br>
                                            <div class="error" id="f_sMess"></div>
>>>>>>> 8759554 (dcmgit)
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2 txt">

                                            <div class="form-outline ">
                                                <label class="form-label" for="img">URL Image</label>
<<<<<<< HEAD
                                                <input type="tel" id="img" class="form-control form-control-lg"
                                                       />
                                            </div>
=======
                                                <input type="tel" id="img" name="f_img" class="form-control form-control-lg"
                                                       required="required" onblur="checkURL()" value="<%= (food != null) ? food.getURL_img() : ""%>"/>
                                            </div>
                                            <div class="error" id="urlMess"></div>
>>>>>>> 8759554 (dcmgit)
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <label class="form-label" for="phoneNumber">Category</label>
                                            <br>
<<<<<<< HEAD
                                            <select name="Category_id" class="c_opt">
                                                <option value="C00001">Bò</option>
                                                <option value="C00001">Cá</option>
                                                <option value="C00001">Heo</option>
                                                <option value="C00001">Dê</option>
                                                <option value="C00001">Lẩu</option>
                                                <option value="C00001">Nướng</option>
                                                <option value="C00001">Bia</option>
                                                <option value="C00001">Nước Ngọt</option>
                                                <option value="C00001">Món Thêm</option>
=======
                                            <%
                                                FoodDAO dao = new FoodDAO();
                                                ResultSet rs = dao.getAllCategoryID();
                                            %>
                                            <select name="Category_id" class="c_opt"> 
                                                <%
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%= rs.getString("Category_ID") %>" <%= (food != null && food.getCategory_ID().equals(rs.getString("Category_ID"))) ? "selected" : ""%> ><%= rs.getString("Category_Name")%></option>
                                                <%
                                                    }
                                                %>
>>>>>>> 8759554 (dcmgit)
                                            </select>
                                        </div>
                                    </div>

<<<<<<< HEAD
                                    <div class="mt-4 pt-2" align="right">
                                        <input class="btn btn-lg btnInsert" type="submit" value="Submit" />
=======
                                    <div class="mt-4 pt-2" align="right">                                       
                                        <input class="btn btn-lg btnInsert" name="btnAddNewFood" type="submit" value="Submit"/>
>>>>>>> 8759554 (dcmgit)
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
<<<<<<< HEAD
        <script src="resouces/libaries/jquery-3.6.1.min.js"></script>
        <script src="resouces/libaries/jquery.validate.js"></script>
        <script src="resouces/js/addfood.js"></script>
=======
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath} /resouces/js/addfood.js"></script>
        <script src="${pageContext.request.contextPath} /resouces/js/randomfoodid.js"></script>
>>>>>>> 8759554 (dcmgit)
    </body>
</html>
