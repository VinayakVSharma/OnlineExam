<%-- 
    Document   : student_display
    Created on : Feb 20, 2017, 7:40:06 PM
    Author     : Vinayak Sharma
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Exam Admin</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    

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
                                <img src="../img/profile-photo.jpg" alt="Pravin Mali"/>
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
                        <a href="../Dashboard.html"><span class="fa fa-desktop"></span>Dashboard</span></a>                        
                    </li>                

                    <li class="xn-openable active">
                        <a href="student_add_update_delete.jsp"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li><a href="student_add_update_delete.jsp"><span class="fa fa-table"></span>Add / Update / Delete </a></li>
                            <li class="active"><a href="student_display.jsp"><span class="fa fa-arrow-right"></span>View Student</a></li>
                            <li><a href="student_file_upload.jsp"><span class="fa fa-arrow-right"></span>File Upload</a></li>
                            <li><a href="student_list_upload.jsp"><span class="fa fa-arrow-right"></span>List Upload</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../subject pages/subject_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Subject</span></a>
                        <ul>                            
                            <li><a href="../subject pages/subject_add_update_delete.jsp"><span class="fa fa-align-justify"></span>Add / Update / Delete</a></li>
                            <li><a href="../subject pages/subject_display.jsp"><span class="fa fa-sort-alpha-desc"></span> View Subjects</a></li>

                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../exam pages/start_exam.jsp"><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
                        <ul>                            
                            <li><a href="../exam pages/start_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam</a></li>
                            <li><a href="../exam pages/end_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>End Exam</a></li>
                            <li><a href="../exam pages/add_exam.jsp"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="../exam pages/add_specification.jsp"><span class="fa fa-sort-alpha-desc"></span>Add Specification</a></li>                                                        
                            <li><a href="../exam pages/start_exam_single_student.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam Single Student</a></li>                                                        

                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Question Bank</span></a>
                        <ul>                            
                            <li><a href="../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-align-justify"></span> Add / Update / Delete</a></li>
                            <li><a href="../question bank pages/questionbank_display.jsp"><span class="fa fa-sort-alpha-desc"></span>View Question Bank</a></li>
                            <li><a href="../question bank pages/questionbank_file_upload.jsp"><span class="fa fa-download"></span>File Upload</a></li> 
                            <li><a href="../question bank pages/questionbank_list_upload.jsp"><span class="fa fa-download"></span>List Upload</a></li> 
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../result pages/result_view.jsp"><span class="fa fa-files-o"></span> <span class="xn-text">Result</span></a>
                        <ul>
                            <li><a href="../result pages/result_view.jsp"><span class="fa fa-image"></span>View Result</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../connection pages/connection.jsp"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>
                            <li><a href="#"><span class="fa fa-bar-chart-o"></span> <span class="xn-text"></span>Analysis/Stats</a></li>
                            <li><a href="../connection pages/connection.jsp"><span class="fa fa-user"></span>Connections</a></li>
                        </ul>
                    </li>          

                    <li class="xn-openable">
                        <a href="../admin pages/admin_update_picture.jsp"><span class="fa fa-cogs"></span> <span class="xn-text">Admin Settings</span></a>                        
                        <ul>
                            <li><a href="../admin pages/admin_update_picture.jsp"><span class="fa fa-user"></span>Admin Profile Picture</a></li>
                            <li><a href="../admin pages/admin_display.jsp"><span class="fa fa-user"></span>View Admins</a></li>
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

                            <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Students Details</h3>
                                </div>
                                <div class="panel-body">                                   
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Student Name</th>
                                                <th>Roll No</th>
                                                <th>Year</th>
                                                <th>Branch</th>
                                                <th>Dob</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {

                                                    s = sf.openSession();
                                                    Transaction tr = s.beginTransaction();
                                                    tr.commit();
                                                    qr = s.createQuery("from bean.Student");
                                                    boolean bool = false;
                                                    if (qr != null) {
                                                        List li = qr.list();
                                                        if (li != null) {
                                                            ListIterator lit = li.listIterator();
                                                            bean.Student ar = new bean.Student();
                                                            while (lit.hasNext()) {
                                                                ar = (bean.Student) lit.next();
                                                                /*
                                System.out.println("Student name"+ar.getStudent_name());
                                System.out.println("Roll No"+ar.getRoll_no());
                                System.out.println("Branch"+ar.getBranch());
                                System.out.println("Year"+ar.getYear());
                                System.out.println("Dob"+ar.getDob()); */
                                            %>

                                            <tr>
                                                <td><%=ar.getStudent_name()%></td>
                                                <td><%=ar.getRoll_no()%></td>
                                                <td><%=ar.getYear()%></td>
                                                <td><%=ar.getBranch()%></td>
                                                <td><%=ar.getDob()%></td>
                                                <td>
                                                    <button class="btn btn-default btn-rounded btn-sm" onclick="window.location.href = '../controller/student/student_update.jsp?roll_no=<%= ar.getRoll_no()%>'"><span class="fa fa-pencil"></span></button>
                                                    <button class="btn btn-danger btn-rounded btn-sm" onclick="window.location.href = '../controller/student/student_delete.jsp?roll_no=<%= ar.getRoll_no()%>'"><span class="fa fa-times"></span></button>
                                                </td>
                                            </tr>
                                            <%
                                                            }
                                                        } else {
                                                            System.out.println("-----Data Not Found-----");
                                                            response.sendRedirect("student_display.jsp?result=-----Data Not Found-----");
                                                        }
                                                    } else {
                                                        System.out.println("-----Query Is Blank-----");
                                                        response.sendRedirect("student_display.jsp?result=-----Query Is Blank-----");
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                } finally {
                                                    s.flush();
                                                    s.close();
                                                }
                                            %>                                      

                                        </tbody>
                                    </table>                                
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

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
                            <a href="../admin pages/admin_login.jsp" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->            

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap.min.js"></script>                
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='../js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="../js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- END THIS PAGE PLUGINS -->       

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>        
        <!-- END TEMPLATE -->

        <!-- END SCRIPTS -->                   
    </body>
</html>







