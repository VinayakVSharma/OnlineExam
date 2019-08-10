<%-- 
    Document   : accept_mathjax
    Created on : Feb 4, 2017, 2:04:20 PM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <script>
            $('.datepicker').datepicker({
                format: 'dd/MM/yyyy',
                startDate: '-3d'
            });
        </script>
    </head>
    <body>
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
                                <img src="assets\images\users\no-image.jpg" alt="John Doe"/>
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
                        <a href="Dashboard.html"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></a>                        
                    </li>                    


                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li>


                                <a href="Student_add_update_delete.jsp"><span class="fa fa-table"></span> ADD/ UPDATE/ DELETE Student</a></li>

                            <li><a href="Student_password.jsp"><span class="fa fa-list-alt"></span>Edit Student Password</a></li>
                            <li><a href="Student_view.jsp"><span class="fa fa-arrow-right"></span>View Student</a></li>

                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.jsp"><span class="fa fa-table"></span> <span class="xn-text">Subject</span></a>
                        <ul>                            
                            <li><a href="Subject_add_delete.html"><span class="fa fa-align-justify"></span> ADD/Update/Delete Subject</a></li>
                            <li><a href="Subject_view.html"><span class="fa fa-sort-alpha-desc"></span> View Subjects</a></li>

                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="Exam_schedule.html"><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
                        <ul>                            
                            <!--<li><a href="AddExam.html"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="ViewExam.html"><span class="fa fa-sort-alpha-desc"></span>View Exam</a></li>
                            <li><a href="ViewExam.html"><span class="fa fa-sort-alpha-desc"></span>PT/Final Exam</a></li>
                            <li><a href="table-export.html"><span class="fa fa-download"></span>Export Exam</a></li>   
                                 <li><a href="ExamSchedule.html"><span class="fa fa-edit"></span> Exam Schedule</a></li>-->                         
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text">Question Bank</span></a>
                        <ul>                            
                            <li><a href="Question_add_update_delete.html"><span class="fa fa-align-justify"></span> ADD/Update/Delete Questions</a></li>
                            <li><a href="Question_view.html"><span class="fa fa-sort-alpha-desc"></span> View Questions</a></li>
                            <li><a href="Question_import.html"><span class="fa fa-download"></span>Import Question bank</a></li>                            
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Result/Reports</span></a>
                        <ul>
                            <li><a href="Result_view.html"><span class="fa fa-image"></span>View Result</a></li>


                            <!-- <li><a href="ExportResult.html"><span class="fa fa-download"></span> Export Result</a></li>  -->                   
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>

                            <li><a href="Analysis_satistics.html"><span class="fa fa-bar-chart-o"></span> <span class="xn-text"></span>Analysis/Stats</a></li>
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
                        <div class="col-md-4">


                            <form action="controller/add_student_1.jsp" class="form-horizontal" method="post">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" placeholder="name" name="student_name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" placeholder="roll no" name="roll_no"/>
                                    </div>
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-3 col-xs-12 control-label">Year</label>
                                    <div class="col-md-4">
                                        <select class="form-control select" name="year">
                                            <option value="FIRST" >First</option>
                                            <option value="SECOND" selected>Second</option>
                                            <option value="THIRD">Third</option>
                                        </select>
                                    </div>                                            
                                </div>

                                <div class="form-group">                                        
                                    <label class="col-md-3 col-xs-12 control-label">Branch</label>
                                    <div class="col-md-2">
                                        <select class="form-control select" name="branch">
                                            <option value="IF" >IF</option>
                                            <option value="CM">CM</option>
                                            <option value="CE">Civil</option>
                                            <option value="E&TC">E&TC</option>
                                            <option value="EE">Electrical</option>
                                            <option value="AE" selected>Automobile</option>
                                            <option value="ME">Mechanical</option>
                                            <option value="IDD">IDD</option>
                                            <option value="DDGM">DDGM</option>  
                                            <option value="PL">Plastic</option>  
                                        </select>
                                    </div>                                            
                                </div>
                                <div class="form-group">                                        
                                    <label class="col-md-3 col-xs-12 control-label">Date of birth</label>
                                    <div class="input-group date" data-provide="datepicker">
                                        <input type="text" class="form-control" name="dob">
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                    </div>                                               
                                </div>
                                <div class="form-group"> 
                                    <div class="col-md-6">
                                        <input type="file" name="file_select" accept=".csv,.xls,.xlsx"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-md-6">
                                        <button class="btn btn-info btn-block" value="" name="btn1">add stud</button>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <button class="btn btn-info btn-block" value="" name="btn2">import list</button>
                                    </div>
                                </div>


                            </form>
                        </div>

                    </div>

                    <!-- START DASHBOARD CHART -->
                    <div class="chart-holder" id="dashboard-area-1" style="height: 200px;"></div>
                    <div class="block-full-width">

                    </div>                    
                    <!-- END DASHBOARD CHART -->

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
        <script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='js/plugins/icheck/icheck.min.js'></script>        
        <script type="text/javascript" src="js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="js/plugins/scrolltotop/scrolltopcontrol.js"></script>

        <script type="text/javascript" src="js/plugins/morris/raphael-min.js"></script>
        <script type="text/javascript" src="js/plugins/morris/morris.min.js"></script>       
        <script type="text/javascript" src="js/plugins/rickshaw/d3.v3.js"></script>
        <script type="text/javascript" src="js/plugins/rickshaw/rickshaw.min.js"></script>
        <script type='text/javascript' src='js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
        <script type='text/javascript' src='js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>                
        <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-datepicker.js'></script>                
        <script type="text/javascript" src="js/plugins/owl/owl.carousel.min.js"></script>                 

        <script type="text/javascript" src="js/plugins/moment.min.js"></script>
        <script type="text/javascript" src="js/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="js/settings.js"></script>

        <script type="text/javascript" src="js/plugins.js"></script>        
        <script type="text/javascript" src="js/actions.js"></script>

        <script type="text/javascript" src="js/demo_dashboard.js"></script>

        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->        
    </body>
</html>






