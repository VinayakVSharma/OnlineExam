<%-- 
    Document   : answer
    Created on : 8 Jun, 2017, 1:58:34 AM
    Author     : Vinayak Sharma
--%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="Helping_Classes.getStatus"%>
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
        <%!
            HttpSession session;
            String path;
        %>
        <%
            session = request.getSession();
            String clock = request.getParameter("clock");
            if (clock == null) {
                System.out.println();
                clock = (String) session.getAttribute("timer");
            }
        %>
        <!-- Declaration Started -->
        <%!            GetQue g = new GetQue();
            List<Element> q = null;

        %>
        <!-- Declaration Ended -->
        <script>

            var currFFZoom = 1;
            var currIEZoom = 100;

            function plus() {
                //alert('sad');
                var step = 0.02;
                currFFZoom += step;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                var stepie = 2;
                currIEZoom += stepie;
                $('body').css('zoom', ' ' + currIEZoom + '%');

            }
            ;
            function minus() {
                //alert('sad');
                var step = 0.02;
                currFFZoom -= step;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                var stepie = 2;
                currIEZoom -= stepie;
                $('body').css('zoom', ' ' + currIEZoom + '%');
            }
            ;
            function reset() {
                //alert('sad');
                currFFZoom = 1;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                currIEZoom = 100;
                $('body').css('zoom', ' ' + currIEZoom + '%');
            }
            ;
        </script>
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
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
        <script type="text/javascript" src="../MathJax-2.7.0/MathJax.js"></script>
    </head>
    <body oncontextmenu="return false;">
        <%
            getStatus ge = new getStatus();
            String status = ge.status((String) session.getAttribute("rl_no"));
            if (status.equals("Attempted")) {
                response.sendRedirect("end_exam.jsp?pass=gpn");
            }

        %>

        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap"> 

            <div class="panel panel-default">

                <div class="panel-body background-colorful">  

                    <div class="row">

                        <div class="col-md-12">
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="gallery">
                                        <a class="gallery-item">
                                            <div class="image">                              
                                                <img src="../img/logo-gpn.jpg" />     
                                            </div>
                                        </a>                                        
                                    </div>
                                </div>



                                <div class="col-md-4">
                                    <table class="table table-striped table-bordered">
                                        <%                                    try {
                                                SAXBuilder saxBuilder = new SAXBuilder();
                                                Context env = (Context) new InitialContext().lookup("java:comp/env");
                                                path = (String) env.lookup("root_dir");
                                                File file = new File(path + session.getAttribute("rl_no") + ".xml");
                                                Document document = saxBuilder.build(file);
                                                Element rootNode = document.getRootElement();
                                                Element student = rootNode.getChild("Exam_Details");
                                        %>

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
                                    </table>
                                    <div class="form-group">
                                        <center>
                                            <button class="btn btn-primary" name="" onclick="minus()">Zoom Out&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-zoom-out"></i></button>                                                                                                   
                                            <button class="btn btn-primary" name="" onclick="reset()">Reset&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-picture"></i></button>                                                                                                                                          
                                            <button class="btn btn-primary" name="" onclick="plus()">Zoom In&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-zoom-in"></i></button>                                                                                              
                                        </center>
                                    </div>
                                    <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>



                                <div class="col-md-4">
                                    <!-- CONTACT ITEM -->
                                    <div class="gallery">
                                        <a class="gallery-item pull-right">
                                            <div class="image">                              
                                                <img src="../img/gp.jpg" class="" />     
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container">
                <div class="panel panel-default">

                    <div class="panel-body">   
                        <div class="row">

                            <div class="col-md-12">
                                <div class="row">

                                    <div class="col-md-12">
                                        <!-- Start of Code -->        
                                        <%
                                            int i = Integer.parseInt(request.getParameter("vl"));
                                            q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
                                            Element e = g.que(q, i);
                                            if (request.getParameter("stat").equals("true")) {

                                                g.saveA(request.getParameter("option"), Integer.parseInt(request.getParameter("q_no")), path + session.getAttribute("rl_no") + ".xml", clock);
                                            }

                                        %>
                                        <form method="post" class="form-horizontal" name="forma">    
                                            <div class="form-group">                    
                                                <label class="col-md-2 control-label "><h5><strong>Question Marks</strong></h5></label>
                                                <div class="col-md-2">  
                                                    <div class="input-group">

                                                        <input type="hidden" class="form-control"  value="<%=e.getChildText("marks")%>" />
                                                        <input type="text" class="btn btn-primary"  value="<%=e.getChildText("marks")%>" disabled/>
                                                    </div>                                                
                                                </div>

                                                <div class="form-group">                    
                                                    <label class="col-md-2 col-md-offset-3 control-label "><h5><strong>Time Remaining</strong></h5></label>
                                                    <div class="col-md-2">  
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="fa fa-clock-o"></span></span>
                                                            <input type="hidden" class="form-control" name="clock" value="<%=clock%>" />
                                                            <input type="text" class="btn btn-primary" name="clock1" value="<%=clock%>" disabled/>
                                                        </div>                                                
                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label"><h5><strong><%= e.getAttributeValue("q_no")%></strong></h5></label>
                                                    <input type="hidden" class="form-control" name="q_no" value="<%= e.getAttributeValue("q_no")%>" />                                                                  
                                                    <div class="">
                                                        <div class="input-group">                                                                
                                                            <label class=" control-label"><h5><strong><%= e.getChildText("question")%></strong></h5></label>
                                                            <input type="hidden" class="form-control" name="question" value="<%= e.getChildText("question")%>" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">                    
                                                    <label class="col-md-2 control-label"><h5><strong>Options</strong></h5></label>
                                                    <div class=" col-md-3 col-xs-12"> 
                                                        <%
                                                            if (e.getChildText("user_c_ans").equals(e.getChildText("op1"))) {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op1")%>" checked/><%= e.getChildText("op1")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op1")%>" /><%= e.getChildText("op1")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                        <%
                                                            if (e.getChildText("user_c_ans").equals(e.getChildText("op2"))) {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op2")%>" checked/><%= e.getChildText("op2")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>                                                    
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op2")%>" /><%= e.getChildText("op2")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                        <%
                                                            if (e.getChildText("user_c_ans").equals(e.getChildText("op3"))) {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios3" value="<%= e.getChildText("op3")%>" checked/><%= e.getChildText("op3")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios3" value="<%= e.getChildText("op3")%>" /><%= e.getChildText("op3")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                        <%
                                                            if (e.getChildText("user_c_ans").equals(e.getChildText("op4"))) {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios4" value="<%= e.getChildText("op4")%>" checked/><%= e.getChildText("op4")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>
                                                        <div class="radio">
                                                            <label>
                                                                <h5>
                                                                    <strong>
                                                                        <input type="radio" name="option" id="optionsRadios4" value="<%= e.getChildText("op4")%>" /><%= e.getChildText("op4")%>
                                                                    </strong>
                                                                </h5>
                                                            </label>
                                                        </div>
                                                        <%
                                                            }
                                                        %>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="gallery" id="links">
                                                            <a class="gallery-item pull-right" href="../resources/question bank/<%= e.getChildText("q_id")%>.jpg" data-gallery>
                                                               <%
                                                               String path=getServletContext().getRealPath("resources/question bank/"+ e.getChildText("q_id")+".jpg");
                                                               if(path!=null){
                                                              %>
                                                                <img src="../resources/question bank/<%= e.getChildText("q_id")%>.jpg" width="200" height="200"></img>
                                                               <%
                                                                   }
                                                               %>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>


                                                <%
                                                    if (i > 0) {
                                                %>
                                                <button class="btn btn-primary pull-left" name="ext" onclick="this.form.action = 'answer.jsp?stat=true&vl=<%= i - 1%>'"><i class="fa fa-arrow-left">&nbsp;&nbsp;&nbsp;&nbsp;Previous</i></button>                                                  
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (i < q.size() - 1) {
                                                %>
                                                <button class="btn btn-primary pull-right" name="ext" onclick="this.form.action = 'answer.jsp?stat=true&vl=<%= i + 1%>'">Next&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right"></i></button>                                                  
                                                    <%
                                                        }
                                                    %>

                                                <div class="panel-footer" class="col-xs-3">
                                                    <center>
                                                        <button class="btn-lg btn-primary" name="summary" onclick="this.form.action = 'summary.jsp?vl=<%= i%>'">Summary</button>                                                 
                                                    </center>
                                                </div>

                                        </form>
                                    </div>
                                    <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
                                        <div class="slides"></div>
                                        <h3 class="title"></h3>
                                        <a class="prev">‹</a>
                                        <a class="next">›</a>
                                        <a class="close">×</a>
                                        <a class="play-pause"></a>
                                        <ol class="indicator"></ol>
                                    </div> 

                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
            </div>
        </div>

        <script>
            var timeout = <%=clock%>;
            function timer()
            {
                if (--timeout > 0)
                {
                    document.forma.clock.value = timeout;
                    document.forma.clock1.value = parseInt(timeout / 60) + ":" + timeout % 60;
                    window.setTimeout("timer()", 1000);
                } else
                {
                    document.forma.clock.value = "Time over";
                    ///disable submit-button etc
                    var vl =<%= request.getParameter("vl")%>;
                    window.location.href = "summary.jsp?vl=" + vl + "&option=" + document.forma.option.value;
                }
            }
        </script>

        <script>
            timer();
        </script>

        <script language="JavaScript">
            /**
             * Disable right-click of mouse, F12 key, and save key combinations on page
             * By Arthur Gareginyan (arthurgareginyan@gmail.com)
             * For full source code, visit http://www.mycyberuniverse.com
             */
            window.onload = function () {
                document.addEventListener("contextmenu", function (e) {
                    e.preventDefault();
                }, false);
                document.addEventListener("keydown", function (e) {
                    //document.onkeydown = function(e) {
                    // "I" key
                    if (e.keyCode == 17 || e.keyCode == 27 || e.keyCode == 18) {
                        disabledEvent(e);
                    }
                    if(e.keyCode >= 65 && e.keyCode<=90)
                        disabledEvent(e);
                    
                    if (e.keyCode >= 112 && e.keyCode <= 123) {
                        disabledEvent(e);
                    }
                }, false);

                
                function disabledEvent(e) {
                    if (e.stopPropagation) {
                        alert("Not Allowed");
                        e.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                    e.preventDefault();
                    return false;
                }
            };
        </script>


        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery_002.js"></script>
        <script type="text/javascript" src="../js/fullscreen.js"></script>
        <script type="text/javascript" src="../js/screenfull.js"></script>
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
        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>        
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->         

    </body>
</html>







