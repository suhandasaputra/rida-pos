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

            .container{
                max-width: max-content;
            }
            .card {
                background-color: white;
            }
            .create_po {                
                display: inline-block;

            }
            img {
                height: 60px; 
                width: 60px; 
                border-radius: 5px;
            }
            th {
                background-color: #CCC;
            }
            .input-group-append{
                background-color: #f2f4f6;
            }


            #create_voucher_search {
                background-image: url('/css/searchicon.png');
                background-position: 10px 10px;
                background-repeat: no-repeat;
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 40px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }

            #table_voucher {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #table_voucher th, #table_voucher td {
                text-align: left;
                padding: 12px;
            }

            #table_voucher tr {
                border-bottom: 1px solid #ddd;
            }

            #table_voucher tr.header, #table_voucher tr:hover {
                background-color: #f1f1f1;
            }
            .sort_filter {
                padding-left: 10px;
                padding-right: 10px;
                cursor: pointer;
            }
            .sort_filter:hover {
                background-color: #3dceb7;
            }
            #refresh_button {
                background-color: #29B19C;
                height: 25px;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                color: white;
                border-radius: 3px;
                padding: 0px 5px 0px 5px;
            }
            #refresh_button:hover {
                background-color: #3dceb7;
            }
            #text_select{margin: 20px;font-weight: 100;color: #29B19C;cursor: pointer;}
            #outlet_id_po{width: 250px; padding: 0px; margin-left: 20px}
            @media only screen and (max-width: 400px) {
                #text_select{margin: 10px;}
                #outlet_id_po{width: 200px; padding: 0px; margin-left: 10px; margin-bottom: 20px;}
            }
        </style>
        <script>
            var user_id = window.localStorage.getItem('user_id');
            $(document).ready(function () {
                var userlevel = window.localStorage.getItem('userlevel');
            if (userlevel === 'administrator') {
                window.location.href = "ho";
            }
                var outlet_id_po1 = document.getElementById("outlet_id_po").value;
                setTimeout(getpo, 1000);
            });
            function getpo() {
                $('#table_stock').dataTable().fnClearTable();
                $('#table_stock').dataTable().fnDestroy();
                var outlet_id_po = document.getElementById("outlet_id_po").value;
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = outlet_id_po;
                datjson.user_id = user_id;
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "stoi?data=" + JSON.stringify(datjson),
                    type: 'get',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var datapo = response.datapo;
                            $('#table_stock').DataTable({
                                "scrollX": true,
                                "data": datapo,
                                "columns": [
                                    {data: "outlet_id"},
                                    {data: "id_receive"},
                                    {data: "date"},
                                    {data: "productcode"},
                                    {data: "product_name"},
                                    {data: "qty"},
                                    {data: "buy_price",
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }},
                                    {data: "total_cost",
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }},
                                    {data: "pic"},
                                    {data: "supplier_name"},
                                    {data: "status"},
                                    {data: "status_return"
                                        ,
                                        render: function (data) {
                                            if (data == 1) {
                                                return 'returned';
                                            } else {
                                                return 'not yet';
                                            }
                                        }
                                    },
                                    {data: "supplier_name"},
                                    {data: {id_receive: "id_receive", outlet_id: "outlet_id"},
                                        render: function (data) {
                                            if (data.id_receive == "") {
                                                return "";
                                            } else {
                                                return '<a href=ed_sto?action=update&id=' + data.id_receive + '&brand=' + brand_id + '&outlet=' + data.outlet_id + '&user=' + user_id + ' class="btn btn-primary">View</a>';
                                            }
                                        },
                                        "defaultContent": ""
                                    }
                                ]
                            });
                        } else {
                            alert('failed retrieve data');
                        }
                    }
                });
            }
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
                                        <div class="card-body" style="min-height: 705px">
                                            <!--                                            <div class="row">
                                                                                            <div class="col-md-8">
                                                                                                <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                                                                    PO
                                                                                                </p>
                                                                                            </div>
                                                                                        </div>-->
                                            <!--                                            <div class="row">
                                                                                            <ul class="nav nav-tabs topnav" id="myTab">
                                                                                                <li><a data-toggle="tab" href="#stock" class="active">PO</a></li>
                                                                                            </ul>
                                                                                        </div>-->
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="stock" class="tab-pane fade in active show">
                                                        <div id="create_po">    
                                                            <label id="create_po_text" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create PO</label>
                                                        </div>
                                                        <!--                                                        <div id="create_po">
                                                                                                                    <label id="create_po_text" style="margin: 20px;
                                                                                                                           font-weight: 100;
                                                                                                                           color: #29B19C; 
                                                                                                                           cursor: pointer;">
                                                                                                                        <a href="sto_cr" id="stock_cre"><i class="icon fa fa-plus-circle" style="margin-right: 5px">
                                                                                                                            </i>Receive Stock</a>
                                                                                                                    </label>
                                                                                                                </div>-->
                                                        <!--<br>-->
                                                        <div id="bar_po" style="display: inline; color: #29B19C;">
                                                            <label id="text_select">
                                                                Select Outlet
                                                            </label>
                                                            <select id="outlet_id_po" class="col-md-3" name="outlet_id_po">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="getpo()"></i>
                                                        </div>
                                                        <div class="container">        
                                                            <table class="table" id="table_stock" style="font-size: 12px;">
                                                                <thead>  
                                                                    <tr>
                                                                        <th>Outlet ID</th>
                                                                        <th>ID PO</th>
                                                                        <th>Date</th>
                                                                        <th>Product Code</th>
                                                                        <th>Product Name</th>
                                                                        <th>Qty</th>
                                                                        <th>Price</th>
                                                                        <th>Total Cost</th>
                                                                        <th>Pic</th>
                                                                        <th>Supplier</th>
                                                                        <th>Status</th>
                                                                        <th>Status Return</th>
                                                                        <th>Supplier Name</th>
                                                                        <th>View</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_po.jsp'%>
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
    <script>
//tab active
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');
            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
        });
    </script>
</html>
