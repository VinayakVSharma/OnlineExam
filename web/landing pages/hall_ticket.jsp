<%-- 
Document   : hall_ticket
Created on : 8 Jun, 2017, 1:42:48 AM
Author     : Vinayak Sharma
--%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="org.jdom2.Attribute"%>
<%@page import="java.io.FileWriter"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
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
        <div class="page-title">                    
            <h1><center><strong>Hall Ticket</strong></center></h1>
        </div>
        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-md-12">

                                <div class="row">

                                    <div class="col-md-7">
                                        <div class="gallery">
                                            <a class="gallery-item pull-right">
                                                <div class="image">                              
                                                    <img src="../resources/student images/<%=session.getAttribute("rl_no")%>.png" />     
                                                </div>
                                            </a>                                        
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="gallery">
                                            <a class="gallery-item pull-right">
                                                <div class="image">                              
                                                    <img src= "../resources/student sign/<%=session.getAttribute("rl_no")%>.png" />     
                                                </div>
                                            </a>                                        
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <%
                                    try {
                                        SAXBuilder saxBuilder = new SAXBuilder();
                                        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
                                        String path=(String)env.lookup("root_dir");
                                        File file = new File(path + session.getAttribute("rl_no") + ".xml");
                                        Document document = saxBuilder.build(file);
                                        Element rootNode = document.getRootElement();
                                        Element student = rootNode.getChild("Exam_Details");

                                %>
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <table class="table table-striped table-bordered">
                                            <tr>
                                                <td><h6><strong>Name</strong></h6></td>
                                                <td><%=student.getChildText("student_name")%></td>


                                                <td><h6><strong>Roll No</strong></h6></td>
                                                <td><%=student.getChildText("roll_no")%></td>

                                            </tr>
                                            <tr>
                                                <td><h6><strong>Branch</strong></h6></td>
                                                <td><%=student.getChildText("branch")%></td>

                                                <td><h6><strong>Year</strong></h6></td>
                                                <td><%=student.getChildText("year")%></td>
                                            </tr>
                                            <tr>
                                                <td><h6><strong>Course Code</strong></h6></td>
                                                <td><%=student.getChildText("c_code")%></td>


                                                <td><h6><strong>Course Name</strong></h6></td>
                                                <td><%=student.getChildText("c_name")%></td>

                                            </tr>
                                            <tr>
                                                <%
                                                    document.detachRootElement();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div class="panel-footer" class="col-xs-3">
        <center><button class="btn-lg btn-primary" name="submit" onclick="answer()">Start Exam</button></center>                                       
    </div>

    <!-- START SCRIPTS -->
    <script type="text/javascript">
        function answer(){
            var mywindow=window.open('answer.jsp?vl=0&stat=false','EXAM','fullscreen=');
            document.addEventListener("focus", function () {
                    window.location.href="login.jsp";
                }, false);
        }
    </script>
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
    <script type="text/javascript" src="../js/plugins.js"></script>        
    <script type="text/javascript" src="../js/actions.js"></script>        
    <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->         
</body>
</html>






