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
            #account_body {
                /*background-color: blue;*/
                height: 300px;
                display: flex;
                color: #29B19C;
            }

            #account_right {
                margin: 10px;
                /*background-color: yellow;*/
                height: 280px;
                width: 600px;
                /*display: flex;*/
            }
            #account_biodata {
                margin-top: 10px;
                /*background-color: purple;*/
                height: 120px;
                width: 600px;
                /*display: flex;*/
            }

            #brand_id{
                position: relative; left: 38px; height: 20px; width: 300px; border:  1px solid #ACACAC; border-radius: 3px;
            }
            #brand_name{
                position: relative; left: 10px; height: 20px; width: 300px; border: 1px solid #ACACAC; border-radius: 3px;
            }
            #edit_brand_name{
                float: right; right: 170px; position: relative; cursor: pointer;
            }
            #add_outlet{
                cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400;
            }
            .card-body{
                min-height: 705px;
            }


            /*----------------------------------------------------------------*/


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
                #account_body {
                    height: 300px;
                    display: flex;
                    color: #29B19C;
                }

                #account_right {
                    margin: 10px;
                    height: 280px;
                    width: -webkit-fill-available;
                }
                #account_biodata {
                    margin-top: 10px;
                    height: 120px;
                    width: -webkit-fill-available;
                }

                #brand_id{
                    position: relative; left: 38px; height: 20px; width: 200px; border:  1px solid #ACACAC; border-radius: 3px;
                }
                #brand_name{
                    position: relative; left: 10px; height: 20px; width: 200px; border: 1px solid #ACACAC; border-radius: 3px;
                }
                #edit_brand_name{
                    float: right; right: 10px; position: relative; cursor: pointer;
                }
                #add_outlet{
                    cursor: pointer; padding: 10px; color: #29b19c; font-weight: 400;
                }
                .card-body{
                    min-height: 620px;
                }
                #table_oke{
                    font-size: 12px;
                    width: -webkit-fill-available;
                }
            }
        </style>

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
                                                        Merchant
                                                    </p>
                                                </div>
                                            </div>
                                            <div id="pushtext2">
                                            </div>
                                            <div class="row">
                                                <div class="tab-content" style="width: 100%">
                                                    <div class="container" id="ref_tabel_item">    
                                                        <label id="add_outlet"><i class="icon fa fa-plus-circle" style="margin-right: 10px"></i>Add outlet</label>
                                                    </div>
                                                    <br>
                                                    <table class="table" id="table_oke">
                                                        <tr style="background-color: #CCC">
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Type</th>
                                                            <th>Level</th>
                                                            <th>Create Date</th>
                                                            <th>Tax</th>
                                                        </tr>
                                                    </table>
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
            $(document).ready(function () {
                var userlevel = window.localStorage.getItem('userlevel');
                if (userlevel !== 'administrator') {
                    window.location.href = "ho";
                }
                if (userlevel !== 'owner') {
                    $('label#edit_brand_name').remove();
                    $('label#add_outlet').remove();
                    $('#btn_delete_edit_outlet').remove();

                }
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.userlevel = userlevel;
                datjson.outlet_id = window.localStorage.getItem('outlet_store_id');


                $.ajax({
                    contentType: 'application/json',
                    dataType: "json",
                    url: "busi?data=" + JSON.stringify(datjson),
                    type: 'get',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            var id = response.brand_id;
                            var name = response.brand_name;
                            document.getElementById('brand_id').value = id;
                            document.getElementById('brand_name').value = name;

                            var obj = JSON.parse(response.listoutlet);
                            let mountains = obj;
                            function generateTable(table, data) {
                                for (let element of data) {
                                    let row = table.insertRow();
                                    var i = 0;
                                    for (key in element) {
                                        if (i == 0) {
                                            let cell = row.insertCell();
                                            let text = document.createTextNode(element [key]);
                                            cell.id = "outlet_id";
                                            cell.style.cursor = "pointer";
                                            cell.appendChild(text);
                                        } else if (i == 1) {
                                            let cell = row.insertCell();
                                            let text = document.createTextNode(element[key]);
                                            cell.id = "outlet_name";
                                            cell.style.cursor = "pointer";
                                            cell.appendChild(text);
                                        } else if (i == 2) {
                                            let cell = row.insertCell();
                                            let text = document.createTextNode(element[key]);
                                            cell.id = "outlet_address";
                                            cell.style.cursor = "pointer";
                                            cell.appendChild(text);
                                        }
                                        i++;
                                    }
                                }
                            }
                            let table = document.querySelector("#table_oke");
                            generateTable(table, mountains); // generate the table first
                        } else {
                            alert('failed retrieve data');
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



//            $(document).ready(() => {
//                let url = location.href.replace(/\/$/, "");
//
//                if (location.hash) {
//                    const hash = url.split("#");
//                    $('#myTab a[href="#' + hash[1] + '"]').tab("show");
//                    url = location.href.replace(/\/#/, "#");
//                    history.replaceState(null, null, url);
//                    setTimeout(() => {
//                        $(window).scrollTop(0);
//                    }, 400);
//                }
//
//                $('a[data-toggle="tab"]').on("click", function () {
//                    let newUrl;
//                    const hash = $(this).attr("href");
//                    if (hash == "#home") {
//                        newUrl = url.split("#")[0];
//                    } else {
//                        newUrl = url.split("#")[0] + hash;
//                    }
//                    newUrl += "/";
//                    history.replaceState(null, null, newUrl);
//                });
//            });
        </script>
    </body>
</html>
