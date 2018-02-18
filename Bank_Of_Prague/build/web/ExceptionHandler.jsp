<%-- 
    Document   : ExceptionHandler
    Created on : Nov 29, 2017, 8:47:16 PM
    Author     : Jared
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Error!</h1>
        <%=exception.getMessage()%>
        </BR>
        <strong> Please try again </strong>
        </BR>
        </BR>
        </BR>
        <%@include file="index.html" %>
    </body>
</html>
