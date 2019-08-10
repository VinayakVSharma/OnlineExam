<%-- 
    Document   : terminate
    Created on : 1 Jul, 2017, 2:06:32 PM
    Author     : Vinayak Sharma
--%>

<%@page import="get.End"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Terminate Exam</title>
    </head>
    <body>

        <%
            try {
                End e = new End();
                Context env = (Context) new InitialContext().lookup("java:comp/env");
                String path = (String) env.lookup("root_dir");
                e.end(path + request.getParameter("roll") + ".xml");
                response.sendRedirect("../../connection pages/connection.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </body>
</html>
