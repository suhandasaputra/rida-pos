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



            #table_jurnal th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }

            #table_jurnal2 th {
                background-color: #7ee2d3;
                color: black;
                font-weight: 100;
            }
            #table_jurnal2 tr {
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
            #tanggal_jurnal_from{width: 200px; padding: 0px;}
            #tanggal_jurnal_to{width: 200px; padding: 0px;}
            #outlet_id_jurnal{width: 250px; padding: 0px; margin-left: 20px;}
            @media only screen and (max-width: 400px) {
                #tanggal_jurnal_from{width: 80px; padding: 0px;}
                #tanggal_jurnal_to{width: 80px; padding: 0px;}
                #outlet_id_jurnal{width: 100px; padding: 0px; margin-left: 10px;}
                #ref_tabel_jurnal{overflow-x: scroll}

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
                        $("select#outlet_id_jurnal").html(options);
                        getTrx_jurnal();
                    });
                } else {
                    var outlet_id = window.localStorage.getItem('outlet_store_id');
                    var outlet_name = window.localStorage.getItem('outlet_store_name');
                    var options = '<option value="' + brand_id + outlet_id + '">' + outlet_name + '</option>';
                    $("select#outlet_id_jurnal").html(options);
                    getTrx_jurnal();
                }
            });
            function getTrx_jurnal() {
                var datjson = new Object();
                datjson.tanggal_from = $('#tanggal_jurnal_from').val();
                datjson.tanggal_to = $('#tanggal_jurnal_to').val();
                datjson.outlet_id = $('#outlet_id_jurnal').val();
                datjson.brand_id = brand_id;
                var table = $('#table_jurnal').DataTable({
//                    "footerCallback": function (row, data, start, end, display) {
//                        var api = this.api(), data;
//
//                        // Remove the formatting to get integer data for summation
//                        var intVal = function (i) {
//                            return typeof i === 'string' ?
//                                    i.replace(/[\$,]/g, '') * 1 :
//                                    typeof i === 'number' ?
//                                    i : 0;
//                        };
//
//                        // Total over all pages
//                        total = api
//                                .column(3)
//                                .data()
//                                .reduce(function (a, b) {
//                                    return intVal(a) + intVal(b);
//                                }, 0);
//
//                        // Total over this page
//                        pageTotal = api
//                                .column(3, {page: 'current'})
//                                .data()
//                                .reduce(function (a, b) {
//                                    return intVal(a) + intVal(b);
//                                }, 0);
//
//                        // Update footer
//                        $(api.column(3).footer()).html(
//                                'Rp ' + pageTotal + ' ( Rp ' + total + ' All page)'
//                                );
//                    },
                    "bFilter": false,
                    "dom": 'Brt<"bottom"flp>',
                    buttons: [
                        {
                            attr: {
                                id: 'download_excel'
                            },
                            extend: 'excelHtml5',
                            text: '<i class="fa fa-download"></i>',
                            titleAttr: 'Excel'
                        }, {
                            attr: {
                                id: 'print_data'
                            },
                            extend: 'print',
                            text: '<i class="fa fa-print"></i>',
                            titleAttr: 'Print'
                        }
                    ],
                    "ajax": {
                        "url": "/ridapos_dashboard/jur_list?data=" + JSON.stringify(datjson),
                        "type": "GET",
                        "dataSrc": "",
                        "contentType": "application/json"
                    },
                    "columns": [

                        {"data": "noresi",
                            "className": 'jurnals-noresi'
                        },
                        {"data": "outlet_id",
                            "className": 'jurnals-outlet'
                        },
                        {"data": "dt_internal",
                            "className": 'jurnals-date'
                        },
                        {"data": "type",
                            "className": 'jurnals-type'
                        },
                        {"data": "prev_bal",
                            "className": 'jurnals-prev_bal',
                            render: function (data) {
                                return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        },

                        {"data": "amount",
                            "className": 'jurnals-total',
                            render: function (data) {
                                return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        }
                        ,

                        {"data": "curr_bal",
                            "className": 'jurnals-curr_bal',
                            render: function (data) {
                                return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        },
                        {"data": "status",
                            "className": 'jurnals-status',
                            render: function (data, type, row) {
                                var color = '';
                                var color_txt = '';
                                if (data === 'C') {
                                    color = '#6ec16e';
                                    color_txt = 'white';
                                    return '<input type="button" class="btn btn-primary" style="background-color:' + color + ';color:' + color_txt + '" value="' + data + '">';
                                }
                                if (data === 'D') {
                                    color = '#d44a4a';
                                    color_txt = 'white';
                                    return '<input type="button" class="btn btn-primary" style="background-color:' + color + ';color:' + color_txt + '" value="' + data + '">';
                                }
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
                                                    <div id="jurnal">
                                                        <div id="bar_jurnal" style="display: inline; color: #29B19C;">
                                                            <label id="add_item_text" style="margin: 20px;
                                                                   font-weight: 100;
                                                                   color: #29B19C; 
                                                                   cursor: pointer;">
                                                                Jurnal
                                                            </label>
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">from</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_jurnal_from" class="col-md-3" name="tanggal_jurnal_from" placeholder="Today">
                                                            <label style="font-weight: 100; color: black; margin-left: 5px">to</label>
                                                            <input type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="tanggal_jurnal_to" class="col-md-3" name="tanggal_jurnal_to" placeholder="Today">
                                                            <select id="outlet_id_jurnal" class="col-md-3" name="outlet_id_jurnal">
                                                            </select>
                                                            <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" onclick="run_jurnal()"></i>
                                                        </div>
                                                        <div class="container" id="ref_tabel_jurnal">        
                                                            <table class="table" id="table_jurnal" style="font-size: 12px; width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Receipt number</th>
                                                                        <th>Outlet Id</th>
                                                                        <th>Date</th>
                                                                        <th>Type</th>
                                                                        <th>Previous</th>
                                                                        <th>Amount</th>
                                                                        <th>Current</th>
                                                                        <th>Status</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <!--                                                                <tfoot>
                                                                                                                                    <tr>
                                                                                                                                        <th colspan="3" style="text-align:right">Total:</th>
                                                                                                                                        <th></th>
                                                                                                                                    </tr>
                                                                                                                                </tfoot>-->
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
        <script>
            function run_jurnal() {
                $('#table_jurnal').dataTable().fnClearTable();
                $('#table_jurnal').dataTable().fnDestroy();
                getTrx_jurnal();
            }
        </script>
    </body>
</html>
