<%-- 
    Document   : index
    Created on : Feb 10, 2017, 11:43:22 AM
    Author     : Vinayak Sharma
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="java.io.File"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>EXAM</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    


    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="container">                

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <center><h1><strong>Click On A Choice</strong></h1></center>
                            </div>
                            <div class="row">
                                <div class="panel-body">                                         
                                    <button class="btn-lg btn-primary pull-right" onclick="window.location.href = 'landing pages/login.jsp'">Student</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT WRAPPER -->       
        </div>
        <!-- END PAGE CONTAINER -->
        <%
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            String path = (String) env.lookup("root_dir");
            File f = new File(path);
            f.mkdir();
            response.sendRedirect("landing pages/login.jsp");
        %>
    </body>
</html>



