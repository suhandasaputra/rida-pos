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
            .create_discount {                
                display: inline-block;

            }
            .create_voucher {                
                display: inline-block;

            }

            th {
                background-color: #CCC;
            }



            #table_discount {
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            #table_voucher {
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            .card-body{min-height: 705px}
            #add_category_text{margin: 20px;font-weight: 100;color: #29B19C;cursor: pointer;}
            #outlet_id_discount{width: 250px; padding: 0px; margin-left: 20px}
            @media only screen and (max-width: 400px) {
                .card-body{min-height: 620px}
                #add_category_text{margin: 10px;}
                #outlet_id_discount{width: 200px; padding: 0px; margin-left: 10px;}
            }
        </style>
        <script>
            var user_id = window.localStorage.getItem('user_id');
            $(document).ready(function () {
                var userlevel = window.localStorage.getItem('userlevel');
                if (userlevel === 'administrator') {
                    window.location.href = "ho";
                }
                getdiscount();
                getvoucher();
            });
            function getdiscount() {
                $('#table_discount').dataTable().fnClearTable();
                $('#table_discount').dataTable().fnDestroy();
                var outlet_id_discount = document.getElementById("outlet_id_discount").value;

                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = outlet_id_discount;
                datjson.user_id = user_id;

                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "disi?data=" + JSON.stringify(datjson),
                    type: 'get',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var datadiscount = response.datadiscount;
                            var layar = window.screen.availWidth;
                            if (layar < 400) {
                                $('#table_discount').DataTable({
                                    "scrollX": true,
                                    "data": datadiscount,
                                    "columns": [
                                        {data: "id",
                                            "className": 'id', "defaultContent": ""},
                                        {data: "outlet_id",
                                            "className": "outlet_id", "defaultContent": ""},
                                        {data: "discount_name",
                                            "defaultContent": ""},
                                        {data: "discount_rate",
                                            "defaultContent": ""},
                                        {data: "items",
                                            "defaultContent": ""},
                                        {data: "startdate",
                                            "defaultContent": ""},
                                        {data: "outlets",
                                            "defaultContent": ""},
                                        {data: "status",
                                            render: function (data, type, row) {
                                                var color = 'black';
                                                if (data == 'Expired') {
                                                    color = 'red';
                                                }
                                                if (data == 'On going') {
                                                    color = 'green';
                                                }
                                                if (data == 'Scheduled') {
                                                    color = 'purple';
                                                }
                                                if (data == 'Inactive') {
                                                    color = 'blue';
                                                }
                                                return '<span style="color:' + color + '">' + data + '</span>';
                                            },
                                            "defaultContent": ""
                                        },
                                        {data: "id",
                                            render: function (data) {
                                                if (data == "") {
                                                    return "";
                                                } else {
                                                    return '<input type="button" class="btn btn-primary" value="Edit" id="id_discount">';
                                                }
                                            },
                                            "defaultContent": ""
                                        }
                                    ]
                                });
                            } else if (layar > 400) {
                                $('#table_discount').DataTable({
//                                    "scrollX": true,
                                    "data": datadiscount,
                                    "columns": [
                                        {data: "id",
                                            "className": 'id', "defaultContent": ""},
                                        {data: "outlet_id",
                                            "className": "outlet_id", "defaultContent": ""},
                                        {data: "discount_name",
                                            "defaultContent": ""},
                                        {data: "discount_rate",
                                            "defaultContent": ""},
                                        {data: "items",
                                            "defaultContent": ""},
                                        {data: "startdate",
                                            "defaultContent": ""},
                                        {data: "outlets",
                                            "defaultContent": ""},
                                        {data: "status",
                                            render: function (data, type, row) {
                                                var color = 'black';
                                                if (data == 'Expired') {
                                                    color = 'red';
                                                }
                                                if (data == 'On going') {
                                                    color = 'green';
                                                }
                                                if (data == 'Scheduled') {
                                                    color = 'purple';
                                                }
                                                if (data == 'Inactive') {
                                                    color = 'blue';
                                                }
                                                return '<span style="color:' + color + '">' + data + '</span>';
                                            },
                                            "defaultContent": ""
                                        },
                                        {data: "id",
                                            render: function (data) {
                                                if (data == "") {
                                                    return "";
                                                } else {
                                                    return '<input type="button" class="btn btn-primary" value="Edit" id="id_discount">';
                                                }
                                            },
                                            "defaultContent": ""
                                        }
                                    ]
                                });
                            }
                        } else {
                            alert('failed retrieve data');
                        }
                    }
                });
            }

            function getvoucher() {
                $('#table_voucher').dataTable().fnClearTable();
                $('#table_voucher').dataTable().fnDestroy();
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.user_id = user_id;
                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "vou_s?data=" + JSON.stringify(datjson),
                    type: 'get',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var datavoucher = response.datavocher;
                            var layar = window.screen.availWidth;
                            if (layar < 400) {
                                $('#table_voucher').DataTable({
                                    "scrollX": true,
                                    "data": datavoucher,
                                    "columns": [
                                        {data: "voucher_id",
                                            "className": 'id_voucher', "defaultContent": ""},
                                        {data: "voucher_name",
                                            "defaultContent": ""},
                                        {data: "value",
                                            "defaultContent": "",
                                            render: function (data) {
                                                var rx = /(\d+)(\d{3})/;
                                                return String(data).replace(/^\d+/, function (w) {
                                                    while (rx.test(w)) {
                                                        w = w.replace(rx, '$1,$2');
                                                    }
                                                    return w;
                                                });
                                            }},
                                        {data: "limit",
                                            "defaultContent": ""},
                                        {data: "startdate",
                                            "defaultContent": ""},
                                        {data: "outlet_name",
                                            "defaultContent": ""},
                                        {data: "creator",
                                            "defaultContent": ""},
                                        {data: "status_exp",
                                            render: function (data, type, row) {
                                                var color = 'black';
                                                if (data == 'Expired') {
                                                    color = 'red';
                                                }
                                                if (data == 'On going') {
                                                    color = 'green';
                                                }
                                                if (data == 'Scheduled') {
                                                    color = 'purple';
                                                }
                                                if (data == 'Inactive') {
                                                    color = 'blue';
                                                }
                                                return '<span style="color:' + color + '">' + data + '</span>';
                                            },
                                            "defaultContent": ""
                                        },
                                        {data: "voucher_id",
                                            render: function (data) {
                                                if (data == "") {
                                                    return "";
                                                } else {
                                                    return '<input type="button" class="btn btn-primary" value="Edit" id="id_voucher">';
                                                }
                                            },
                                            "defaultContent": ""
                                        }
                                    ]
                                });
                            } else if (layar > 400) {
                                $('#table_voucher').DataTable({
//                                    "scrollX": true,
                                    "data": datavoucher,
                                    "columns": [
                                        {data: "voucher_id",
                                            "className": 'id_voucher', "defaultContent": ""},
                                        {data: "voucher_name",
                                            "defaultContent": ""},
                                        {data: "value",
                                            "defaultContent": "",
                                            render: function (data) {
                                                var rx = /(\d+)(\d{3})/;
                                                return String(data).replace(/^\d+/, function (w) {
                                                    while (rx.test(w)) {
                                                        w = w.replace(rx, '$1,$2');
                                                    }
                                                    return w;
                                                });
                                            }},
                                        {data: "limit",
                                            "defaultContent": ""},
                                        {data: "startdate",
                                            "defaultContent": ""},
                                        {data: "outlet_name",
                                            "defaultContent": ""},
                                        {data: "creator",
                                            "defaultContent": ""},
                                        {data: "status_exp",
                                            render: function (data, type, row) {
                                                var color = 'black';
                                                if (data == 'Expired') {
                                                    color = 'red';
                                                }
                                                if (data == 'On going') {
                                                    color = 'green';
                                                }
                                                if (data == 'Scheduled') {
                                                    color = 'purple';
                                                }
                                                if (data == 'Inactive') {
                                                    color = 'blue';
                                                }
                                                return '<span style="color:' + color + '">' + data + '</span>';
                                            },
                                            "defaultContent": ""
                                        },
                                        {data: "voucher_id",
                                            render: function (data) {
                                                if (data == "") {
                                                    return "";
                                                } else {
                                                    return '<input type="button" class="btn btn-primary" value="Edit" id="id_voucher">';
                                                }
                                            },
                                            "defaultContent": ""
                                        }
                                    ]
                                });
                            }
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
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                        Promo
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <ul class="nav nav-tabs topnav" id="myTab">
                                                    <!-- add data-toggle attribute to the anchors -->
                                                    <li><a data-toggle="tab" href="#discount" class="active">Discount</a></li>
                                                    <li><a data-toggle="tab" href="#voucher">Voucher</a></li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="discount" class="tab-pane fade in active show">
                                                        <div id="create_discount">    
                                                            <label id="create_discount_text" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create Discount</label>
                                                        </div>
                                                        <br>
                                                        <div id="bar_discount" style="display: inline; color: #29B19C;">
                                                            <label id="add_category_text">
                                                                Select Outlet
                                                            </label>
                                                            <select id="outlet_id_discount" class="col-md-3" name="outlet_id_discount">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="getdiscount()"></i>
                                                        </div>


                                                        <div class="container">        
                                                            <table id="table_discount" style="font-size: 12px; width: 100%;">
                                                                <thead>  
                                                                    <tr>
                                                                        <th>Discount ID</th>
                                                                        <th>Outlet ID</th>
                                                                        <th>Discount Name</th>
                                                                        <th>Value(%)</th>
                                                                        <th>Item</th>
                                                                        <th>Duration</th>
                                                                        <th>Outlet</th>
                                                                        <th>Status</th>
                                                                        <th>Edit</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_discount.jsp'%>
                                                        <%@include file='pop_up_edit_discount.jsp'%>
                                                    </div>
                                                    <div id="voucher" class="tab-pane fade">
                                                        <div id="create_voucher"> 
                                                            <label id="create_voucher_text" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create Voucher</label>
                                                        </div>
                                                        <div class="container">        
                                                            <table id="table_voucher" style="font-size: 12px; width: 100%;">
                                                                <thead>  
                                                                    <tr>
                                                                        <th>Voucher ID</th>
                                                                        <th>Voucher Name</th>
                                                                        <th>Value IDR</th>
                                                                        <th>Limit</th>
                                                                        <th>Duration</th>
                                                                        <th>Outlet</th>
                                                                        <th>Creator</th>
                                                                        <th>Status</th>
                                                                        <th>Edit</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_voucher.jsp'%>
                                                        <%@include file='pop_up_edit_voucher.jsp'%>
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
