<%-- 
    Document   : student_update
    Created on : Feb 20, 2017, 8:33:18 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Exam Admin</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    

        <script>
            $('.datepicker').datepicker({
                format: 'dd/MM/yyyy',
                startDate: '-3d'
            });
        </script>
        <%!
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();

            }
        %>
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">

                    <li class="xn-logo">
                        <a href="../Dashboard.html">Exam Admin</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>

                    <li class="xn-profile">                            
                        <div class="profile">
                            <div class="profile-image">
                                <img src="../../img/mali sir.jpg" alt="Pravin Mali"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name">ADMIN</div>
                                <div class="profile-data-title">Java Developer</div>
                            </div>
                            <div class="profile-controls">
                                <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>                                      
                            </div>
                        </div>                                                                        
                    </li>

                    <li class="">
                        <a href="../../Dashboard.html"><span class="fa fa-desktop"></span>Dashboard</span></a>                        
                    </li>                

                    <li class="xn-openable active">
                        <a href="../../student pages/student_add_update_delete.jsp"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li><a href="../../student pages/student_add_update_delete.jsp"><span class="fa fa-table"></span>Add / Update / Delete </a></li>
                            <li><a href="../../student pages/student_display.jsp"><span class="fa fa-arrow-right"></span>View Student</a></li>
                            <li><a href="../../student pages/student_file_upload.jsp"><span class="fa fa-arrow-right"></span>File Upload</a></li>
                            <li><a href="../../student pages/student_list_upload.jsp"><span class="fa fa-arrow-right"></span>List Upload</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../subject pages/subject_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Subject</span></a>
                        <ul>                            
                            <li><a href="../../subject pages/subject_add_update_delete.jsp"><span class="fa fa-align-justify"></span>Add / Update / Delete</a></li>
                            <li><a href="../../subject pages/subject_display.jsp"><span class="fa fa-sort-alpha-desc"></span> View Subjects</a></li>

                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../exam pages/start_exam.jsp"><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
                        <ul>                            
                            <li><a href="../../exam pages/start_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam</a></li>
                            <li><a href="../../exam pages/add_exam.jsp"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="../../exam pages/add_specification.jsp"><span class="fa fa-sort-alpha-desc"></span>Add Specification</a></li>                                                        
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Question Bank</span></a>
                        <ul>                            
                            <li><a href="../../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-align-justify"></span> Add / Update / Delete</a></li>
                            <li><a href="../../question bank pages/questionbank_display.jsp"><span class="fa fa-sort-alpha-desc"></span>View Question Bank</a></li>
                            <li><a href="../../question bank pages/questionbank_file_upload.jsp"><span class="fa fa-download"></span>File Upload</a></li> 
                            <li><a href="../../question bank pages/questionbank_list_upload.jsp"><span class="fa fa-download"></span>List Upload</a></li> 
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Result</span></a>
                        <ul>
                            <li><a href="#"><span class="fa fa-image"></span>View Result</a></li>
                            <li><a href="#"><span class="fa fa-download"></span>Export Result</a></li>                     
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>
                            <li><a href="#"><span class="fa fa-bar-chart-o"></span> <span class="xn-text"></span>Analysis/Stats</a></li>
                            <li><a href="#"><span class="fa fa-user"></span>Connections</a></li>
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
                    <!-- SEARCH
                    <li class="xn-search">
                        <form role="form">
                            <input type="text" name="search" placeholder="Search..."/>
                        </form>
                    </li>   
                     END SEARCH -->
                    <!-- SIGN OUT -->
                    <li class="xn-icon-button pull-right">
                        <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>                        
                    </li> 
                    <!-- END SIGN OUT -->


                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                   

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-horizontal">

                                <div class="panel panel-default">     

                                    <div class="panel-heading">
                                        <h3 class="panel-title"><strong>Student Details Updation</strong></h3> 
                                    </div>
                                    <div class="panel-body">

                                        <form action="" method="post">

                                            <%
                                                try {

                                                    s = sf.openSession();
                                                    String rl = request.getParameter("roll_no");
                                                    System.out.println(rl);
                                                    qr = s.createQuery("from bean.Student where roll_no='" + rl + "' ");

                                                    if (qr != null) {
                                                        List li = qr.list();
                                                        if (li != null) {
                                                            ListIterator lit = li.listIterator();
                                                            bean.Student ar = new bean.Student();

                                                            while (lit.hasNext()) {
                                                                ar = (bean.Student) lit.next();


                                            %>

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Student Name</label>
                                                <div class="col-md-6 col-xs-12"> 
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                        <input type="text" class="form-control" value="<%= ar.getStudent_name()%>" name="student_name"/>  
                                                    </div>
                                                    <span class="help-block">Update Student Name</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 col-xs-12 control-label">Roll No.</label>
                                                <div class="col-md-2"> 
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                        <input type="text" class="form-control" value="<%= ar.getRoll_no()%>" name="roll_no"/>
                                                    </div>
                                                    <span class="help-block">Update Student Roll No</span>
                                                </div>
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Branch</label>
                                                <div class="col-md-2">
                                                    <select class="form-control select" name="branch" selected="<%= ar.getBranch()%>">

                                                        <option value="IT" <% if ((ar.getBranch()).equals("IT")) {
                                                               out.println("selected");
                                                           } %>>IT</option>
                                                        <option value="CO" <% if ((ar.getBranch()).equals("CO")) {
                                                                out.println("selected");
                                                            } %>>CO</option>
                                                        <option value="CE" <% if ((ar.getBranch()).equals("CE")) {
                                                                out.println("selected");
                                                            } %>>Civil-I</option>
                                                        <option value="CS" <% if ((ar.getBranch()).equals("CS")) {
                                                                out.println("selected");
                                                            } %>>Civil-II</option>
                                                        <option value="EE" <% if ((ar.getBranch()).equals("EE")) {
                                                                out.println("selected");
                                                            } %>>Electrical-I</option>
                                                        <option value="ES" <% if ((ar.getBranch()).equals("ES")) {
                                                                out.println("selected");
                                                            } %>>Electrical-II</option>
                                                        <option value="ME" <% if ((ar.getBranch()).equals("ME")) {
                                                                out.println("selected");
                                                            } %>>Mechanical-I</option>
                                                        <option value="MS" <% if ((ar.getBranch()).equals("MS")) {
                                                                out.println("selected");
                                                            } %>>Mechanical-II</option>
                                                        <option value="DDGM" <% if ((ar.getBranch()).equals("DDGM")) {
                                                                out.println("selected");
                                                            } %>>DDGM</option>
                                                        <option value="PC" <% if ((ar.getBranch()).equals("PC")) {
                                                                out.println("selected");
                                                            } %>>Civil-PT</option>
                                                        <option value="PM" <% if ((ar.getBranch()).equals("PM")) {
                                                                out.println("selected");
                                                            } %>>Mechanical-PT</option>
                                                        <option value="ET" <% if ((ar.getBranch()).equals("ET")) {
                                                                out.println("selected");
                                                            } %>>E&TC</option>
                                                        <option value="AE" <% if ((ar.getBranch()).equals("AE")) {
                                                                out.println("selected");
                                                            }%>>AE</option>

                                                    </select>
                                                    <span class="help-block">Update Student Branch</span>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Year</label>
                                                <div class="col-md-2">
                                                    <select class="form-control select" name="year" selected="<%= ar.getYear()%>">
                                                        <option value="First" <% if ((ar.getYear()).equals("First")) {
                                                                out.println("selected");
                                                            } %> >First</option>
                                                        <option value="Second" <% if ((ar.getYear()).equals("Second")) {
                                                                out.println("selected");
                                                            } %> >Second</option>
                                                        <option value="Third" <% if ((ar.getYear()).equals("Third")) {
                                                                out.println("selected");
                                                            }%> >Third</option>
                                                    </select>
                                                    <span class="help-block">Update Student Year</span>
                                                </div>                                            
                                            </div>

                                            <div class="form-group">                                        
                                                <label class="col-md-3 col-xs-12 control-label">Date of Birth</label>
                                                <div class="col-md-2">
                                                    <div class="input-group date" data-provide="datepicker">
                                                        <input type="text" class="form-control" name="dob" value="<%= ar.getDob()%>">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span>                                                             </span>
                                                    </div>  
                                                    <span class="help-block">Update Date of Birth | Format:-(dd/mm/yyyy)</span>
                                                </div> 
                                            </div>

                                            <input type="hidden" class="form-control"  name="h_roll_no" value="<%= rl%>"/>

                                            <div class="panel-footer" class="col-xs-3">                                   
                                                <button class="btn btn-primary pull-right" name="update_btn" value="update_btn">Update Student Details</button>
                                            </div>

                                            <%                }

                                                        } else {
                                                            System.out.println("-----Data Not Found-----");
                                                            response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Data Not Found-----");
                                                        }
                                                    } else {
                                                        System.out.println("-----Query Is Blank-----");
                                                        response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Query Is Blank-----");
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                } finally {

                                                }
                                            %> 
                                        </form> 
                                        <%
                                            if (request.getParameter("update_btn") != null) {
                                                try {
                                                    System.out.println("------After using Beans-----");
                                                    //  bean.Student ar = new bean.Student();
                                                    String temp_roll_no = request.getParameter("h_roll_no");
                                                    Transaction tr = s.beginTransaction();

                                                    qr = s.createQuery("update bean.Student set student_name='" + request.getParameter("student_name") + "',roll_no='" + request.getParameter("roll_no") + "',year='" + request.getParameter("year") + "', dob='" + request.getParameter("dob") + "' , branch='" + request.getParameter("branch") + "'  where roll_no= '" + temp_roll_no + "' ");

                                                    int temp = qr.executeUpdate();
                                                    tr.commit();
                                                    System.out.println("-----Transaction Saved-----");
                                                    if (temp > 0) {
                                                        response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=------Update Successfull------");
                                                        System.out.println("-----Redirected-----");
                                                    }
                                                } catch (Exception e) {
                                                    System.out.println("-----Error Occurred-----");
                                                    e.printStackTrace();
                                                } finally {
                                                    s.flush();
                                                    s.close();
                                                }

                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
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
                        <p>Press No if you want to continue work. Press Yes to logout current user.</p>
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
        <audio id="audio-alert" src="../../audio/alert.mp3" preload="auto"></audio>
        <audio id="audio-fail" src="../../audio/fail.mp3" preload="auto"></audio>
        <!-- END PRELOADS -->             

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../../js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="../../js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap.min.js"></script>                
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='../../js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="../../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- END THIS PAGE PLUGINS -->       

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../../js/settings.js"></script>
        <script type="text/javascript" src="../../js/plugins.js"></script>        
        <script type="text/javascript" src="../../js/actions.js"></script>        
        <!-- END TEMPLATE -->

        <!-- END SCRIPTS -->                   
    </body>
</html>








