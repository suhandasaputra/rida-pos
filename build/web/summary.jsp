<%-- 
    Document   : summary
    Created on : 29-Dec-2020, 11:11:29
    Author     : matajari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            .card-body{min-height: 705px}
            
            @media only screen and (max-width: 400px) {
                .card-body{min-height: 620px}
            }
        </style>
        <script>
            $(document).ready(function () {
                var userlevel = window.localStorage.getItem('userlevel');
            if (userlevel === 'administrator') {
                window.location.href = "ho";
            }
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = window.localStorage.getItem('outlet_store_id');
                datjson.userlevel = userlevel;

                var table = $('#table_summary_product').DataTable({
                    "scrollX": true,
                    "ajax": {
                        "url": "/ridapos_dashboard/sum_sv?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [
                        {data: "brand_id",
                            "className": 'brand_id',
                            "visible": false,
                            "searchable": false},
                        {data: "outlet_id",
                            "className": 'outlet_id'},
                        {data: "productcode",
                            "className": 'productcode'},
                        {data: "productname",
                            "className": 'productname'},
                        {data: "stock",
                            "className": 'stock'},
                        {data: "begining",
                            "className": 'begining'},
                        {data: "po",
                            "className": 'po'},
                        {data: "sales",
                            "className": 'sales'},
                        {data: "transfer",
                            "className": 'transfer'},
                        {data: "adjusment",
                            "className": 'adjusment'}
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
                                            title: "summary item",
                                            exportOptions: {columns: ':visible:not()'}, //last column has the action types detail/edit/delete
                                            footer: true
                                        },
                                        {
                                            extend: "csvHtml5",
                                            title: "summary item",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "excelHtml5",
                                            title: "summary item",
                                            exportOptions: {columns: ':visible:not()'},
                                            footer: true
                                        },
                                        {
                                            extend: "pdfHtml5",
                                            title: "summary item",
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







//$('#table_summary_product tbody').on( 'click', 'td:nth-child(-n+2)', function () {
//    console.log( table.row( this ).data() );
//} );



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
                                                        Summary
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="discount" class="tab-pane fade in active show">
                                                        <div class="container">        
                                                            <table class="table" id="table_summary_product" style="font-size: 12px; width: 100%">
                                                                <thead>  
                                                                    <tr>
                                                                        <th>brand_id</th>
                                                                        <th>outlet_id</th>
                                                                        <th>productcode</th>
                                                                        <th>productname</th>
                                                                        <th>stock</th>
                                                                        <th>beginning</th>
                                                                        <th>po</th>
                                                                        <th>sales</th>
                                                                        <th>transfer</th>
                                                                        <th>adjusment</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%--<%@include file='pop_up_edit_discount.jsp'%>--%>
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
