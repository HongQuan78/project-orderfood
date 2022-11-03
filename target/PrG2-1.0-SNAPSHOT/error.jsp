<%-- 
    Document   : error
    Created on : Oct 28, 2022, 10:01:25 AM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Oopss</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resouces/css/error.css">
        
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"
            />
    </head>
    <body>
        <div id="oopss">
            <div id="error-text">
                <img
                    src="https://cdn.rawgit.com/ahmedhosna95/upload/1731955f/sad404.svg"
                    alt="404"
                    />
                <span>Oopss</span>
                <p class="p-a">. The page you were looking for could not be found</p>

                <a href="/home" class="back">... Back to previous page</a>
            </div>
        </div>
    </body>
</html>
