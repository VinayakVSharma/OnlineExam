<%-- 
    Document   : instruction
    Created on : 29 Mar, 2017, 1:20:32 AM
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
        <form action="" method="post">
            <div class="col-md-6">
                <button class="btn btn-info btn-block"name="ok">OK</button>
            </div>            
        </form>

        <%
            if (request.getParameter("ok") != null) { 
                session = request.getSession();
                out.println(session.getAttribute("rl_no"));
                out.println(session.getAttribute("duration"));
              
        %>
        <form action="" method="post">
            <div class="form-group">
                <div class="col-md-12">
                    <input type="password" class="form-control" placeholder="Password" name="password"/>
                </div>
            </div>

            <div class="col-md-6">
                <button class="btn btn-info btn-block"name="confirm">Start Exam</button>
            </div>            
        </form>
        <%            }
            if (request.getParameter("confirm") != null) {

                response.sendRedirect("answer paper_1.jsp");
            }
        %>
    </body>
</html>
