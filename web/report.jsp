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


            #table_summary th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_detail th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_item th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_detail2 th {
                background-color: #7ee2d3;
                color: black;
                font-weight: 100;
            }
            #table_detail2 tr {
                background-color: #efeff3;
            }
            .input-group-append{
                background-color: #f2f4f6;
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



            td.details-control {
                background: url('image/plus2.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                filter: blur(0.6px);
                color: white;
                background-color: white;
                background: url('image/image.png') no-repeat center center;
                cursor: pointer;
            }
            td.details-control1 {
                background: url('image/download.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control1 {
                background: url('image/download_white.png') no-repeat center center;
                cursor: pointer;
            }
            td.details-control2 {
                background: url('image/print.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control2 {
                background: url('image/print_white.png') no-repeat center center;
                cursor: pointer;
            }
            #download_excel {
                display: inline; 
                color: #29B19C;
                background-color: white;
            }
            #print_data {
                display: inline; 
                color: #29B19C;
                background-color: white;
            }
            #download_excel_item {
                display: inline; 
                color: #29B19C;
                background-color: white;
            }
            #print_data_item {
                display: inline; 
                color: #29B19C;
                background-color: white;
            }
            tr.odd.shown {
                color: white;
                background-color: #29B19C;
            }
            tr.even.shown {
                color: white;
                background-color: #29B19C;
            }
            .summary_report_header {
                background-color: #e2dddd;
                font-weight: 600;
            }
            #tanggal_summary_from{width: 200px; padding: 0px;}
            #tanggal_summary_to{width: 200px; padding: 0px;}
            #outlet_id_summary{width: 250px; padding: 0px; margin-left: 20px}
            #tanggal_item_from{width: 200px; padding: 0px;}
            #tanggal_item_to{width: 200px; padding: 0px;}
            #outlet_id_item{width: 250px; padding: 0px; margin-left: 20px;}
            #tanggal_detail_from{width: 200px; padding: 0px;}
            #tanggal_detail_to{width: 200px; padding: 0px;}
            #outlet_id_detail{width: 250px; padding: 0px; margin-left: 20px;}

            @media only screen and (max-width: 400px) {
                #tanggal_summary_from{width: 80px; padding: 0px;}
                #tanggal_summary_to{width: 80px; padding: 0px;}
                #outlet_id_summary{width: 100px; padding: 0px; margin-left: 10px;}

                #tanggal_item_from{width: 80px; padding: 0px;}
                #tanggal_item_to{width: 80px; padding: 0px;}
                #outlet_id_item{width: 100px; padding: 0px; margin-left: 10px;}

                #tanggal_detail_from{width: 80px; padding: 0px;}
                #tanggal_detail_to{width: 80px; padding: 0px;}
                #outlet_id_detail{width: 100px; padding: 0px; margin-left: 10px;}
                #ref_tabel_detail{overflow-x: scroll}
                #ref_tabel_item{overflow-x: scroll}
            }
        </style>
        <script>
            jQuery(document).ready(function ($) {
                var userlevel = window.localStorage.getItem('userlevel');
                if (userlevel === 'administrator') {
                    window.location.href = "ho";
                }
                var layar = window.screen.availWidth;
                if (layar < 400) {
                    document.getElementById('add_category_text').style.display = 'none';
                    document.getElementById('lbl_item').style.display = 'none';
                    document.getElementById('add_item_text').style.display = 'none';
                }
                var brand_id = window.localStorage.getItem('brand_id');
                if (userlevel === 'owner') {
                    $.getJSON('opt?action=option_outlet', {brand_id: brand_id}, function (data) {
                        var options = '<option value="">All Outlet</option>';
                        for (var i = 0; i < data.length; i++) {
                            options += '<option value="' + data[i].outlet_id + '">' + data[i].outlet_name + '</option>';
                        }
                        $("select#outlet_id_detail").html(options);
                        $("select#outlet_id_item").html(options);
                        $("select#outlet_id_summary").html(options);
                    });
                } else {
                    var outlet_id = window.localStorage.getItem('outlet_store_id');
                    var outlet_name = window.localStorage.getItem('outlet_store_name');
                    var options = '<option value="' + brand_id + outlet_id + '">' + outlet_name + '</option>';
                    $("select#outlet_id_detail").html(options);
                    $("select#outlet_id_item").html(options);
                    $("select#outlet_id_summary").html(options);
                }



                setTimeout("run_summary()", 500);
                setTimeout("run_item()", 500);
                setTimeout("run_detail()", 500);


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
                                        <div class="card-body" style="min-height: 705px">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                        Reports
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <ul class="nav nav-tabs topnav" id="myTab">
                                                    <!-- add data-toggle attribute to the anchors -->
                                                    <li><a data-toggle="tab" href="#summary" class="active">Summary</a></li>
                                                    <li><a data-toggle="tab" href="#item">Item</a></li>
                                                    <li><a data-toggle="tab" href="#detail">Detail</a></li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="summary" class="tab-pane fade in active show">
                                                        <div id="bar_summary" style="display: inline; color: #29B19C;">
                                                            <label id="add_category_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                Summary Transaction Report
                                                            </label>
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">from</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_summary_from" class="col-md-3" name="tanggal_summary_from" placeholder="Today">
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">to</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_summary_to" class="col-md-3" name="tanggal_summary_to" placeholder="Today">
                                                            <!--<input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_summary" class="col-md-3 offset-md-2" style="width: 250px; padding: 0px; margin-left: 70px" name="tanggal_summary" placeholder="Today">-->
                                                            <select id="outlet_id_summary" class="col-md-3" name="outlet_id_summary">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="run_summary()"></i>
                                                            <button class="dt-button buttons-excel buttons-html5" tabindex="0" aria-controls="table_summary" type="button" title="Excel" id="download_excel_summary" style="color: #29B19C" onclick="ExportExcel_sum('xlsx');"><span><i class="fa fa-download"></i></span></button>
                                                            <button class="dt-button buttons-print" tabindex="0" aria-controls="table_summary" type="button" title="Print" id="print_data_summary" style="color: #29B19C" onclick="printData_sum()"><span><i class="fa fa-print"></i></span></button>
                                                        </div>
                                                        <div class="container" id="ref_tabel_summary">        
                                                            <table class="table" id="table_summary" style="font-size: 12px">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Description</th>
                                                                        <th>Data</th>
                                                                    </tr>
                                                                    <tr class="summary_report_header">
                                                                        <!--<td>Sales</td><td></td>-->
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Opening Amount</td><td id="opening_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Closing Amount</td><td id="closing_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Total Sales</td><td id="total_sales_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Total Sales(With Tax)</td><td id="total_sales_summary_with_tax"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Number of transaction</td><td id="number_of_transaction_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Average Per ticket</td><td id="average_per_ticket_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Number of item sold</td><td id="number_of_item_sold_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Tax</td><td id="tax_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Cash</td><td id="cash_summary"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Cashless</td><td id="cashless_summary"></td>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div id="item" class="tab-pane fade">
                                                        <div id="bar_item" style="display: inline; color: #29B19C;">
                                                            <label id="lbl_item" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                Item Sales Report
                                                            </label>
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">from</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_item_from" class="col-md-3" name="tanggal_item_from" placeholder="Today">
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">to</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_item_to" class="col-md-3" name="tanggal_item_to" placeholder="Today">
                                                            <!--<input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_item" class="col-md-3 offset-md-2" style="width: 250px; padding: 0px;" name="tanggal_item" placeholder="Today">-->
                                                            <select id="outlet_id_item" class="col-md-3" name="outlet_id_item">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="run_item()"></i>
                                                        </div>
                                                        <div class="container" id="ref_tabel_item">        
                                                            <table class="table" id="table_item" style="font-size: 12px; width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Item</th>
                                                                        <th>Product ID</th>
                                                                        <th>Category</th>
                                                                        <th>Sell Price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Total</th>
                                                                        <th>Tax</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div id="detail" class="tab-pane fade">
                                                        <div id="bar_detail" style="display: inline; color: #29B19C;">
                                                            <label id="add_item_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                Detailed Sales Report
                                                            </label>
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">from</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_detail_from" class="col-md-3" name="tanggal_detail_from" placeholder="Today">
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">to</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_detail_to" class="col-md-3" name="tanggal_detail_to" placeholder="Today">
                                                            <select id="outlet_id_detail" class="col-md-3" name="outlet_id_detail">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="run_detail()"></i>
                                                        </div>
                                                        <div class="container" id="ref_tabel_detail">        
                                                            <table class="table" id="table_detail" style="font-size: 12px; width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Receipt number</th>
                                                                        <th>Outlet Id</th>
                                                                        <th>Date</th>
                                                                        <th>Item Purchased</th>
                                                                        <th>Customer</th>
                                                                        <th>Total</th>
                                                                        <th>Tax</th>
                                                                        <th>Payment</th>
                                                                        <th>Status Void</th>
                                                                        <th>Void Trx</th>                                                                        
                                                                        <th>Download</th>
                                                                        <th>Print</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_void.jsp'%>
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
        <script>
            function run_detail() {
                $('#ref_tabel_detail').load(document.URL + ' #ref_tabel_detail');
                $("#download_excel").remove();
                $("#print_data").remove();
                setTimeout("getTrx_detail()", 500);
            }
            function getTrx_detail() {
                var datjson = new Object();
                datjson.tanggal_from = $('#tanggal_detail_from').val();
                datjson.tanggal_to = $('#tanggal_detail_to').val();
                datjson.outlet_id = $('#outlet_id_detail').val();
                datjson.brand_id = brand_id;
                function format(d) {
                    return  '<table class="table" id="table_detail2">' +
                            '<thead>' +
                            '<tr>' +
                            '<th>product_code</th>' +
                            '<th>product_name</th>' +
                            '<th>barcode</th>' +
                            '<th>price</th>' +
                            '<th>total</th>' +
                            '<th>sum_amount</th>' +
                            '<th>tax</th>' +
                            '<th>discount</th>' +
                            '</tr>' +
                            '</thead>' +
                            '</table>';
                }


                var table = $('#table_detail').DataTable({
//                    "scrollX": true,
                    "bFilter": false,
                    "dom": 'Brt<"bottom"flp>',
                    buttons: [
                        {
                            attr: {
                                id: 'download_excel'
                            },
                            extend: 'excelHtml5',
                            exportOptions: {columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]},
                            text: '<i class="fa fa-download"></i>',
                            titleAttr: 'Excel'
                        }, {
                            attr: {
                                id: 'print_data'
                            },
                            extend: 'print',
                            exportOptions: {columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]},
                            text: '<i class="fa fa-print"></i>',
                            titleAttr: 'Print'
                        }
                    ],
                    "ajax": {
                        "dataSrc": "",
                        url: "drp",
                        type: 'post',
                        dataType: 'json',
                        data: function (d) {
                            return JSON.stringify(datjson);
                        },
                        contentType: 'application/json',
                        mimeType: 'application/json'
                    },
                    "columns": [
                        {
                            "className": 'details-control',
                            "orderable": false,
                            "data": null,
                            "defaultContent": ''
                        },
                        {"data": "noresi",
                            "className": 'details-noresi'
                        },
                        {"data": "outlet_id",
                            "className": 'details-outlet'
                        },
                        {"data": "dt_internal",
                            "className": 'details-date'
                        },
                        {"data": "item_purchase"},
                        {"data": "customer_name"},
                        {"data": "amount",
                            "className": 'details-total',
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
                        {"data": "tax",
                            "className": 'details-tax',
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
                        {"data": "payment_method"},
                        {"data": "status_void",
                            "className": 'status_void'
                            ,
                            render: function (data, type, row) {
                                var color_txt = '';
                                if (data === 'not') {
                                    color_txt = '#29B19C';
                                }
                                if (data === 'void') {
                                    color_txt = '#ea2b2b';
                                }
                                return '<span style="color:' + color_txt + '">' + data + '</span>';
                            }
                        },
                        {"data": "status_void",
                            "className": 'id_void',
                            render: function (data, type, row) {
                                var color = '';
                                var color_txt = '';
                                if (data === 'not') {
                                    color = '#29B19C';
                                    color_txt = 'white';
                                    return '<input type="button" class="btn btn-primary" style="background-color:' + color + ';color:' + color_txt + '" value="Action">';
                                }
                                if (data === 'void') {
                                    color = '#ea2b2b';
                                    color_txt = 'white';
                                    return '<input type="button" class="btn btn-primary" style="background-color:' + color + ';color:' + color_txt + '" value="Action">';
                                }
                            }
                        },
                        {
                            "className": 'details-control1',
                            "orderable": false,
                            "data": null,
                            "defaultContent": ''
                        },
                        {
                            "className": 'details-control2',
                            "orderable": false,
                            "data": null,
                            "defaultContent": ''
                        }
                    ],
                    "order": [[3, 'desc']]
                });

                $('#table_detail tbody').on('click', 'td.id_void', function () {
                    var $row = $(this).closest("tr");
                    var void_receipt = $row.find(".details-noresi").text();
                    var void_outlet = $row.find(".details-outlet").text();
                    var void_total = $row.find(".details-total").text();
                    var void_tax = $row.find(".details-tax").text();
                    var void_trx_date = $row.find(".details-date").text();


                    document.getElementById("void_receipt").value = void_receipt;
                    document.getElementById("void_outlet").value = void_outlet;
                    document.getElementById("void_total").value = void_total;
                    document.getElementById("void_tax").value = void_tax;
                    document.getElementById("void_trx_date").innerHTML = void_trx_date;
                    var id_void = $row.find(".status_void").text();
                    var btn = document.getElementById("buttonon");
                    if (id_void === 'not') {
                        $('.cd-popup-void').addClass('is-visible');
//                        btn.style.visibility = 'hidden';
                    }
                });


                // Add event listener for opening and closing details
                $('#table_detail tbody').on('click', 'td.details-control', function () {
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    if (row.child.isShown()) {
                        // This row is already open - close it
                        row.child.hide();
                        tr.removeClass('shown');
                    } else {
                        if (table.row('.shown').length) {
                            $('.details-control', table.row('.shown').node()).click();
                        }
                        var table_detail = document.getElementById("table_detail");
                        if (table_detail != null) {
                            for (var i = 0; i < table_detail.rows.length; i++) {
                                var column_num = 1;
                                var row_num = parseInt($(this).parent().index());
                                var rrn = table_detail.rows[row_num + 1].cells[column_num].innerText;
                            }
                            var datjson2 = new Object();
                            datjson2.rrn = rrn;
                            $.ajax({
                                url: "dtr",
                                type: 'post',
                                dataType: "json",
                                data: JSON.stringify(datjson2),
                                contentType: 'application/json',
                                success: function (response) {
                                    if (response.resp_code == 0000) {
                                        let tb_dt2 = JSON.parse(response.detail);
                                        $(document).ready(function () {
                                            $('#table_detail2').DataTable({
//                                                scrollX: true,
                                                data: tb_dt2,
                                                dataType: 'json',
                                                retrieve: true,
                                                paging: false,
                                                searching: false,
                                                columns: [
                                                    {data: "product_code"},
                                                    {data: "product_name"},
                                                    {data: "barcode"},
                                                    {data: "price",
                                                        render: function (data) {
                                                            var rx = /(\d+)(\d{3})/;
                                                            return String(data).replace(/^\d+/, function (w) {
                                                                while (rx.test(w)) {
                                                                    w = w.replace(rx, '$1,$2');
                                                                }
                                                                return w;
                                                            });
                                                        }},
                                                    {data: "total",
                                                        render: function (data) {
                                                            var rx = /(\d+)(\d{3})/;
                                                            return String(data).replace(/^\d+/, function (w) {
                                                                while (rx.test(w)) {
                                                                    w = w.replace(rx, '$1,$2');
                                                                }
                                                                return w;
                                                            });
                                                        }},
                                                    {data: "sum_amount",
                                                        render: function (data) {
                                                            var rx = /(\d+)(\d{3})/;
                                                            return String(data).replace(/^\d+/, function (w) {
                                                                while (rx.test(w)) {
                                                                    w = w.replace(rx, '$1,$2');
                                                                }
                                                                return w;
                                                            });
                                                        }},
                                                    {data: "tax",
                                                        render: function (data) {
                                                            var rx = /(\d+)(\d{3})/;
                                                            return String(data).replace(/^\d+/, function (w) {
                                                                while (rx.test(w)) {
                                                                    w = w.replace(rx, '$1,$2');
                                                                }
                                                                return w;
                                                            });
                                                        }},
                                                    {data: "discount",
                                                        render: function (data) {
                                                            var rx = /(\d+)(\d{3})/;
                                                            return String(data).replace(/^\d+/, function (w) {
                                                                while (rx.test(w)) {
                                                                    w = w.replace(rx, '$1,$2');
                                                                }
                                                                return w;
                                                            });
                                                        }}
                                                ]
                                            });
                                        });
                                        // Open this row
                                        row.child(format(row.data())).show();
                                        tr.addClass('shown');
                                    }
                                }
                            });
                        }
                    }
                });
                $('#table_detail tbody').on('click', 'td.details-control1', function () {
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    if (row.child.isShown()) {
                        var isi_tbl2 = document.querySelectorAll('#table_detail2 tbody tr').length;
                        if (isi_tbl2 != 0) {
                            ExportExcel('xlsx');
                        }
                    }
                });
                $('#table_detail tbody').on('click', 'td.details-control2', function () {
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    if (row.child.isShown()) {
                        var isi_tbl2 = document.querySelectorAll('#table_detail2 tbody tr').length;
                        if (isi_tbl2 != 0) {
                            printData();
                        }
                    }
                });
            }
            function ExportExcel(type, fn, dl) {
                var elt = document.getElementById('table_detail2');
                var wb = XLSX.utils.table_to_book(elt, {sheet: "Sheet JS"});
                return dl ?
                        XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                        XLSX.writeFile(wb, fn || ('Detail_trx.' + (type || 'xlsx')));
            }
            function printData()
            {
                var divToPrint = document.getElementById("table_detail2");
                newWin = window.open("");
                newWin.document.write(divToPrint.outerHTML);
                newWin.print();
                newWin.close();
            }
        </script>
        <script>
            function run_item() {
                $('#ref_tabel_item').load(document.URL + ' #ref_tabel_item');
                $("#download_excel_item").remove();
                $("#print_data_item").remove();
                setTimeout("getTrx_item()", 500);
            }
            function getTrx_item() {
                var datjson1 = new Object();
                datjson1.tanggal_item_from = $('#tanggal_item_from').val();
                datjson1.tanggal_item_to = $('#tanggal_item_to').val();
                datjson1.outlet_id_item = $('#outlet_id_item').val();
                datjson1.brand_id = brand_id;


                var layar = window.screen.availWidth;
                var table_item = $('#table_item').DataTable({
//                        "scrollX": true,
                    "bFilter": false,
                    "dom": 'Brt<"bottom"flp>',
//                    dom: 'Bfrtip',
                    buttons: [
                        {
                            attr: {
                                id: 'download_excel_item'
                            },
                            extend: 'excelHtml5',
                            text: '<i class="fa fa-download"></i>',
                            titleAttr: 'Excel'
                        }, {
                            attr: {
                                id: 'print_data_item'
                            },
                            extend: 'print',
                            text: '<i class="fa fa-print"></i>',
                            titleAttr: 'Print'
                        }
                    ],
                    "ajax": {
                        "dataSrc": "",
                        url: "irp",
                        type: 'post',
                        dataType: 'json',
                        data: function (d) {
                            return JSON.stringify(datjson1);
                        },
                        contentType: 'application/json',
                        mimeType: 'application/json'
                    },
                    "columns": [
                        {"data": "productname"},
                        {"data": "product_id"},
                        {"data": "category"},
                        {"data": "sell_price",
                            render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            }},
                        {"data": "quantity"},
                        {"data": "total",
                            render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            }},
                        {"data": "tax",
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
                    "order": [[0, 'asc']]
                });








//              appent button
                var bar_item = document.getElementById('bar_item');
                var download_excel_item = document.getElementById('download_excel_item');
                var print_data_item = document.getElementById('print_data_item');
                bar_item.appendChild(download_excel_item);
                bar_item.appendChild(print_data_item);
            }
        </script>
        <script>
            function run_summary() {
//                $('#ref_tabel_summary').load(document.URL + ' #ref_tabel_summary');
//                $("#download_excel_summary").remove();
//                $("#print_data_summary").remove();
//                setTimeout("getTrx_summary()", 500);
                getTrx_summary();
            }
            function getTrx_summary() {
                var datjson2 = new Object();
                datjson2.tanggal_summary_from = $('#tanggal_summary_from').val();
                datjson2.tanggal_summary_to = $('#tanggal_summary_to').val();
                datjson2.outlet_id_summary = $('#outlet_id_summary').val();
                datjson2.brand_id = brand_id;
                $.ajax({
                    url: "rep_sum",
                    type: 'post',
                    dataType: "json",
                    data: JSON.stringify(datjson2),
                    contentType: 'application/json',
                    mimeType: 'application/json',
                    success: function (response) {

                        if (response.resp_code == 0000) {

                            document.getElementById("opening_summary").innerHTML = masking_duit(response.opening_amount);
                            document.getElementById("closing_summary").innerHTML = masking_duit(response.closing_amount);

                            document.getElementById("total_sales_summary").innerHTML = masking_duit(response.total_sales);
                            document.getElementById("total_sales_summary_with_tax").innerHTML = masking_duit(response.total_sales_with_tax);
                            document.getElementById("number_of_transaction_summary").innerHTML = masking_duit(response.number_of_transaction);
                            document.getElementById("average_per_ticket_summary").innerHTML = masking_duit(response.average_per_ticket);
                            document.getElementById("number_of_item_sold_summary").innerHTML = masking_duit(response.number_of_item_sold);
                            document.getElementById("tax_summary").innerHTML = masking_duit(response.tax);
                            document.getElementById("cash_summary").innerHTML = masking_duit(response.cash);
                            document.getElementById("cashless_summary").innerHTML = masking_duit(response.cashless);
                        }
                    }
                });
            }
        </script>
        <script>
            function ExportExcel_sum(type, fn, dl) {
                var elt = document.getElementById('table_summary');
                var wb = XLSX.utils.table_to_book(elt, {sheet: "Sheet JS"});
                return dl ?
                        XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                        XLSX.writeFile(wb, fn || ('SheetJSTableExport.' + (type || 'xlsx')));
            }
            function printData_sum()
            {
                var divToPrint = document.getElementById("table_summary");
                newWin = window.open("");
                newWin.document.write(divToPrint.outerHTML);
                newWin.print();
                newWin.close();
            }
        </script>
        <script>
            $(document).ready(() => {
                let url = location.href.replace(/\/$/, "");

                if (location.hash) {
                    const hash = url.split("#");
                    $('#myTab a[href="#' + hash[1] + '"]').tab("show");
                    url = location.href.replace(/\/#/, "#");
                    history.replaceState(null, null, url);
                    setTimeout(() => {
                        $(window).scrollTop(0);
                    }, 400);
                }

                $('a[data-toggle="tab"]').on("click", function () {
                    let newUrl;
                    const hash = $(this).attr("href");
//                    if (hash == "#home") {
//                        newUrl = url.split("#")[0];
//                    } else {
                    newUrl = url.split("#")[0] + hash;
//                    }
                    newUrl += "/";
                    history.replaceState(null, null, newUrl);
                });
            });
        </script>
    </body>
</html>
