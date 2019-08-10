<%-- 
    Document   : specification
    Created on : Mar 16, 2017, 9:54:10 PM
    Author     : Vinayak Sharma
--%>

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

        <link rel="stylesheet" type="text/css" id="theme" href="../css/theme-default.css"/>

        <link rel="stylesheet" type="text/css" id="theme" href="../css/bootstrap/bootstrap.min.css"/>
        <script type="text/javascript" src="../js/jquery/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery/jquery.min.js"></script>

        <style type="text/css">
            .entry:not(:first-of-type)
            {
                margin-top: 10px;
            }

            .glyphicon
            {
                font-size: 12px;
            }

            td {
                padding:5px;
            }

            body {
                padding:10px;   
            }

            th {
                text-align: center;
            }

            .container{
                margin-top:20px;
            }
            .image-preview-input {
                position: relative;
                overflow: hidden;
                margin: 0px;    
                color: #333;
                background-color: #fff;
                border-color: #ccc;    
            }
            .image-preview-input input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
            .image-preview-input-title {
                margin-left:2px;
            }  
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                //Disable the Remove Button
                var rowCount = $('table >tbody:last >tr').length;
                if (rowCount == 1) {
                    document.getElementsByClassName('btn-remove')[0].disabled = true;
                }

                $(document).on('click', '.btn-add', function (e) {
                    e.preventDefault();

                    var controlForm = $('table');
                    var currentEntry = $('table>tbody>tr:last');
                    var newEntry = $(currentEntry.clone()).appendTo(controlForm);
                    newEntry.find('input').val('');                                         //Remove the Data - as it is cloned from the above

                    //Add the button  
                    var rowCount = $('table >tbody:last >tr').length;
                    if (rowCount > 1) {
                        var removeButtons = document.getElementsByClassName('btn-remove');
                        for (var i = 0; i < removeButtons.length; i++) {
                            removeButtons.item(i).disabled = false;
                        }
                    }

                }).on('click', '.btn-remove', function (e) {
                    $(this).parents('tr:first').remove();

                    //Disable the Remove Button
                    var rowCount = $('table >tbody:last >tr').length;
                    if (rowCount == 1) {
                        document.getElementsByClassName('btn-remove')[0].disabled = true;
                    }

                    e.preventDefault();
                    return false;
                });

                // -- Start File Upload -- //
                $(document).on('click', '#close-preview', function () {
                    $('.image-preview').popover('hide');
                    // Hover befor close the preview
                    $('.image-preview').hover(
                            function () {
                                $('.image-preview').popover('show');
                            },
                            function () {
                                $('.image-preview').popover('hide');
                            }
                    );
                });

                // Create the close button
                var closebtn = $('<button/>', {
                    type: "button",
                    text: 'x',
                    id: 'close-preview',
                    style: 'font-size: initial;',
                });
                closebtn.attr("class", "close pull-right");
                // Set the popover default content
                $('.image-preview').popover({
                    trigger: 'manual',
                    html: true,
                    title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
                    content: "There's no image",
                    placement: 'bottom'
                });
                // Clear event
                $('.image-preview-clear').click(function () {
                    $('.image-preview').attr("data-content", "").popover('hide');
                    $('.image-preview-filename').val("");
                    $('.image-preview-clear').hide();
                    $('.image-preview-input input:file').val("");
                    $(".image-preview-input-title").text("Browse");
                });
                // Create the preview image
                $(".image-preview-input input:file").change(function () {
                    var img = $('<img/>', {
                        id: 'dynamic',
                        width: 250,
                        height: 200
                    });
                    var file = this.files[0];
                    var reader = new FileReader();
                    // Set preview image into the popover data-content
                    reader.onload = function (e) {
                        $(".image-preview-input-title").text("Change");
                        $(".image-preview-clear").show();
                        $(".image-preview-filename").val(file.name);
                        img.attr('src', e.target.result);
                        $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
                    }
                    reader.readAsDataURL(file);
                });
                // -- END File Upload -- //
            });

            function WO() {
                var tbody = document.getElementById("plateVolumes");

                for (var i = 0; i < tbody.rows.length; i++) {
                    var row = tbody.rows[i];
                    var mk1 = row.cells[5].childNodes[0].value;
                    var mk2 = row.cells[6].childNodes[0].value;
                    var mk4 = row.cells[7].childNodes[0].value;
                    var mk8 = row.cells[8].childNodes[0].value;
                    var answer = (Number(mk1) * 1 + Number(mk2) * 2 + Number(mk4) * 4 + Number(mk8) * 8).toFixed(0);
                    row.cells[9].childNodes[0].value = answer;
                }
            }
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

                    <li class="xn-openable">
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
                    <li class="active">
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
                    <!-- MESSAGES -->

                    <!-- END MESSAGES -->
                    <!-- TASKS -->

                    <!-- END TASKS -->
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>                    
                    <li><a href="#">Set/Schedule Exam </a></li>
                    <li class="active">Specification table.</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span>Specification Table</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                

                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
                                <!-- image-preview-filename input [CUT FROM HERE]-->
                                <!-- /input-group image-preview [TO HERE]--> 
                            </div>
                        </div>
                    </div>
                    <form action="../controller/exam/AddSpecification.jsp" method="post">
                        <table>
                            <thead>
                                <tr>
                                    <th><label>Enter Id</label></th>
                                    <th><label>Specification Name</label></th>
                                    <th><label>Select Course Code</label></th>
                                    <th><label>Select Branch</label></th>
                                    <th><label>Unit No</label></th>
                                    <th><label>1 Marks</label></th>
                                    <th><label>2 Marks</label></th>
                                    <th><label>4 Marks</label></th>
                                    <th><label>8 Marks</label></th>
                                    <th><label>Total</label></th>
                                    <th></th>
                                </tr>
                            </thead>

                            <tbody id="plateVolumes">
                                <tr>
                                    <td><input class="form-control" name="spec_id" type="text" placeholder="Enter Id" /></td>
                                    <td><input class="form-control" name="spec_name" type="text" placeholder="Specification Name" /></td>
                                    <td><input class="form-control" name="c_code" type="text" placeholder="Course Code" /></td>
                                    <td><input class="form-control" name="branch" type="text" placeholder="Branch" /></td>
                                    <td><input class="form-control" name="unit_no" type="number" placeholder="Unit No" /></td>
                                    <td><input class="form-control" name="mk1" type="text" placeholder="1 Marks" /></td>
                                    <td><input class="form-control" name="mk2" type="text" placeholder="2 Marks" /></td>
                                    <td><input class="form-control" name="mk4" type="text" placeholder="4 Marks" /></td>
                                    <td><input class="form-control" name="mk8" type="text" placeholder="8 Marks" onChange="WO()"/></td>
                                    <td><input class="form-control" name="total" type="text" placeholder="Total" /></td>
                                    <td><input type="submit" value="+" id="chk" name="chk" class=" form-control  btn btn-info"/></td>
                                    <td>
                                        <button class="btn btn-danger btn-remove" type="button">
                                            <i class="glyphicon glyphicon-minus gs"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>

                        </table>

                        <button class="btn btn-success btn-add" type="button">
                            <i class="glyphicon glyphicon-plus gs"></i> 
                            <b> Add</b>
                        </button>

                        <div class="col-md-6">
                            <button class="btn btn-info btn-block" value="" name="sub">upload exm</button>
                        </div>
                    </form>
                </div>
            </div>


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

            <script type="text/javascript" src="../js/plugins/datatables/jquery.dataTables.min.js"></script>    
            <!-- END PAGE PLUGINS -->

            <!-- START TEMPLATE -->
            <script type="text/javascript" src="../js/settings.js"></script>

            <script type="text/javascript" src="../js/plugins.js"></script>        
            <script type="text/javascript" src="../js/actions.js"></script>        
            <!-- END TEMPLATE -->
            <!-- END SCRIPTS --> 
        </div>
    </body>
</html>






