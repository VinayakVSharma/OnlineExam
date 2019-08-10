<%-- 
    Document   : answer
    Created on : 8 Jun, 2017, 1:58:34 AM
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

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE --> 
        <%!
        HttpSession session;
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

</head>
<body>
    <div class="container">

        <ul class="x-navigation x-navigation-horizontal navbar-fixed-top" >

            <li class="xn-logo">
                <a>TechNest</a>
            </li>

            <li class="">
                <a>EXAM</a>                        
            </li>         


            <div class="page-title">                    
                <h2><span class=""></span></h2>
            </div>
            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">   
                <div class="panel panel-default">

                </div>
                <div class="panel panel-default">
                    <div class="panel-body">                                                                       

                        <div class="row">

                            <div class="col-md-12">
                                <div class="row">

                                    <div class="col-md-10">
                                        <!-- Start of Code -->        
                                        <%
                                        int i = Integer.parseInt(request.getParameter("vl"));
                                        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
                                        String path=(String)env.lookup("root_dir");
                                        q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
                                        Element e = g.que(q, i);
                                        if (request.getParameter("stat").equals("true")) {

                                        g.saveA(request.getParameter("option"), Integer.parseInt(request.getParameter("q_no")), path + session.getAttribute("rl_no") + ".xml", clock);
                                    }

                                    %>
                                    <form method="post" class="form-horizontal">    

                                        <div class="form-group">                    
                                            <label class="col-md-2  control-label"><h5><strong>Minutes Remaining</strong></h5></label>
                                            <div class=" col-md-4 col-xs-12">  
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-clock-o"></span></span>
                                                    <input type="hidden" class="form-control" name="clock" value="<%=clock%>" />
                                                    <input type="text" class="form-control" name="clock1" value="<%=clock%>" disabled/>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-2 col-xs-12 control-label"><h6><strong><%= e.getAttributeValue("q_no")%></strong></h6></label>
                                            <div class=" col-md-4 col-xs-12">
                                                <div class="input-group">

                                                    <label class=" control-label"><h6><strong><%= e.getChildText("question")%></strong></h6></label>
                                                </div>
                                            </div>
                                        </div> 


                                        <div class="form-group">                    
                                            <label class="col-md-2 control-label"><h6><strong>Options</strong></h6></label>
                                            <div class=" col-md-3 col-xs-12"> 
                                                <%
                                                if (e.getChildText("user_c_ans").equals(e.getChildText("op1"))) {
                                                %>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op1")%>" /><%= e.getChildText("op1")%>
                                                    </label>
                                                </div>
                                                <%
                                            } else {
                                            %>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op1")%>" /><%= e.getChildText("op1")%>
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
                                                <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op2")%>" /><%= e.getChildText("op2")%>
                                            </label>
                                        </div>
                                        <%
                                    } else {
                                    %>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="option" id="optionsRadios1" value="<%= e.getChildText("op2")%>" /><%= e.getChildText("op2")%>
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
                                        <input type="radio" name="option" id="optionsRadios3" value="<%= e.getChildText("op3")%>" /><%= e.getChildText("op3")%>
                                    </label>
                                </div>
                                <%
                            } else {
                            %>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="option" id="optionsRadios3" value="<%= e.getChildText("op3")%>" /><%= e.getChildText("op3")%>
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
                                <input type="radio" name="option" id="optionsRadios4" value="<%= e.getChildText("op4")%>" /><%= e.getChildText("op4")%>
                            </label>
                        </div>
                        <%
                    } else {
                    %>
                    <div class="radio">
                        <label>
                            <input type="radio" name="option" id="optionsRadios4" value="<%= e.getChildText("op4")%>" /><%= e.getChildText("op4")%>
                        </label>
                    </div>
                    <%
                }
                %>
            </div>
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
        <%
        if (i > 0) {
        %>
        <button class="btn btn-primary pull-left" name="ext" onclick="this.form.action = 'ind.jsp?stat=true&vl=<%= i - 1%>'"><i class="fa fa-arrow-left">    Previous</i></button>                                                  
        <%
    }
    %>
    <%
    if (i < q.size() - 1) {
    %>
    <button class="btn btn-primary pull-right" name="ext" onclick="this.form.action = 'ind.jsp?stat=true&vl=<%= i + 1%>'">Next    <i class="fa fa-arrow-right"></i></button>                                                  
    <%
}
%>


<div class="panel-footer center-block">
    <button class="btn-lg btn-primary  col-md-2 pull-right" name="summary" onclick="this.form.action = summary.jsp?vl =<%= i%>'">Summary</button>                                                 
</div>

</form>
</div>
<div class="col-md-2">
    <div class="gallery " id="links">
        <a class="gallery-item" href="../img/mali sir.jpg" data-gallery>

            <div class="image" >                              
                <img src="../img/mali sir.jpg" alt="" height="200" width="200">                                                                     
            </div>                                
        </a>
    </div>
</div>

</div>
</div>
</div>
</div>
</div>
</div>
<!-- PAGE CONTENT WRAPPER -->    
</ul>
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

<script type="text/javascript" src="../js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
<script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<!-- END PAGE PLUGINS -->       

<!-- START TEMPLATE -->
<script type="text/javascript" src="../js/settings.js"></script>
<script type="text/javascript" src="../js/plugins.js"></script>        
<script type="text/javascript" src="../js/actions.js"></script>        
<!-- END TEMPLATE -->
<script>
    </body>
    </html>
    <html>
    <head>
    <!--
    
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
                    //-->
                </script>
                <body>
                    <script>
                        
                        timer();
                        
                        
                    </script>
                    <!-- END SCRIPTS -->         

                </body>
                </html>







