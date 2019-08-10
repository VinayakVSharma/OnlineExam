<%-- 
    Document   : result_single_xml
    Created on : 27 Jun, 2017, 2:55:48 PM
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
        <title>Exam Admin</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    


        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
        <script type="text/javascript" src="../../MathJax-2.7.0/MathJax.js"></script>
    </head>
    <body>
        <%!            GetQue g = new GetQue();
            End e = new End();
            List<Element> q = null;
            public int stdList;
        %>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">

                    <li class="xn-logo">
                        <a href="../../Dashboard.html">Exam Admin</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>

                    <li class="xn-profile">                            
                        <div class="profile">
                            <div class="profile-image">
                                <img src="../../img/profile-photo.jpg" alt="Pravin Mali"/>
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

                    <li class="xn-openable">
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
                            <li><a href="../../exam pages/end_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>End Exam</a></li>
                            <li><a href="../../exam pages/add_exam.jsp"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="../../exam pages/add_specification.jsp"><span class="fa fa-sort-alpha-desc"></span>Add Specification</a></li>                                                        
                            <li><a href="../../exam pages/start_exam_single_student.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam Single Student</a></li>                                                                                
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
                        <a href="../../result pages/result_view.jsp"><span class="fa fa-files-o"></span> <span class="xn-text">Result</span></a>
                        <ul>
                            <li><a href="../../result pages/result_view.jsp"><span class="fa fa-image"></span>View Result</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../connection pages/connection.jsp"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>
                            <li><a href="../../connection pages/connection.jsp"><span class="fa fa-user"></span>Connections</a></li>
                        </ul>
                    </li>          

                    <li class="xn-openable">
                        <a href="../../admin pages/admin_update_picture.jsp"><span class="fa fa-cogs"></span> <span class="xn-text">Admin Settings</span></a>                        
                        <ul>
                            <li><a href="../../admin pages/admin_update_picture.jsp"><span class="fa fa-user"></span>Admin Profile Picture</a></li>
                            <li><a href="../../admin pages/admin_display.jsp"><span class="fa fa-user"></span>View Admins</a></li>
                        </ul>
                    </li>

                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->

            <!-- PAGE CONTENT -->
            <div class="page-content">                 
                <div class="page-title">                    
                    <h1><center><strong>Result & Analysis</strong></center></h1>
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
                                                            <img src="../../resources/student images/<%=request.getParameter("rl_no")%>.jpg" />     
                                                        </div>
                                                    </a>                                        
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="gallery">
                                                    <a class="gallery-item pull-right">
                                                        <div class="image">                              
                                                            <img src= "../../resources/student sign/<%=request.getParameter("rl_no")%>.jpg" />     
                                                        </div>
                                                    </a>                                        
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <%
                                            try {
                                                SAXBuilder saxBuilder = new SAXBuilder();
                                                Context env = (Context) new InitialContext().lookup("java:comp/env");
                                                String path = (String) env.lookup("root_dir");
                                                File file = new File(path + request.getParameter("rl_no") + ".xml");
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
                    <%
                        int cnt = 0, a = 0, c = 0, na = 0, wa = 0;

                        SAXBuilder saxBuilder = new SAXBuilder();
                        session = request.getSession();
                        Context env = (Context) new InitialContext().lookup("java:comp/env");
                        String path = (String) env.lookup("root_dir");

                        // obtain file object 
                        File file = new File(path + request.getParameter("rl_no") + ".xml");

                        try {
                            // converted file to document object
                            Document document = saxBuilder.build(file);

                            // get root node from xml
                            Element rootNode = document.getRootElement();

                            // got all xml elements into a list
                            List<Element> studentList = rootNode.getChildren("Question");
                            stdList = studentList.size();
                            for (int i = 0; i <= studentList.size() - 1; i++) {
                                Element element = studentList.get(i);
                                if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) {
                                    cnt = cnt + Integer.parseInt(element.getChildText("marks"));
                                    a++;
                                } else {
                                    wa++;
                                    a++;
                                }
                                if (element.getChildText("user_c_ans").equals("null")) {
                                    na++;
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
                                                <table class="table table-striped table-bordered">
                                                    <tr>
                                                        <td><h3>Total Questions</h3></td>
                                                        <td><h3><%=stdList%></h3></td>
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
                                    <div class="col-md-2"></div>
                                    <div class="col-md-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <table class="table table-striped table-bordered">
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
                                    <div class="col-md-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <table class="table table-striped table-bordered">
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
                    <!-- END BASIC TABLE SAMPLE -->

                    <div class="row">

                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <table class="table table-striped table-bordered">
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
                                                           
                                                            XMLOutputter xmlOutput = new XMLOutputter();

                                                            xmlOutput.setFormat(Format.getPrettyFormat().setEncoding("ISO-8859-1"));
                                                            FileWriter fw = new FileWriter(path + request.getParameter("rl_no") + ".xml");
                                                            xmlOutput.output(document, fw);
                                                            fw.close();
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
                            <a href="../../admin pages/admin_login.jsp" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->             

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
        <script type="text/javascript" src="../../js/plugins.js"></script>        
        <script type="text/javascript" src="../../js/actions.js"></script>        
        <!-- END TEMPLATE -->

        <!-- END SCRIPTS -->                   
    </body>
</html>







