<%-- 
    Document   : end_exam.jsp
    Created on : 8 Jun, 2017, 2:34:48 AM
    Author     : Vinayak Sharma
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="get.GetQue"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.JDOMException"%>
<%@page import="get.End"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileWriter"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="java.io.File"%>
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

        <%!
            GetQue g = new GetQue();
            List<Element> q = null;
            End e = new End();
        %>
        <%
            session = request.getSession();
        %>
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
            <h2 class="center-block">End Exam</h2>
        </div>                   

        <!-- PAGE CONTENT WRAPPER -->
        <div class="container">


            <div class="page-content-wrap">   
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form method="post" action="">
                                    <div class="form-group"> 

                                        <center><label class="col-md-12 control-label"><h2><strong>Enter Password</strong></h2></label></center>

                                        <div class=" col-md-12 col-xs-12"> 
                                            <div class="input-group ">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>   
                                                <input type="password" class="form-control pull-right" name="pass"/>      
                                            </div> 
                                        </div>
                                    </div>
                                    <br><br><br><br>

                                    <div class="panel-footer" class="col-xs-3">
                                        <%
                                            SAXBuilder saxBuilder = new SAXBuilder();
                                            session = request.getSession();
                                            Context env = (Context) new InitialContext().lookup("java:comp/env");
                                            String path = (String) env.lookup("root_dir");
                                            // obtain file object 
                                            File file = new File(path + session.getAttribute("rl_no") + ".xml");

                                            try {
                                                // converted file to document object
                                                Document document = saxBuilder.build(file);

                                                // get root node from xml
                                                Element rootNode = document.getRootElement();

                                                // got all xml elements into a list
                                                List<Element> studentList = rootNode.getChildren("Exam_Details");
                                                String type = rootNode.getChild("Exam_Details").getChildText("exam_type");
                                                System.out.println(type + "type");
                                                if (type.equals("PT")) {

                                        %>
                                        <center><button class="btn-lg btn-primary " name="endexam">End Exam</button></center>
                                            <%                                        } else {
                                            %>
                                        <center><button class="btn-lg btn-primary pull-right" name="logout">LogOut</button></center>
                                            <%
                                                    }

                                                } catch (JDOMException e) {
                                                    // TODO Auto-generated catch block
                                                    e.printStackTrace();
                                                } catch (IOException e) {
                                                    // TODO Auto-generated catch block
                                                    e.printStackTrace();
                                                }
                                            %>
                                    </div>
                                </form>
                                <%
                                    if (request.getParameter("logout") != null) {
                                        String s = request.getParameter("pass");
                                        if (s.equals("end")) {
                                            session = request.getSession();
                                            e.end(path + session.getAttribute("rl_no") + ".xml");
                                            session.invalidate();
                                %>
                                <script>
                                    window.close();
                                </script>
                                <%
                                        }
                                    }
                                %>
                                <%
                                    if (request.getParameter("endexam") != null) {
                                        String s = request.getParameter("pass");
                                        if (s.equals("end")) {
                                            e.end(path + session.getAttribute("rl_no") + ".xml");
                                %>
                                <script>
                                    window.location.href = "../result pages/result_show.jsp";
                                </script>
                                <%
                                        }
                                    }
                                %> 
                            </div>
                        </div>
                    </div>
                    <!-- PAGE CONTENT WRAPPER -->                
                </div>
            </div>
        </div>

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
        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>        
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->         
    </body>
</html>






