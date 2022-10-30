<%-- 
    Document   : AddNewFood
    Created on : Oct 25, 2022, 2:08:44 PM
    Author     : Admin
--%>

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
        <link rel="stylesheet" href="resouces/css/style.css">
    </head>

    <body>
        <%--<%@include file="/component/navbar.jsp" %>--%>
        <%@include file="navbar.jsp" %>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">ADD FOOD</h3>
                                <form method="post" action="" id="addnew">
                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_id">Food ID</label>
                                                <input type="text" id="f_id" name="f_id" class="form-control form-control-lg" />
                                            </div>
                                            
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <div class="form-outline">
                                                <label class="form-label" for="f_name">Food name</label>
                                                <input type="text" id="f_name" class="form-control form-control-lg"
                                                      />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">

                                            <div class="form-outline">
                                                <label class="form-label" for="price">Price</label>
                                                <input type="text" id="price" class="form-control form-control-lg"
                                                       />
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="f_s">Food Status</label>
                                                <input type="text" id="f_s" class="form-control form-control-lg"
                                                       />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2 txt">

                                            <div class="form-outline ">
                                                <label class="form-label" for="img">URL Image</label>
                                                <input type="tel" id="img" class="form-control form-control-lg"
                                                       />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 txt">
                                            <label class="form-label" for="phoneNumber">Category</label>
                                            <br>
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
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2" align="right">
                                        <input class="btn btn-lg btnInsert" type="submit" value="Submit" />
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
        <script src="resouces/libaries/jquery-3.6.1.min.js"></script>
        <script src="resouces/libaries/jquery.validate.js"></script>
        <script src="resouces/js/addfood.js"></script>
    </body>
</html>
