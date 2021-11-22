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

                $('#table_customer').DataTable({
                    "scrollX": true,
                    "ajax": {
                        "url": "/ridapos_dashboard/cusi?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"

                    },

                    "columns": [
                        {data: "outlet_id",
                            "className": 'outlet_id'},
                        {data: "name",
                            "className": 'name'},
                        {data: "phonenumber",
                            "className": 'phonenumber'},
                        {data: "email",
                            "className": 'email'},
                        {data: "address",
                            "className": 'address'},
                        {data: "amount_trx",
                            render: function (data) {
                                var rx = '/(\d+)(\d{3})/';
                                return String(data).replace('/^\d+/', function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            },
                            "className": 'amount_trx'},
                        {data: "total_trx",
                            render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            },
                            "className": 'total_trx'}
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
                                                        Customer
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <!--                                            <div class="row">
                                                                                            <ul class="nav nav-tabs topnav" id="myTab">
                                                                                                <li><a data-toggle="tab" href="#customer" class="active">Customer</a></li>
                                                                                            </ul>
                                                                                        </div>-->
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="customer" class="tab-pane fade in active show">
                                                        <div class="container" id="ref_tabel_item">    
                                                            <label id="add_customer" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Add Customer</label>
                                                        </div>
                                                        <br>
                                                        <table class="table" id="table_customer" style="font-size: 12px; width: 100%">
                                                            <thead>
                                                                <tr>
                                                                    <th>Outlet Id</th>
                                                                    <th>Customer Name</th>
                                                                    <th>Phone</th>
                                                                    <th>Email</th>
                                                                    <th>Address</th>
                                                                    <th>Amount Trx</th>
                                                                    <th>Total Trx</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                        <%@include file='pop_up_add_customer.jsp'%>
                                                        <%@include file='pop_up_edit_customer.jsp'%>
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
