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

        <style>
        a {
    color: white;
   
    text-decoration: none;
}
        </style>                
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
                        <a href="index.html"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></a>                        
                    </li>                    
                  
                                        
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li>
                        
                    
                                    <a href="AddStudent.html"><span class="fa fa-table"></span> ADD/ UPDATE/ DELETE Student</a></li>
        
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
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
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
                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                    
                
                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Student</a></li>
                    <li class="active">View Student</li>
                </ul>
                <!-- END BREADCRUMB -->
                
                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span>View Student</h2>
                </div>
                <!-- END PAGE TITLE -->                
                
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-6">

                            <!-- START VALIDATIONENGINE PLUGIN -->
                            <div class="block">
                                <h4>1) Set Student Details </h4>                                
                                <form id="validate" role="form" class="form-horizontal" action="form-wizards2.html">                            
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Course Name:</label>
                                        <div class="col-md-9">
                                            <input type="text" class="validate[required] form-control"/>
                                            <span class="help-block">Required</span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Course Code:</label>
                                        <div class="col-md-9    ">
                                            <input type="text" class="validate[required,custom[integer],min[6],max[6]] form-control"/>
                                            <span class="help-block">Required, integer, min value = 6, max = 6</span>
                                        </div>                        
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Branch:</label>
                                        <div class="col-md-3">
                                            <select class="validate[required] select" id="formGender">
                                                <option value="">IF</option>
                                                <option value="">CM</option>
                                                <option value="">CE</option>
                                                <option value="">EL</option>
                                                <option value="">EE</option>
                                                <option value="">ME</option>
                                                <option value="">IDD</option>
                                                <option value="">DDGM</option>
                                            </select>                           
                                            <span class="help-block">Required</span>
                                        </div>                        
                                    </div>
                                   <div class="form-group">
                                        <label class="col-md-3 control-label">Year:</label>
                                        <div class="col-md-3">
                                            <select class="validate[required] select" id="formGender">
                                                <option value="2">First</option>
                                                <option value="1">Second</option>
                                                <option value="0">Third</option>
                                            </select>                           
                                            <span class="help-block">Required</span>
                                        </div>                        
                                    </div>
                                       
                                   
                                    <div class="btn-group pull-right">
                                        <input type="submit" class="btn btn-success" onclick="javascript:alert('Form #validate submited');"><&nbsp&nbsp&nbsp&nbsp<br><br>
                                        <button class="btn btn-info" type="button" onClick="">Reset</button>   
                                    </div>                                                                
                                </form>
                            </div>                                               
                            <!-- END VALIDATIONENGINE PLUGIN -->

                        </div>
                            <!-- END JQUERY VALIDATION PLUGIN -->
                            </div>
                        </div>
                    </div>

                            <!-- END MASKED INPUT PLUGIN -->

                        </div>
                    </div>
                        
                </div>
                <!-- END PAGE CONTENT WRAPPER -->                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
        
        <!-- MESSAGE BOX-->
       
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
        
        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        
        <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-datepicker.js'></script>        
        <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-select.js'></script>        

        <script type='text/javascript' src='js/plugins/validationengine/languages/jquery.validationEngine-en.js'></script>
        <script type='text/javascript' src='js/plugins/validationengine/jquery.validationEngine.js'></script>        

        <script type='text/javascript' src='js/plugins/jquery-validation/jquery.validate.js'></script>                

        <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput.min.js'></script>
        <!-- END THIS PAGE PLUGINS -->               

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="js/settings.js"></script>
        
        <script type="text/javascript" src="js/plugins.js"></script>
        <script type="text/javascript" src="js/actions.js"></script>
        <!-- END TEMPLATE -->
        
       <!-- <script type="text/javascript">
            var jvalidate = $("#jvalidate").validate({
                ignore: [],
                rules: {                                            
                        login: {
                                required: true,
                                minlength: 2,
                                maxlength: 8
                        },
                        password: {
                                required: true,
                                minlength: 5,
                                maxlength: 10
                        },
                        're-password': {
                                required: true,
                                minlength: 5,
                                maxlength: 10,
                                equalTo: "#password2"
                        },
                        age: {
                                required: true,
                                min: 18,
                                max: 100
                        },
                        email: {
                                required: true,
                                email: true
                        },
                        date: {
                                required: true,
                                date: true
                        },
                        credit: {
                                required: true,
                                creditcard: true
                        },
                        site: {
                                required: true,
                                url: true
                        }
                    }                                        
                });                                    

        </script>!-->
        
    <!-- END SCRIPTS -->          
        
    </body>
</html>






