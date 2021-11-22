<%-- 
    Document   : product
    Created on : Feb 24, 2020, 4:38:43 PM
    Author     : suhanda
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@include file='defaultextend.jsp'%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>RIDAPOS</title>
        <style>
            body{
               zoom: 80%;
            }
            .topnav {
                background-color: #CCC; 
                overflow: hidden;
            }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 5px 20px 5px 20px;
                text-decoration: none;
                font-size: 17px;
                border-left: 1px solid #ddd;
                border-bottom: 1px solid #000;

            }

            .topnav a:hover {
                background-color: white;
                color: #29B19C;
                border-bottom: 1px solid #29B19C;
            }

            .topnav a.active {
                background-color: #29B19C;
                color: white;
                border-bottom: 1px solid black;
            }
            .card {
                background-color: white;
            }
            
            
            

            #account_body {
                /*background-color: blue;*/
                height: 300px;
                display: flex;
                color: #29B19C;
            }

            #account_right {
                margin: 10px;
                height: 280px;
                width: 600px;
            }
            #account_biodata {
                margin-top: 10px;
                height: 120px;
                width: 600px;
            }

        </style>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <%@include file='header.jsp'%>
            <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@include file='sidebar_left.jsp'%>
            <!--end sidebar-->
            <div class="content-wrapper">
                <div class="content-header">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                        Transaction
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <ul class="nav nav-tabs topnav" id="myTab">
                                                    <li><a data-toggle="tab" href="#profile" class="active">Void</a></li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <div id="account_body" class="tab-content" style="width: 100%">
                                                    <div id="account_right">
                                                        <div id="account_biodata">
                                                            Biodata<br>
                                                            <label style="color: #CCC; font-size: 16px; font-weight: 500">Full Name</label>   <input type="text" id="full_name" readonly="" style="position: relative; left: 10px; height: 20px; width: 300px; border: 0;"><label id="add_account_biodata" style="float: right; right: 170px; position: relative; cursor: pointer;">Edit</label>
                                                        </div>
                                                    </div>
                                                    <%@include file='pop_up_edit_biodata.jsp'%>
                                                </div>    
                                            </div>
                                            <!-- /.row -->
                                        </div>
                                        <!-- ./card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </section>
                </div>
            </div>
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- Main Footer -->
            <%@include file='footer.jsp'%>
        </div>
    </body>
</html>
