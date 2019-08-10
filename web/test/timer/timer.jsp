<%-- 
    Document   : timer
    Created on : Mar 23, 2017, 4:54:32 AM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <script>

            <%
                String clock = request.getParameter("clock");
                if (clock == null) {
                    clock = "20";
                }
            %>
            var timeout = <%=clock%>;
            var cnt = 1;
            function timer()
            {
                if(cnt < 5){
                   cnt ++;
               }
               else {
                   cnt=0;
            alert("hiiii");
            
               }
                if (--timeout > 0)
                {
                    document.forma.clock.value = timeout;
                    window.setTimeout("timer()", 1000);
                    
               

                } else
                {
                    document.forma.clock.value = "Time over";
<%
response.sendRedirect("../Dashboard.html?success= ended");
%>


                    ///disable submit-button etc
                }
            }

        </script>
    <body>
        <form action="<%=request.getRequestURL()%>" name="forma">
            Seconds remaining: <input type="text" name="clock" value="<%=clock%>" style="border:0px solid white">
            ...
        </form>
        <script>
            <!--
            timer();
            //-->
        </script>
    </body></html>