<%-- 
    Document   : report
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
            .card {
                background-color: white;
            }

            th {
                background-color: #CCC;
            }
            td:hover{
                cursor: pointer;
            }
            #table_user {
                font-size: 12px;
            }
            .card-body{
                min-height: 705px;
            }
            #add_user{
                cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400;
            }
            .tab-content{
                width: 100%
            }
            @media only screen and (max-width: 400px) {
                body{
                    zoom: 80%;
                }
                .card {
                    background-color: white;
                }

                th {
                    background-color: #CCC;
                }
                td:hover{
                    cursor: pointer;
                }

                .card-body{
                    min-height: 620px;
                }
                #add_user{
                    cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400;
                }
                .tab-content{
                    width: 100%
                }
                table{
                    margin: 0 auto;
                    width: 100%;
                    clear: both;
                    border-collapse: collapse;
                    table-layout: fixed;
                    word-wrap:break-word;
                }
                #table_user {
                    font-size: 12px;
                }
            }

        </style>
        <script>
            jQuery(document).ready(function ($) {
                var userlevel = window.localStorage.getItem('userlevel');
                if (userlevel === 'administrator') {
                    window.location.href = "ho";
                }
//                var brand_id = window.localStorage.getItem('brand_id');
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = window.localStorage.getItem('outlet_store_id');
                datjson.userlevel = userlevel;
                var table = $('#table_user').DataTable({
                    "ajax": {
                        "url": "/ridapos_dashboard/usri?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [
                        {data: "outlet_id",
                            "className": 'employee outlet_id'},
                        {data: "outlet_name",
                            "className": 'employee outlet_name'},
                        {data: "user_name",
                            "className": 'employee user_name'},
                        {data: "user_id",
                            "className": 'employee user_id'},
                        {data: "phonenumber",
                            "className": 'employee phonenumber'},
                        {data: "userlevel",
                            "className": 'employee userlevel'}
                    ],
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'collection',
                            text: 'Export',
                            autoClose: true,
                            buttons:
                                    [
                                        {
                                            extend: "copyHtml5",
                                            title: "list user",
                                            exportOptions: {columns: ':visible:not()'}, //last column has the action types detail/edit/delete
                                            footer: true
                                        },
                                        {
                                            extend: "csvHtml5",
                                            title: "list user",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "excelHtml5",
                                            title: "list user",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true

                                        },
                                        {
                                            extend: "pdfHtml5",
                                            title: "list user",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "print",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        }
                                    ]
                        }
                    ]
                });
            });
        </script>

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
                                                        User
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <div class="tab-content">
                                                    <div id="user" class="tab-pane fade in active show">
                                                        <div class="container" id="ref_tabel_item">    
                                                            <label id="add_user"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create Employee</label>
                                                        </div>
                                                        <br>
                                                        <table class="table" id="table_user">
                                                            <thead>  
                                                                <tr>
                                                                    <th>Outlet ID</th>
                                                                    <th>Outlet Name</th>
                                                                    <th>Username</th>
                                                                    <th>Email</th>
                                                                    <th>Phone</th>
                                                                    <th>Role</th>
                                                                    <!--<th>Status</th>-->
                                                                </tr>
                                                            </thead>  
                                                        </table>
                                                        <%@include file='pop_up_add_user.jsp'%>
                                                        <%@include file='pop_up_edit_user.jsp'%>
                                                    </div>
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
