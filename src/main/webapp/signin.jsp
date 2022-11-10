<%-- 
    Document   : signin
    Created on : Oct 26, 2022, 7:48:29 PM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="importFavicon.jsp" %>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/signincss.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/footer.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
    </head>
    <body>
        <section class="my-5 bg-color-custom gradient-custom-2">
            <div class="container py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card text-black bg-white">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-center">
                                            <h4 class="mt-1 mb-5 pb-1">Sign in</h4>
                                        </div>
                                        <form action="/account/signin" method="post" id="signinForm">
                                            <p>Please login to your account</p>
                                            <div class="form-outline mb-4">
                                                <input
                                                    type="text"
                                                    id="username"
                                                    class="form-control"
                                                    name="username"
                                                    autocomplete="off"
                                                    />
                                                <label class="form-label" for="username"
                                                       >Username</label
                                                >
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input
                                                    type="password"
                                                    id="password"
                                                    class="form-control"
                                                    name="password"
                                                    />
                                                <label class="form-label" for="password"
                                                       >Password</label
                                                >
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button
                                                    class="btn btn-dark btn-block fa-lg mb-3"
                                                    type="submit"
                                                    name="btnSignin"
                                                    >
                                                    Sign in
                                                </button>
                                            </div>
                                            <h4 class="error-check" style="display: <%= request.getAttribute("error") == null ? "none" : "inline"%>"><%= request.getAttribute("error")%></h4>
                                        </form>
                                    </div>
                                </div>
                                <!-- col 2 -->
                                <div class="col-lg-6 d-flex">
                                    <img
                                        src="${pageContext.request.contextPath}/resouces/img/signin-img.jpg"
                                        alt=""
                                        class="img-fluid hover-shadow"
                                        />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- MDB -->
        <script language ="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery-3.6.1.min.js"></script>
        <script language ="Javascript" src="${pageContext.request.contextPath}/resouces/libaries/jquery.validate.js"></script>
        <script language ="Javascript" src="${pageContext.request.contextPath}/resouces/js/signinjs.js"></script>
        <script
            type="text/javascript"
            src="${pageContext.request.contextPath}/resouces/libaries/mdb.min.js"
        ></script>
    </body>
</html>
