<%-- 
    Document   : result_show
    Created on : 15 Jun, 2017, 12:08:45 PM
    Author     : Vinayak Sharma
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="get.End"%>
<%@page import="get.GetQue"%>
<%@page import="org.jdom2.JDOMException"%>
<%@page import="org.jdom2.Attribute"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileWriter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
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
        <%!            GetQue g = new GetQue();
            End e = new End();
            List<Element> q = null;
            public int stdList;
        %>
        <!-- Declaration Ended -->
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
        <script type="text/javascript" src="../MathJax-2.7.0/MathJax.js"></script>
    </head>
    <body>
        <div class="page-title">                    
            <h1><center><strong>Result & Analysis</strong></center></h1>
        </div>                   

        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap">   

            <%
                int cnt = 0, a = 0, c = 0, na = 0, wa = 0;

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
                    List<Element> studentList = rootNode.getChildren("Question");

                    for (int i = 0; i <= studentList.size() - 1; i++) {
                        Element element = studentList.get(i);
                        if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) {
                            cnt = cnt + Integer.parseInt(element.getChildText("marks"));
                            a++;
                        } else {
                            wa++;
                        }
                        if (element.getChildText("user_c_ans").equals("null")) {
                            na++;
                        } else {
                            System.out.println(element.getChildText("user_c_ans") + "asasasas" + na);
                        }
                        c++;
                    }
            %>
            <div class="container">

                <div class="row">
                    <div class="col-md-12">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table class="table table-striped">
                                            <tr>
                                                <td><h3>Total Questions</h3></td>
                                                <td><h3><%=c%></h3></td>
                                            </tr>
                                            <tr>
                                                <td><h3>Marks</h3></td>
                                                <td><h3><%=cnt%></h3></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-5">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table class="table table-striped">
                                            <tr>
                                                <td><h3>Attempted Question</h3></td>
                                                <td><h3><%=a%></h3></td>
                                            </tr>
                                            <tr>
                                                <td><h3>Un-Attempted Question</h3></td>
                                                <td><h3><%=na%></h3></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table class="table table-striped">
                                            <tr>
                                                <td><h3>Correct Answers</h3></td>
                                                <td><h3><%=(c - wa)%></h3></td>
                                            </tr>
                                            <tr>
                                                <td><h3>Wrong Answers</h3></td>
                                                <td><h3><%=wa%></h3></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th><h3><p class="text-success">Question No</p></h3></th>
                                        <th><h3><p class="text-success">Question</p></h3></th>
                                        <th><h3><p class="text-success">Option A</p></h3></th>
                                        <th><h3><p class="text-success">Option B</p></h3></th>
                                        <th><h3><p class="text-success">Option C</p></h3></th>
                                        <th><h3><p class="text-success">Option D</p></h3></th>
                                        <th><h3><p class="text-success">Correct Answer</p></h3></th>
                                        <th><h3><p class="text-success">Attempted Answer</p></h3></th>
                                        <th><h3><p class="text-success">Marks</p></h3></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        stdList = studentList.size();
                                        // simple iteration to see the result on console
                                        for (int i = 0; i <= studentList.size() - 1; i++) {
                                            Element element = studentList.get(i);
                                    %>
                                    <tr>
                                        <td><h5><strong><%=element.getAttributeValue("q_no")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("question")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("op1")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("op2")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("op3")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("op4")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("c_ans")%></strong></h5></td>
                                        <td><h5><strong><%=element.getChildText("user_c_ans")%></strong></h5></td>
                                        <td><h5><strong><%
                                            if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) {
                                                out.println(element.getChildText("marks"));
                                            } else {
                                                out.println("0");
                                            }
                                                    %></strong></h5></td>
                                    <tr>
                                        <%
                                                }
                                                XMLOutputter xmlOutput = new XMLOutputter();
                                                xmlOutput.setFormat(Format.getPrettyFormat().setEncoding("ISO-8859-1"));
                                                FileWriter fw = new FileWriter(path + session.getAttribute("rl_no") + ".xml");
                                                xmlOutput.output(document, fw);
                                                fw.close();
                                            } catch (JDOMException e) {
                                                // TODO Auto-generated catch block
                                                e.printStackTrace();
                                            } catch (IOException e) {
                                                // TODO Auto-generated catch block
                                                e.printStackTrace();
                                            }
                                        %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <!-- END BASIC TABLE SAMPLE -->
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


                                        <div class="panel-footer" class="col-xs-3">
                                            <center><button class="btn-lg btn-primary " name="endexam">End Exam</button></center>
                                        </div>
                                    </form>
                                    <%
                                        if (request.getParameter("endexam") != null) {
                                            String s = request.getParameter("pass");
                                            if (s.equals("end")) {
                                                session = request.getSession();
                                                e.end(path + session.getAttribute("rl_no") + ".xml");
                                                session.invalidate();
                                                %>
                                <script>
                                    window.location.href = "../landing pages/login.jsp";
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

        <script type="text/javascript" src="../js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
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







