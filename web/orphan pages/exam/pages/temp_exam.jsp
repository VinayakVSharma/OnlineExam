<%-- 
    Document   : temp_exam
    Created on : Mar 19, 2017, 5:32:26 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="bean.Specification"%>
<%@page import="bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Admin Template</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    
    </head>
    <body>
        <%!
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <%
            s = sf.openSession();
        %>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="index.html">Admin</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="#" class="profile-mini">
                            <img src="C:\Users\Dell\Desktop\register.jpg" alt="John Doe"/>
                        </a>
                        <div class="profile">
                            <div class="profile-image">
                                <img src="C:\Users\Dell\Desktop\register.jpg" alt="John Doe"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name">ADMIN</div>
                                <div class="profile-data-title">Web Developer/Designer</div>
                            </div>
                            <div class="profile-controls">
                                <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>
                                <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                            </div>
                        </div>                                                                        
                    </li>

                    <li class="active">
                        <a href="index.html"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></a>                        
                    </li>                    


                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li>


                                <a href="student.jsp"><span class="fa fa-table"></span> ADD/ UPDATE/ DELETE Student</a></li>

                            <li><a href="form-validation1.html"><span class="fa fa-list-alt"></span>Edit Student Password</a></li>
                            <li><a href="ViewStudent.html"><span class="fa fa-arrow-right"></span>View Student</a></li>

                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text">Subject</span></a>
                        <ul>                            
                            <li><a href="AddSubject.html"><span class="fa fa-align-justify"></span> ADD/Update/Delete Subject</a></li>
                            <li><a href="ViewSubject.html"><span class="fa fa-sort-alpha-desc"></span> View Subjects</a></li>

                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href=""><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
                        <ul>                            
                            <li><a href="Exam.jsp"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="ViewExam.jsp"><span class="fa fa-sort-alpha-desc"></span>View Exam</a></li>
                            <li><a href="AddSpecification.jsp"><span class="fa fa-sort-alpha-desc"></span>Add Specification</a></li>
                            <li><a href="ViewSpecification.jsp"><span class="fa fa-edit"></span> View Specification</a></li>
                            <li><a href="Export-Exam.jsp"><span class="fa fa-download"></span>Export Exam</a></li>   

                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text">Question Bank</span></a>
                        <ul>                            
                            <li><a href="AddNewQuestion1.html"><span class="fa fa-align-justify"></span> ADD/Update/Delete Questions</a></li>
                            <li><a href="ViewQuestionBank1.html"><span class="fa fa-sort-alpha-desc"></span> View Questions</a></li>
                            <li><a href="ExportQuestion.html"><span class="fa fa-download"></span>Import Question bank</a></li>                            
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Result</span></a>
                        <ul>
                            <li><a href="ViewResult.html"><span class="fa fa-image"></span>View Result</a></li>


                            <li><a href="ExportResult.html"><span class="fa fa-download"></span> Export Result</a></li>                     
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>

                            <li><a href="Analysis.html"><span class="fa fa-bar-chart-o"></span> <span class="xn-text"></span>Analysis/Stats</a></li>
                            <li><a href="Connections.html"><span class="fa fa-user"></span>Connections</a></li>


                        </ul>
                    </li>             



                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-cogs"></span> <span class="xn-text">Settings</span></a>                        
                        <ul>
                            <li><a href="pages-profile.html"><span class="fa fa-user"></span>Admin Profile</a></li>
                            <li><a href="pages-profile.html"><span class="fa fa-user"></span>Change Admin Profile</a></li>
                            <li><a href="ui-widgets.html"><span class="fa fa-heart"></span> Widgets</a></li>   

                            <li><a href="pages-calendar.html"><span class="fa fa-calendar"></span> Calendar</a></li>                         
                            <li><a href="ui-panels.html"><span class="fa fa-pencil-square-o"></span> Panels</a></li>



                            <li><a href="ui-sliders.html"><span class="fa fa-arrows-h"></span> Sliders</a></li>


                        </ul>
                    </li>               


                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->
            <!-- PAGE CONTENT -->
            <div class="page-content">

                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH -->
                    <li class="xn-search">
                        <form role="form">
                            <input type="text" name="search" placeholder="Search..."/>
                        </form>
                    </li>   
                    <!-- END SEARCH -->
                    <!-- SIGN OUT -->
                    <li class="xn-icon-button pull-right">
                        <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>                        
                    </li> 
                    <!-- END SIGN OUT -->
                    <!-- MESSAGES -->
                    <!-- TASKS -->
                    <!-- END TASKS -->
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>                    
                    <li class="active">Dashboard</li>
                </ul>
                <!-- END BREADCRUMB -->  

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">

                            <form class="form-horizontal" method="post">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><strong>Exam Specifications</strong> </h3>
                                        <ul class="panel-controls">
                                            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="panel-body">

                                    </div>
                                    <div class="panel-body">                                                                        


                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Exam Name</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" name="examname" class="form-control"/>
                                                </div>                                            
                                                <span class="help-block">Enter Exam Name</span>
                                            </div>
                                        </div>
                                        <%
                                            try {

                                                s = sf.openSession();
                                        %>
                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Course Code</label>
                                            <div class="col-md-6 col-xs-12">                                                        
                                                <select class="form-control select" name="ccode">

                                                    <%
                                                        qr = s.createQuery("from bean.Subject");

                                                        if (qr != null) {
                                                            List li = qr.list();
                                                            if (li != null) {
                                                                ListIterator lit = li.listIterator();
                                                                bean.Subject ar = new bean.Subject();
                                                                while (lit.hasNext()) {
                                                                    ar = (bean.Subject) lit.next();
                                                                    out.println("<option>" + ar.getC_code() + "</option>");
                                                                }
                                                            }
                                                        }


                                                    %>
                                                </select>
                                                <span class="help-block">Select Course Code</span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Specification Name</label>
                                            <div class="col-md-6 col-xs-12">                                                                                            
                                                <select class="form-control select" name="specname">
                                                    <%                                                    
                                                        qr = s.createQuery("select distinct spec_name from bean.Specification");

                                                        if (qr != null) {
                                                            List li = qr.list();
                                                            if (li != null) {
                                                                ListIterator lit = li.listIterator();
                                                                Specification sp = new Specification();
                                                                while (lit.hasNext()) {

                                                                    out.println("<option>" + lit.next() + "</option>");
                                                                }
                                                            }
                                                        }

                                                    %>


                                                </select>
                                                <span class="help-block">Select Specification Name</span>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Max Marks</label>
                                            <div class="col-md-6 col-xs-12">                                                                                            
                                                <select class="form-control select" name="maxmarks">
                                                    <%                                                        
                                                        qr = s.createQuery("select distinct total from bean.Specification");
                                                        if (qr != null) {
                                                            List li = qr.list();
                                                            if (li != null) {
                                                                ListIterator lit = li.listIterator();                                                                
                                                                while (lit.hasNext()) {

                                                                    out.println("<option>" + lit.next() + "</option>");
                                                                }
                                                            }
                                                        }

                                                    %>
                                                </select>
                                                <span class="help-block">Select Max Marks</span>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Max Marks</label>
                                            <div class="col-md-6 col-xs-12">                                                                                            
                                                <select class="form-control select" name="maxmarks">
                                                    <%                                                        
                                                        qr = s.createQuery("select distinct total from bean.Specification");
                                                        if (qr != null) {
                                                            List li = qr.list();
                                                            if (li != null) {
                                                                ListIterator lit = li.listIterator();                                                                
                                                                while (lit.hasNext()) {

                                                                    out.println("<option>" + lit.next() + "</option>");
                                                                }
                                                            }
                                                        }

                                                    %>
                                                </select>
                                                <span class="help-block">Select Max Marks</span>
                                            </div>
                                        </div>

                                        <div class="form-group">                                        
                                            <label class="col-md-3 col-xs-12 control-label">Branch</label>
                                            <div class="col-md-2">
                                                <select class="form-control select" name="branch">
                                                    <option value="IF" selected>IF</option>
                                                    <option value="CM">CM</option>
                                                    <option value="CE">Civil</option>
                                                    <option value="E&TC">E&TC</option>
                                                    <option value="EE">Electrical</option>
                                                    <option value="AE">Automobile</option>
                                                    <option value="ME">Mechanical</option>
                                                    <option value="IDD">IDD</option>
                                                    <option value="DDGM">DDGM</option>
                                                    <option value="PS">Plastic</option>
                                                </select>
                                            </div>                                            
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Max Time</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="etime"/>
                                                </div>                                            
                                                <span class="help-block">Enter Max Time</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Max Questions</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="mquestions"/>
                                                </div>                                            
                                                <span class="help-block">Enter Max Questions</span>
                                            </div>
                                        </div>
                                        <%                                            } catch (Exception e) {
                                                e.printStackTrace();
                                                System.out.println(e);
                                            } finally {
                                                s.close();
                                            }

                                        %>  
                                    </div>
                                    <div class="panel-footer">
                                        <button class="btn btn-default" type="reset">Clear Form</button>                                    
                                        <button class="btn btn-primary pull-right" onClick="this.form.action = '../AddExam';this.form.target = '' ">Submit Specification</button>
                                        <button class="btn btn-primary pull-right" onClick="this.form.action = 'Preview.jsp';this.form.target = '_blank' " >Preview Specification</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>                    

                </div>
                <!-- END PAGE CONTENT WRAPPER -->                                                


            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->

        <!-- START PRELOADS -->
        <audio id="audio-alert" src="audio/alert.mp3" preload="auto"></audio>
        <audio id="audio-fail" src="audio/fail.mp3" preload="auto"></audio>
        <!-- END PRELOADS -->                  

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>        
        <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="../js/plugins/scrolltotop/scrolltopcontrol.js"></script>

        <script type="text/javascript" src="../js/plugins/morris/raphael-min.js"></script>
        <script type="text/javascript" src="../js/plugins/morris/morris.min.js"></script>       
        <script type="text/javascript" src="../js/plugins/rickshaw/d3.v3.js"></script>
        <script type="text/javascript" src="../js/plugins/rickshaw/rickshaw.min.js"></script>
        <script type='text/javascript' src='../js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
        <script type='text/javascript' src='../js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>                
        <script type='text/javascript' src='../js/plugins/bootstrap/bootstrap-datepicker.js'></script>                
        <script type="text/javascript" src="../js/plugins/owl/owl.carousel.min.js"></script>                 

        <script type="text/javascript" src="../js/plugins/moment.min.js"></script>
        <script type="text/javascript" src="../js/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../js/settings.js"></script>

        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>

        <script type="text/javascript" src="../js/demo_dashboard.js"></script>
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->         
    </body>
</html>
