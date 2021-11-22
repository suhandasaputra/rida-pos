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

            th {
                background-color: #CCC;
            }
            td:hover{
                cursor: pointer;
            }
/*            #table_supplier {
                width: 100%;
                font-size: 12px;
            }*/

            .edit_btn {
                height: 20px;
                width: 50px;
                background-color: #29b19c;
                border-radius: 5px;
                text-align: center;
                color: white;
                padding-bottom: 25px;
                cursor: pointer;
            }
            .card-body{min-height: 705px}
            
            @media only screen and (max-width: 400px) {
                .card-body{min-height: 620px}
                /*#table_supplier {font-size: 12px; width: 100%}*/
                thead{font-size: 12px}
            }
        </style>
        <script>
            jQuery(document).ready(function ($) {
                var userlevel = window.localStorage.getItem('userlevel');
            if (userlevel === 'administrator') {
                window.location.href = "ho";
            }
                var datjson = new Object();
                datjson.brand_id = brand_id;
                var table = $('#table_supplier').DataTable({
                    "scrollX": true,
                    "ajax": {
                        "url": "/ridapos_dashboard/supi?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [
                        {data: "supplier_id",
                            "className": 'supplier supplier_id'},
                        {data: "supplier_name",
                            "className": 'supplier supplier_name'},
                        {data: "supplier_address",
                            "className": 'supplier supplier_address'},
                        {data: "supplier_phone",
                            "className": 'supplier supplier_phone'},
                        {data: "supplier_mail",
                            "className": 'supplier supplier_mail'},
                        {data: "supplier_totaltrx",
                            "className": 'supplier supplier_totaltrx',
                            render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            }},
                        {data: "supplier_totalamounttrx",
                            "className": 'supplier supplier_totalamount',
                        render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            }}
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
                                            title: "list supplier",
                                            exportOptions: {columns: ':visible:not()'}, //last column has the action types detail/edit/delete
                                            footer: true
                                        },
                                        {
                                            extend: "csvHtml5",
                                            title: "list supplier",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "excelHtml5",
                                            title: "summary supplier",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "pdfHtml5",
                                            title: "list supplier",
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
                                                        Supplier
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="supplier" class="tab-pane fade in active show">
                                                        <div class="container" id="ref_tabel_supplier">    
                                                            <label id="add_supplier" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create Supplier</label>
                                                        </div>
                                                        <table class="table" id="table_supplier" style="width: 100%; font-size: 12px;">
                                                            <thead>  
                                                                <tr>
                                                                    <th>Supplier ID</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Address</th>
                                                                    <th>Phone</th>
                                                                    <th>Mail</th>
                                                                    <th>Total Trx</th>
                                                                    <th>Total Amount</th>
                                                                </tr>
                                                            </thead>  
                                                        </table>
                                                        <%@include file='pop_up_add_supplier.jsp'%>
                                                        <%@include file='pop_up_edit_supplier.jsp'%>
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
