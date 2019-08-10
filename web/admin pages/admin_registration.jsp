<%-- 
    Document   : admin_registration
    Created on : 26 Jun, 2017, 1:11:03 AM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="body-full-height">
    <head>        
        <!-- META SECTION -->
        <title>Exam Admin</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>


        <!-- EOF CSS INCLUDE -->                                
        <style>div.wrapper {    
                margin-top: 1px;
                margin-bottom: 8px;
                padding: 10px;
            }

            h1 {
                text-shadow: 2px 2px 5px grey;
            }
            h2 {
                text-shadow: 2px 2px 5px grey;
            }

            p{
                color: white;
                text-shadow: 2px 2px 4px    #ADD8E6;
            }

        </style>     
    </head>
    <body>

        <div class="login-container lightmode">

            <div class="login-box animated fadeInDown">

                <div class="login-body">
                    <div class="login-title"><center><strong>Exam Admin</strong><br>New Registration</center></div>
                    <form action="../controller/admin/admin_add.jsp" class="form-horizontal" method="post">
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="text" class="form-control" placeholder="Username" name="username"required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="password" class="form-control" placeholder="Password" name="password" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="password" class="form-control" placeholder=" Confirm Password" name="c_password" required/>
                            </div>
                        </div>

                        
                        <div class="form-group">                            
                            <div class="col-md-6 col-md-offset-6">
                                <button class="btn btn-info btn-block pull-right" name="register">Register</button>                            
                            </div>
                        </div>

                        <div class="login-subtitle">
                            <a href="admin_login.jsp">Go Back To Admin Login Page</a>
                        </div>
                    </form>
                </div>
                <div class="login-footer">
                    <div class="pull-left">
                        &copy; TechNest
                    </div>

                </div>
            </div>            
        </div>

    </body>
</html>





