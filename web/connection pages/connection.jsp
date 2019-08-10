<%-- 
    Document   : connection
    Created on : 15 Jun, 2017, 3:36:04 AM
    Author     : Vinayak Sharma
--%>

<%@page import="java.util.Collections"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Helping_Classes.getStatus"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.JDOMException"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
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

                    <li class="xn-openable">
                        <a href="../student pages/student_add_update_delete.jsp"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li><a href="../student pages/student_add_update_delete.jsp"><span class="fa fa-table"></span>Add / Update / Delete </a></li>
                            <li><a href="../student pages/student_display.jsp"><span class="fa fa-arrow-right"></span>View Student</a></li>
                            <li><a href="../student pages/student_file_upload.jsp"><span class="fa fa-arrow-right"></span>File Upload</a></li>
                            <li><a href="../student pages/student_list_upload.jsp"><span class="fa fa-arrow-right"></span>List Upload</a></li>
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

                    <li class="xn-openable active">
                        <a href="connection.jsp"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>
                            <li><a href="connection.jsp"><span class="fa fa-user"></span>Connections</a></li>
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
                                    <h3 class="panel-title">Connections</h3>
                                </div>
                                <div class="panel-body">

                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Roll No</th>
                                                <th>IP</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                response.setIntHeader("Refresh", 5);
                                                // reading can be done using any of the two 'DOM' or 'SAX' parser
                                                // we have used saxBuilder object here
                                                // please note that this saxBuilder is not internal sax from jdk
                                                SAXBuilder saxBuilder = new SAXBuilder();

                                                // obtain file object 
                                                File file;

                                                try {
                                                    Context env = (Context) new InitialContext().lookup("java:comp/env");
                                                    String path = (String) env.lookup("root_dir");
                                                    file = new File(path + "Connection.xml");
                                                    // converted file to document object
                                                    Document document = saxBuilder.build(file);

                                                    // get root node from xml
                                                    Element rootNode = document.getRootElement();

                                                    // got all xml elements into a list
                                                    List<Element> studentList = rootNode.getChildren("Student");
                                                    // simple iteration to see the result on console
                                                    // out.println("<table border=\"0.9\"><tr><td>Roll No</td><td>IP</td><td>Status</td> </tr>");
                                                    for (int i = 0; i <= studentList.size() - 1; i++) {
                                                        Element element = studentList.get(i);
                                                        getStatus g = new getStatus();
                                                        String status = g.status(element.getAttributeValue("rollno"));
                                            %>

                                            <tr>
                                                <td><%=element.getAttributeValue("rollno")%></td>
                                                <td><%=element.getChildText("ip")%></td>
                                                <td><%= status%></td>
                                                <td><a href="../controller/exam/terminate.jsp?roll=<%=element.getAttributeValue("rollno")%>">Terminate</a></td>
                                            </tr>
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

                                        </tbody>
                                    </table>
                                    <div class="panel-footer" class="col-xs-3">                                   
                                        <button class="btn-lg btn-primary pull-right" onclick="window.location.href = '../exam pages/end_exam.jsp'">End Exam</button>                                                
                                    </div> 
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
        <script type="text/javascript" src="../js/settings.js"></script>
        <script type="text/javascript" src="../js/plugins.js"></script>        
        <script type="text/javascript" src="../js/actions.js"></script>        
        <!-- END TEMPLATE -->

        <!-- END SCRIPTS -->                   
    </body>
</html>







