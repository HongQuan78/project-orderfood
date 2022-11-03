<%-- 
    Document   : createAccount
    Created on : Oct 26, 2022, 7:52:35 PM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="importFavicon.jsp" %>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/createAccount.css" />
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Create account</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <section class="gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><%= request.getAttribute("update") == null ? "Create employee's account" : "Update employee's infor"%></h3>
                                <form action="account" method="post" id="empForm">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input
                                                    type="text"
                                                    id="empID"
                                                    class="form-control form-control-lg"
                                                    name="empID"
                                                    />
                                                <label class="form-label" for="empID"
                                                       >Employee ID</label
                                                >
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input
                                                    type="text"
                                                    id="empName"
                                                    class="form-control form-control-lg"
                                                    name="empName"
                                                    />
                                                <label class="form-label" for="empName"
                                                       >Employee name</label
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <!--new-->

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input
                                                    type="text"
                                                    id="empUsername"
                                                    class="form-control form-control-lg"
                                                    name="empUsername"
                                                    />
                                                <label class="form-label" for="empUsername"
                                                       >Username</label
                                                >
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input
                                                    type="password"
                                                    id="empPass"
                                                    class="form-control form-control-lg"
                                                    name="empPass"
                                                    />
                                                <label class="form-label" for="empPass"
                                                       >Password</label
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <!--new-->

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">
                                            <div class="form-outline datepicker w-100">
                                                <input
                                                    type="date"
                                                    class="form-control form-control-lg"
                                                    id="birthdayDate"
                                                    name="birthdayDate"
                                                    />
                                                <label for="birthdayDate" class="form-label"
                                                       >Birthday</label
                                                >
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <h6 class="mb-2 pb-1">Gender:</h6>

                                            <div class="form-check form-check-inline">
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="gender"
                                                    id="gender"
                                                    value="option1"
                                                    />
                                                <label class="form-check-label" for="femaleGender"
                                                       >Female</label
                                                >
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="gender"
                                                    id="gender"
                                                    value="option2"
                                                    />
                                                <label class="form-check-label" for="maleGender"
                                                       >Male</label
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-4 pb-2">
                                            <div class="form-outline">
                                                <input
                                                    type="text"
                                                    id="address"
                                                    class="form-control form-control-lg"
                                                    name="address"
                                                    />
                                                <label class="form-label" for="address"
                                                       >Address</label
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="form-label select-label"
                                                   >Choose option</label
                                            >
                                            <select class="select form-control-lg form-select-lg" name="role">
                                                <option value="1" disabled>Choose option</option>
                                                <option value="2">Nhan vien</option>
                                                <option value="3">Quan ly</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <input
                                            class="btn btn-outline-dark btn-lg"
                                            type="submit"
                                            value="Submit"
                                            name="<%= request.getAttribute("update") == null ? "btnAdd" : "btnUpdate"%>"
                                            />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery.validate.js"></script>
        <script language="Javascript" src="${pageContext.request.contextPath}/resouces/js/validateCreateUpdate.js"></script>
    </body>
</html>
