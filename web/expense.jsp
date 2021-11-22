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

            #table_expense th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }

            #table_expense2 th {
                background-color: #7ee2d3;
                color: black;
                font-weight: 100;
            }
            #table_expense2 tr {
                background-color: #efeff3;
            }
            .input-group-append{
                background-color: #f2f4f6;
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

            tr.odd.shown {
                color: white;
                background-color: #29B19C;
            }
            tr.even.shown {
                color: white;
                background-color: #29B19C;
            }
            #tanggal_expense_from{width: 200px; padding: 0px;}
            #tanggal_expense_to{width: 200px; padding: 0px;}
            #outlet_id_expense{width: 250px; padding: 0px; margin-left: 20px;}
            @media only screen and (max-width: 400px) {
                #tanggal_expense_from{width: 80px; padding: 0px;}
                #tanggal_expense_to{width: 80px; padding: 0px;}
                #outlet_id_expense{width: 100px; padding: 0px; margin-left: 10px;}
                #ref_tabel_expense{overflow-x: scroll}

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
                        $("select#outlet_id_expense").html(options);
                        getTrx_expense();
                    });
                } else {
                    var outlet_id = window.localStorage.getItem('outlet_store_id');
                    var outlet_name = window.localStorage.getItem('outlet_store_name');
                    var options = '<option value="' + brand_id + outlet_id + '">' + outlet_name + '</option>';
                    $("select#outlet_id_expense").html(options);
                    getTrx_expense();
                }



                $('#create_expense').on('click', function () {
                    $('.cd-popup-expense').addClass('is-visible');
                });
            });
            function getTrx_expense() {
                var datjson = new Object();
                datjson.tanggal_from = $('#tanggal_expense_from').val();
                datjson.tanggal_to = $('#tanggal_expense_to').val();
                datjson.outlet_id = $('#outlet_id_expense').val();
                datjson.brand_id = brand_id;
                var table = $('#table_expense').DataTable({
                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api(), data;

                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                    i.replace(/[\$,]/g, '') * 1 :
                                    typeof i === 'number' ?
                                    i : 0;
                        };

                        // Total over all pages
                        total = api
                                .column(6)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        // Total over this page
                        pageTotal = api
                                .column(6, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        // Update footer
                        $(api.column(6).footer()).html(
                                'Rp ' + masking_duit(pageTotal) + ' ( Rp ' + masking_duit(total) + ' All page)'
                                );
                    },
                    "bFilter": false,
                    "dom": 'Brt<"bottom"flp>',
                    buttons: [
                        {
                            attr: {
                                id: 'download_excel'
                            },
                            extend: 'excelHtml5',
//                            exportOptions: {columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]},
                            text: '<i class="fa fa-download"></i>',
                            titleAttr: 'Excel'
                        }, {
                            attr: {
                                id: 'print_data'
                            },
                            extend: 'print',
//                            exportOptions: {columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]},
                            text: '<i class="fa fa-print"></i>',
                            titleAttr: 'Print'
                        }
                    ],
                    "ajax": {
                        "url": "/ridapos_dashboard/exp_list?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [

                        {"data": "exp_id"},
                        {"data": "outlet_id"},
                        {"data": "exp_date"},
                        {"data": "receiver",
                            "visible": false,
                            "searchable": false},
                        {"data": "exp_category"},
                        {"data": "exp_desc",
                            "visible": false,
                            "searchable": false},
                        {"data": "amount",
                            render: function (data) {
                                var rx = /(\d+)(\d{3})/;
                                return String(data).replace(/^\d+/, function (w) {
                                    while (rx.test(w)) {
                                        w = w.replace(rx, '$1,$2');
                                    }
                                    return w;
                                });
                            }
                        }
                    ],
                    "order": [[2, 'desc']]
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
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div id="expense">
                                                        <div id="bar_expense" style="display: inline; color: #29B19C;">
                                                            <label id="add_item_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                Expense
                                                            </label>
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">from</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_expense_from" class="col-md-3" name="tanggal_expense_from" placeholder="Today">
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">to</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_expense_to" class="col-md-3" name="tanggal_expense_to" placeholder="Today">
                                                            <select id="outlet_id_expense" class="col-md-3" name="outlet_id_expense">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="run_expense()"></i>
                                                        </div>
                                                        <div class="container" id="ref_tabel_expense"> 
                                                            <label id="create_expense" style="cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Create Expense</label>
                                                            <table class="table" id="table_expense" style="font-size: 12px; width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Expense id</th>
                                                                        <th>Outlet id</th>
                                                                        <th>Date</th>
                                                                        <th>Receiver</th>
                                                                        <th>Category</th>
                                                                        <th>Description</th>
                                                                        <th>Amount</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th colspan="6" style="text-align:right;
                                                                            font-weight: bold;
                                                                            font-size: 14px">Total:</th>
                                                                        <th style="font-weight: bold;
                                                                            font-size: 14px;"></th>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                        <%@include file='pop_up_expense.jsp'%>
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
            function run_expense() {
                $('#table_expense').dataTable().fnClearTable();
                $('#table_expense').dataTable().fnDestroy();
                getTrx_expense();
            }
        </script>
    </body>
</html>
