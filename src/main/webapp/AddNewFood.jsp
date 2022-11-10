<%-- 
    Document   : addnewfood
    Created on : Nov 9, 2022, 3:10:55 PM
    Author     : vhqua
--%>

<%@page import="com.Models.Foods"%>
<%@page import="java.util.List"%>
<%@page import="com.DAOS.CategoryDAO"%>
<%@page import="com.Models.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="importFavicon.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= session.getAttribute("add_update") == null?"Add new":"Update" %></title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="${pageContext.request.contextPath}/resouces/libaries/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/addfood.css" />
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%
            boolean check = session.getAttribute("add_update") == null;
            Foods f = null;
            if (!check) {
                f = (Foods) session.getAttribute("FOOD");
            }
        %>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><%= check == true ? "Add new food" : "Update food"%></h3>
                                <form action="/food" method="post" id="addnew">
                                    <h3 class="error" style="display: <%= request.getAttribute("error") != null ? "block" : "none"%>"><%= request.getAttribute("error")%></h3>
                                    <div class="container">
                                        <div class="row mb-4">
                                            <div class="col">
                                                <label class="form-label" for="f_id">Food ID</label>
                                                <input type="text" id="f_id" class="form-control" name="f_id" value="<%= f != null ? f.getFood_ID() : ""%>" <%= check ? "" : "readonly"%>/>
                                            </div>
                                            <div class="col">
                                                <label class="form-label" for="f_name">Food name</label>
                                                <input type="text" id="f_name" class="form-control" name="f_name" value="<%= f != null ? f.getFood_name() : ""%>"/>
                                            </div>
                                        </div>

                                        <!-- Text input -->
                                        <div class=" mb-4">
                                            <label class="form-label" for="f_img">URL image</label>
                                            <input type="text" id="f_img" class="form-control" name="f_img" value="<%= f != null ? f.getURL_img() : ""%>"/>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col">
                                                <label class="form-label" for="f_price">Price</label>
                                                <input type="number" id="f_price" class="form-control" name="f_price" value="<%= f != null ? f.getPrice() : ""%>"/>
                                            </div>
                                            <div class="col">
                                                <label for="Category_id" class="form-label">Choose Category </label>
                                                <br>

                                                <select name="Category_id" class="c_opt form-select-sm form-select" id="Category_id">
                                                    <option value="Choose option" disabled="true">Choose</option>
                                                    <%                                                        CategoryDAO cdao = new CategoryDAO();
                                                        List<Category> list = cdao.getAllCate();
                                                        for (Category cate : list) {
                                                    %>
                                                    <%
                                                        boolean checkSelected = false;
                                                        if (f != null) {
                                                            checkSelected = cate.getCategory_ID().equals(f.getCategory_ID());
                                                        }
                                                    %>
                                                    <option value="<%= cate.getCategory_ID()%>"
                                                            <%= checkSelected ? "selected" : ""%>
                                                            ><%= cate.getCategory_Name()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="mt-4 pt-2" align="right">
                                            <button type="submit" name="<%= check ? "btnAddNewFood" : "btnUpdate"%>" class="btn btn-dark bg-black"><%= check ? "Add new food" : "Update food"%></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery.validate.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/js/addfood.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"></script>
    </body>
</html>
