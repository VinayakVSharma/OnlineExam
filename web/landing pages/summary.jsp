<%-- 
    Document   : summary.jsp
    Created on : 8 Jun, 2017, 2:27:51 AM
    Author     : Vinayak Sharma
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="get.GetQue"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>EXAM</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->  
        <!-- Declaration Started -->
        <%!
            GetQue g = new GetQue();
            List<Element> q = null;

            String getStatus(String value) {

                if (value.equals("") || value.equals("null")) {
                    return "Not Attempted";
                } else {
                    return "Attempted";
                }

            }
        %>
        <!-- Declaration Ended -->
        <script type="text/javascript">
            $(document).ready(function () {
                //Disable cut copy paste
                $('body').bind('cut copy paste', function (e) {
                    e.preventDefault();
                });

                //Disable mouse right click
                $("body").on("contextmenu", function (e) {
                    return false;

                });

            });
        </script>
    </head>
    <body>
        <%
            String clock = request.getParameter("clock");
            if (clock == null) {
                clock = "180";
            }
        %>

        <div class="page-title">                    
            <h1><center><strong>Summary</strong></center></h1>
        </div>                   
        <div class="container">
            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">   
                <div class="panel panel-default">
                    <div class="panel-body">   
                        <div class="row">

                            <div class="col-md-12">
                                <%
                                    session = request.getSession();
                                    int i = Integer.parseInt(request.getParameter("vl"));
                                    Context env = (Context) new InitialContext().lookup("java:comp/env");
                                    String path = (String) env.lookup("root_dir");
                                    q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
                                    Element e = g.que(q, i);

                                    g.saveA(request.getParameter("option"), Integer.parseInt(e.getAttributeValue("q_no")), path + session.getAttribute("rl_no") + ".xml", request.getParameter("clock"));


                                %>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th><h3><p class="text-success">Question No</p></h3></th>
                                            <th><h3><p class="text-success">&nbsp;&nbsp;Status</p></h3></th>
                                            <th><h3><p class="text-success">Marks</p></h3></th>
                                            <th><h3><p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;Action</p></h3></th>
                                        </tr>
                                    </thead>
                                    <%                                        q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
                                        for (int t = 0; t < q.size(); t++) {
                                            Element sum = q.get(t);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= sum.getAttributeValue("q_no")%></strong></h5></td>
                                            <td><h5><strong><%= getStatus(sum.getChildText("user_c_ans"))%></strong></h5></td>
                                            <td><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= sum.getChildText("marks")%></strong></h5></td>
                                            <td><h5><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="answer.jsp?stat=false&vl=<%= t%>&clock=<%= request.getParameter("clock")%>">Change</a></strong></h5></td>
                                        </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                                <div class="panel-footer" class="col-xs-3">   
                                    <center>
                                        <button class="btn-lg btn-primary" name="summary" onclick="window.location.href = 'end_exam.jsp'">End Exam</button>                                                  
                                    </center>
                                </div> 


                            </div>
                        </div>
                        <!-- PAGE CONTENT WRAPPER -->                
                    </div>
                </div>
            </div>
        </div>

        <!-- START PRELOADS -->
        <audio id="audio-alert" src="../audio/alert.mp3" preload="auto"></audio>
        <audio id="audio-fail" src="../audio/fail.mp3" preload="auto"></audio>
        <!-- END PRELOADS -->               

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <!-- END PAGE PLUGINS -->       

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../js/settings.js"></script>
        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>        
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->         
    </body>
</html>






