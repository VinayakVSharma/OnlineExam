<%-- 
    Document   : student_login
    Created on : 28 Mar, 2017, 10:28:02 PM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../controller/landing/student_ login.jsp" class="form-horizontal" method="post">
            <div class="form-group">
                <div class="col-md-12">
                    <input type="text" class="form-control" placeholder="Username" name="roll_no"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <input type="password" class="form-control" placeholder="Password" name="temp_rl"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-6">
                    <a href="#" class="btn btn-link btn-block">Forgot your password?</a>
                </div>
                <div class="col-md-6">
                    <button class="btn btn-info btn-block"name="login">Log In</button>
                </div>
            </div>

            <div class="login-subtitle">
                Don't have an account yet? <a href="#">Create an account/Register</a>
            </div>
        </form>
    </body>
</html>
