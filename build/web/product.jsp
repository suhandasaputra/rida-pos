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
            .card-body {
                min-height: 705px;
            }
            .add_category {                
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






            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            /* Hide default HTML checkbox */
            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            /* The slider */
            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #29b19c;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }

            #table_item {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #table_item th, #table_item td {
                text-align: left;
                padding: 12px;
            }

            #table_item tr {
                border-bottom: 1px solid #ddd;
            }

            #table_item tr.header, #table_item tr:hover {
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
            /*            #table_category{
                            width: 100%;
                            font-size: 12px;
                        }*/


            /*-----------------------------------------------------------------------------------------*/            

            @media only screen and (max-width: 400px) {
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
                .add_category {                
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
                .switch {
                    position: relative;
                    display: inline-block;
                    width: 60px;
                    height: 34px;
                }

                /* Hide default HTML checkbox */
                .switch input {
                    opacity: 0;
                    width: 0;
                    height: 0;
                }

                /* The slider */
                .slider {
                    position: absolute;
                    cursor: pointer;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background-color: #ccc;
                    -webkit-transition: .4s;
                    transition: .4s;
                }

                .slider:before {
                    position: absolute;
                    content: "";
                    height: 26px;
                    width: 26px;
                    left: 4px;
                    bottom: 4px;
                    background-color: white;
                    -webkit-transition: .4s;
                    transition: .4s;
                }

                input:checked + .slider {
                    background-color: #29b19c;
                }

                input:focus + .slider {
                    box-shadow: 0 0 1px #2196F3;
                }

                input:checked + .slider:before {
                    -webkit-transform: translateX(26px);
                    -ms-transform: translateX(26px);
                    transform: translateX(26px);
                }

                /* Rounded sliders */
                .slider.round {
                    border-radius: 34px;
                }

                .slider.round:before {
                    border-radius: 50%;
                }

                #table_item {
                    border-collapse: collapse;
                    width: 100%;
                    border: 1px solid #ddd;
                    font-size: 18px;
                }

                #table_item th, #table_item td {
                    text-align: left;
                    padding: 12px;
                }

                #table_item tr {
                    border-bottom: 1px solid #ddd;
                }

                #table_item tr.header, #table_item tr:hover {
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
                                                        Product
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <ul class="nav nav-tabs topnav" id="myTab">
                                                    <!-- add data-toggle attribute to the anchors -->
                                                    <li><a data-toggle="tab" href="#category" class="active">Category</a></li>
                                                    <li><a data-toggle="tab" href="#item">Item</a></li>
                                                    <li><a data-toggle="tab" href="#deleteditem">Deleted Item</a></li>
                                                </ul>

                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="category" class="tab-pane fade in active show">
                                                        <div id="add_category">
                                                            <label id="add_category_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                <i class="icon fa fa-plus-circle" style="margin-right: 5px">
                                                                </i>Add Category
                                                            </label>
                                                        </div>
                                                        <div class="container">        
                                                            <table class="table" id="table_category" style="width: 100%; font-size: 12px;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>outlet id</th>
                                                                        <th>category id</th>
                                                                        <th>picture</th>
                                                                        <th>category</th>
                                                                        <th>item</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_category.jsp'%>
                                                        <%@include file='pop_up_edit_category.jsp'%>
                                                    </div>
                                                    <div id="item" class="tab-pane fade">
                                                        <div id="add_item" style="display: inline; color: #29B19C;">
                                                            <label id="add_item_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                <i class="icon fa fa-plus-circle" style="margin-right: 5px; cursor: pointer">
                                                                </i>Add Item
                                                            </label>
                                                        </div>
                                                        <div class="container">        
                                                            <table class="table" id="table_item" style="font-size: 12px; width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Outlet Id</th>
                                                                        <th>Product Code</th>
                                                                        <th>Barcode</th>
                                                                        <th>Picture</th>
                                                                        <th>Item Name</th>
                                                                        <th>Category</th>
                                                                        <th>Price</th>
                                                                        <th>description</th>
                                                                        <th>stock</th>
                                                                        <th>Receive Stock</th>
                                                                        <th>Status</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_add_item.jsp'%>
                                                        <%@include file='pop_up_edit_item.jsp'%>
                                                    </div>
                                                    <div id="deleteditem" class="tab-pane fade">
                                                        <div class="container">        
                                                            <table class="table" id="table_item_deleted" style = "opacity: 0.5; font-size: 12px; width: 100%; margin-top: 20px;">
                                                                <thead>
                                                                    <tr style="color: #000">
                                                                        <th>Product Code</th>
                                                                        <th>Barcode</th>
                                                                        <th>Picture</th>
                                                                        <th>Item Name</th>
                                                                        <th>Category</th>
                                                                        <th>Price</th>
                                                                        <th>description</th>
                                                                        <th>stock</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
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
        $(document).ready(function () {
            var userlevel = window.localStorage.getItem('userlevel');
            if (userlevel === 'administrator') {
                window.location.href = "ho";
            }

            hehe();
        });
        function destroy() {
            $('#table_category').dataTable().fnClearTable();
            $('#table_category').dataTable().fnDestroy();
            $('#table_item').dataTable().fnClearTable();
            $('#table_item').dataTable().fnDestroy();
            $('#table_item_deleted').dataTable().fnClearTable();
            $('#table_item_deleted').dataTable().fnDestroy();
        }
        function hehe() {


            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.outlet_id = window.localStorage.getItem('outlet_store_id');
            datjson.userlevel = userlevel;

            $.ajax({
                contentType: 'application/json',
                dataType: "json",
                url: "pds?data=" + JSON.stringify(datjson),
                type: 'get',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        var datacategory = JSON.parse(response.listcategory);
                        var dataitem = JSON.parse(response.listitem);
                        var dataitemdeleted = JSON.parse(response.listitemdeleted);
                        var timestamp = new Date().getTime();
                        var t = '?t=';
                        var layar = window.screen.availWidth;


                        if (layar < 400) {
                            $('#table_category').DataTable(
                                    {
                                        "scrollX": true,
                                        "data": datacategory,
                                        "columns": [
                                            {data: "outlet_id",
                                                "className": 'category outlet_id_edit_cate'
                                            },
                                            {data: "category_id",
                                                "className": 'category category_id'},
                                            {data: "img_url"
                                                ,
                                                "className": 'category img_url',
                                                "render": function (data) {
                                                    return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                                }
                                            },
                                            {data: "category_name",
                                                "className": 'category category_name'},
                                            {data: "sum_item",
                                                "className": 'category sum_item'}
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
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]}, //last column has the action types detail/edit/delete
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "csvHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "excelHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "pdfHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "print",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            }
                                                        ]
                                            }
                                        ]
                                    });



                            $('#table_item').DataTable({
                                "scrollX": true,
                                "data": dataitem,
                                "columns": [
                                    {data: "outlet_id",
                                        "className": 'product outlet_id'
                                    },
                                    {data: "productcode",
                                        "className": 'product productcode'
                                    },
                                    {data: "barcode",
                                        "className": 'product barcode'
                                    },
                                    {data: "img_url",
                                        "className": 'product item img_url',
                                        "render": function (data) {
                                            return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                        }},
                                    {data: "productname",
                                        "className": 'product item productname'
                                    },
                                    {data: "category",
                                        "className": 'product category'
                                    },
                                    {data: "price",
                                        "className": 'product price'
                                        ,
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }
                                    },
                                    {data: "detailproduct",
                                        "className": 'product detailproduct'
                                    },
                                    {data: "stock",
                                        "className": 'product stock'
                                    },
                                    {data: "receive_stock",
                                        render: function (data) {
                                            if (data === '1') {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_receive" checked>'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            } else {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_receive">'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            }
                                        }
                                    },
                                    {data: "available",
                                        render: function (data) {
                                            if (data === '1') {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_available" checked>'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            } else {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_available">'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            }
                                        }}
                                ],
                                dom: 'Bfrtip'
                                ,
                                buttons: [
                                    {
                                        extend: 'collection',
                                        text: 'Export',
                                        autoClose: true,
                                        buttons:
                                                [
                                                    {
                                                        extend: "copyHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]}, //last column has the action types detail/edit/delete
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "csvHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "excelHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "pdfHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "print",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    }
                                                ]
                                    }
                                ]
                            });

                            $('#table_item_deleted').DataTable({
                                "scrollX": true,
                                "data": dataitemdeleted,
                                "columns": [
                                    {data: "productcode"},
                                    {data: "barcode"},
                                    {data: "img_url",
                                        "className": 'item img_url',
                                        "render": function (data) {
                                            return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                        }},
                                    {data: "productname"},
                                    {data: "category"},
                                    {data: "price",
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }
                                    },
                                    {data: "detailproduct"},
                                    {data: "stock"}
                                ],
                                dom: 'Bfrtip'
                                ,
                                buttons: [
                                    {
                                        extend: 'collection',
                                        text: 'Export',
                                        autoClose: true,
                                        buttons:
                                                [
                                                    {
                                                        extend: "copyHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]}, //last column has the action types detail/edit/delete
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "csvHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "excelHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "pdfHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "print",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    }
                                                ]
                                    }
                                ]
                            });
                        } else if (layar > 400) {
                            $('#table_category').DataTable(
                                    {
                                        "data": datacategory,
                                        "columns": [
                                            {data: "outlet_id",
                                                "className": 'category outlet_id_edit_cate'
                                            },
                                            {data: "category_id",
                                                "className": 'category category_id'},
                                            {data: "img_url"
                                                ,
                                                "className": 'category img_url',
                                                "render": function (data) {
                                                    return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                                }
                                            },
                                            {data: "category_name",
                                                "className": 'category category_name'},
                                            {data: "sum_item",
                                                "className": 'category sum_item'}
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
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]}, //last column has the action types detail/edit/delete
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "csvHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "excelHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "pdfHtml5",
                                                                title: "list category",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            },
                                                            {
                                                                extend: "print",
                                                                exportOptions: {columns: [0, 1, 3, 4]},
                                                                footer: true
                                                            }
                                                        ]
                                            }
                                        ]
                                    });



                            $('#table_item').DataTable({
                                "data": dataitem,
                                "columns": [
                                    {data: "outlet_id",
                                        "className": 'product outlet_id'
                                    },
                                    {data: "productcode",
                                        "className": 'product productcode'
                                    },
                                    {data: "barcode",
                                        "className": 'product barcode'
                                    },
                                    {data: "img_url",
                                        "className": 'product item img_url',
                                        "render": function (data) {
                                            return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                        }},
                                    {data: "productname",
                                        "className": 'product item productname'
                                    },
                                    {data: "category",
                                        "className": 'product category'
                                    },
                                    {data: "price",
                                        "className": 'product price'
                                        ,
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }
                                    },
                                    {data: "detailproduct",
                                        "className": 'product detailproduct'
                                    },
                                    {data: "stock",
                                        "className": 'product stock'
                                    },
                                    {data: "receive_stock",
                                        render: function (data) {
                                            if (data === '1') {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_receive" checked>'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            } else {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_receive">'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            }
                                        }
                                    },
                                    {data: "available",
                                        render: function (data) {
                                            if (data === '1') {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_available" checked>'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            } else {
                                                return '<label class="switch">'
                                                        + '<input type="checkbox" id="change_available">'
                                                        + '<div class="slider round"></div>'
                                                        + '</label>'
                                            }
                                        }}
                                ],
                                dom: 'Bfrtip'
                                ,
                                buttons: [
                                    {
                                        extend: 'collection',
                                        text: 'Export',
                                        autoClose: true,
                                        buttons:
                                                [
                                                    {
                                                        extend: "copyHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]}, //last column has the action types detail/edit/delete
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "csvHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "excelHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "pdfHtml5",
                                                        title: "list item",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "print",
                                                        exportOptions: {columns: [0, 1, 2, 4, 5, 6, 7, 8]},
                                                        footer: true
                                                    }
                                                ]
                                    }
                                ]
                            });

                            $('#table_item_deleted').DataTable({
                                "data": dataitemdeleted,
                                "columns": [
                                    {data: "productcode"},
                                    {data: "barcode"},
                                    {data: "img_url",
                                        "className": 'item img_url',
                                        "render": function (data) {
                                            return '<img height="75%" width="75%" src="' + data + t + timestamp + '"/>';
                                        }},
                                    {data: "productname"},
                                    {data: "category"},
                                    {data: "price",
                                        render: function (data) {
                                            var rx = /(\d+)(\d{3})/;
                                            return String(data).replace(/^\d+/, function (w) {
                                                while (rx.test(w)) {
                                                    w = w.replace(rx, '$1,$2');
                                                }
                                                return w;
                                            });
                                        }
                                    },
                                    {data: "detailproduct"},
                                    {data: "stock"}
                                ],
                                dom: 'Bfrtip'
                                ,
                                buttons: [
                                    {
                                        extend: 'collection',
                                        text: 'Export',
                                        autoClose: true,
                                        buttons:
                                                [
                                                    {
                                                        extend: "copyHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]}, //last column has the action types detail/edit/delete
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "csvHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "excelHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "pdfHtml5",
                                                        title: "list item deleted",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    },
                                                    {
                                                        extend: "print",
                                                        exportOptions: {columns: [0, 1, 3, 4, 5, 6, 7]},
                                                        footer: true
                                                    }
                                                ]
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

//for enable receive stock
        $('#table_item').on('click', '#change_receive', function () {
            var $row = $(this).closest("tr");
            var outlet_id = $row.find(".outlet_id").text();
            var productcode = $row.find(".productcode").text();
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.outlet_id = outlet_id;
            datjson.productcode = productcode;
            datjson.tipe = "receive_stock";
            $.ajax({
                dataType: "json",
                url: "pds",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        destroy();
                        hehe();
                        alert('Success change receive ' + productcode);
                    } else {
                        alert('Failed change receive ' + productcode);
                    }
                }
            });
        });


        //for enable available
        $('#table_item').on('click', '#change_available', function () {
            var $row = $(this).closest("tr");
            var outlet_id = $row.find(".outlet_id").text();
            var productcode = $row.find(".productcode").text();
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.outlet_id = outlet_id;
            datjson.productcode = productcode;
            datjson.tipe = "available";
            $.ajax({
                dataType: "json",
                url: "pds",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        destroy();
                        hehe();
                        alert('Success change status ' + productcode);
                    } else {
                        alert('Failed change status ' + productcode);
                    }
                }
            });
        });

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
