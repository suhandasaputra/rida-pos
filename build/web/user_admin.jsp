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
            #table_merchant {
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
                #table_merchant {
                    font-size: 12px;
                }
            }

        </style>
        <script>
            jQuery(document).ready(function ($) {
                var userlevel = window.localStorage.getItem('userlevel');
                if (userlevel !== 'administrator') {
                    window.location.href = "ho";
                }
                var table = $('#table_merchant').DataTable({
                    "ajax": {
                        "url": "/ridapos_dashboard/adm_merc",
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [
                        {data: "brand_id"},
                        {data: "brand_name"},
                        {data: "business_id"},
                        {data: "brand_level"},
                        {data: "createdate"},
                        {data: "tax_rate"}
                        
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
                                            title: "list merchant",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "csvHtml5",
                                            title: "list merchant",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "excelHtml5",
                                            title: "list merchant",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true

                                        },
                                        {
                                            extend: "pdfHtml5",
                                            title: "list merchant",
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
            <%@include file='header_admin.jsp'%>
            <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@include file='sidebar_left_admin.jsp'%>
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
                                                        Brand
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <div class="tab-content">
                                                    <div id="user" class="tab-pane fade in active show">
                                                        <br>
                                                        <table class="table" id="table_merchant">
                                                            <thead>  
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Name</th>
                                                                    <th>Type</th>
                                                                    <th>Level</th>
                                                                    <th>Create Date</th>
                                                                    <th>Tax</th>
                                                                </tr>
                                                            </thead>  
                                                        </table>
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
