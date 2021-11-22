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

            img {
                height: 60px; 
                width: 60px; 
                border-radius: 5px;
            }
            th {
                background-color: #CCC;
            }













            #label_add_category {
                width: 100%;
                margin: 20px;
                text-align: left;
            }
            #boxx_stock{
                display: flex;
                justify-content: center;
                align-content: center;
            }
            #box1_stock {
                cursor: pointer;
                width: 500px;
                /*height: 400px;*/
                align-content: center;
                text-align: center;
                margin-right: 5px;
                background-color: white;
                border-radius: 5px;
            }
            #box1_content {
                width: 300px;
                /*height: 400px;*/
                /*background-color: green;*/
                display: inline-block;
            }
            #box2_discount {
                width: 500px;
                /*height: auto;*/
                margin-left: 5px;
                /*background-color: yellow;*/
                border-radius: 5px;

            }
            input {
                padding-left: 10px;
                border: 1px solid #CCC; 
                border-radius: 3px;
                width: 100%;
                margin-bottom: 5px;
            }
            textarea {
                padding-left: 10px;
                border-radius: 3px;
                width: 100%;
                margin-top: 10px;
                height: 115px;
            }
            #buttonon_create_stock {
                color: white;
                margin-top: 10px;
                display: flex;
            }
            #btn_cancel_create_stock {
                cursor: pointer;
                width: 135px;
                height: 35px;
                background-color: #a7a0a0;
                border: 1px solid #c52d18;
                margin-right: 20px;
                border-radius: 3px;
                color: #c52d18;

            }
            #btn_save_create_stock {
                cursor: pointer;
                width: 135px;
                height: 35px;
                background-color: #29B19C;
                border: 1px solid #CCC;
                margin-left: 8px;
                border-radius: 3px;
            }

            #btn_cancel_create_stock:hover {
                background-color: #c52d18;
                color: white;
            }
            #btn_save_create_stock:hover {
                background-color: #c52d18;
                color: white;
            }

            #table_item_receiver_stock th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_item_receiver_stock {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            #table_item_receiver_stock th {
                text-align: left;
                padding: 12px;
            }
            #table_item_receiver_stock td {
                text-align: left;
                padding: 12px;
                cursor: pointer;
                border: 1px #DDD solid; 
            }


            #table_outlet_create_discount th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_outlet_create_discount {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            #table_outlet_create_discount th {
                text-align: left;
                padding: 12px;
            }
            #table_outlet_create_discount td {
                text-align: left;
                padding: 12px;
                cursor: pointer;
                border: 1px #DDD solid; 
            }

            .selected {
                background-color: brown;
                color: #FFF;
            }

            #table_item_receiver_stock tr {
                border-bottom: 1px solid #ddd;
            }

            #table_outlet_create_discount tr {
                border-bottom: 1px solid #ddd;
            }
        </style>
        <script>
            jQuery(document).ready(function ($) {
                //select category
                $.getJSON('opt?action=option_category', {}, function (data) {
                    var options = '<option value="">Select Category</option>';
                    for (var i = 0; i < data.length; i++) {
                        options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                    }
                    $("select#kategory_receive_stock").html(options);
                });
                //select item
                $('#kategory_receive_stock').change(function (event) {
                    $("#tbody_id").empty();
                    var kategory_receive_stock = $("select#kategory_receive_stock").val();
                    $.get('sto_item?action=' + kategory_receive_stock, {
                    }, function (response) {
                        //    generte table category  
                        if (response === 'keren') {
                            var select = $('#table_item_receiver_stock');
                            select.find('td').remove();
                        } else {
                            let mountains7 = response;
                            function generateTable(table7, data) {
                                for (let element of data) {
                                    let row = table7.insertRow();
                                    var i = 0;
                                    for (key in element) {
                                        if (i == 2) {
                                            let cell = row.insertCell();
                                            let text = document.createElement("img");
                                            text.src = element[key];
                                            cell.appendChild(text);
                                        } else {
                                            let cell = row.insertCell();
                                            let text = document.createTextNode(element[key]);
                                            cell.appendChild(text);
                                        }
                                        i++;
                                    }
                                }
                                $("#table_item_receiver_stock tr").click(function () {
                                    if ($(this).hasClass('selected')) {
                                        var value = $(this).find('td:first').html();
                                        var value1 = $(this).find('td:eq(1)').html();
                                        $("#product_code").val(value);
                                        $("#product_name").val(value1);
                                        $(this).removeClass("selected");
                                    } else {
                                        $(this).toggleClass('selected');
                                        var value = $(this).find('td:first').html();
                                        var value1 = $(this).find('td:eq(1)').html();
                                        $("#product_code").val(value);
                                        $("#product_name").val(value1);
                                        $(this).removeClass("selected");

                                    }

                                });
                            }
                            let table7 = document.querySelector("#tbody_id");
                            generateTable(table7, mountains7); // generate the table first
                        }
                    });
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
                <label id="label_add_category">Receive Stock</label>
                <div id="boxx_stock">
                    <div id="box1_stock">
                        <div id="box1_content">
                            <form action="cr_sto" id="formho_cr_sto" method="post">
                                <div id="myModal_stock_create" class="modal">
                                    <div class="modal-content">
                                        <span class="close_create_stock">&times;</span>
                                        <div id="push_text_create_stock"></div>
                                    </div>
                                </div>
                                <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px;">Product Name</label>
                                <input type="text" readonly="" placeholder="Product Name" style="width: 300px;" id="product_name" name="product_name"><br>
                                <label style="margin-bottom: 0px; font-size: 10px; font-weight: 100; float: left;">Product Code</label>
                                <input type="text" readonly="" placeholder="Product Code" style="width: 300px; float: left;" id="product_code" name="product_code"><br>
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Quantity</label>
                                <input type="number" style="width: 300px; float: left; margin-right: 200px;" id="quantity" name="quantity">
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Total Cost</label>
                                <input type="number" style="width: 300px; float: left; margin-right: 200px;" id="total_cost" name="total_cost">
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Supplier Name</label>
                                <input type="text" id="supplier_name" name="supplier_name" style="width: 300px" placeholder="Supplier Name">
                            </form>
                            <br><br><br>
                            <div id="buttonon_create_stock">
                                <div id="btn_cancel_create_stock"><a href="sto" style="color: white">Cancel</a></div>
                                <div id="btn_save_create_stock" onclick="sub_create_stock()">Create</div>
                            </div>
                            <div id="msgbox"></div>
                        </div>
                    </div>
                    <div id="box2_discount">
                        <div id="bar_item" style="display: inline; color: #29B19C;">
                            <select id="kategory_receive_stock" style="width: 200px; padding: 0px; margin-left: 10px; margin-top: 10px;" name="kategory_receive_stock">
                            </select>
                        </div>
                        <br><br>
                        <div class="container" id="ref_tabel_item" style="height: 450px; overflow-y: auto;">        
                            <table class="table" id="table_item_receiver_stock">
                                <thead>
                                    <tr>
                                        <th>productcode</th>
                                        <th>productname</th>
                                        <th>image</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_id">
                                </tbody>
                            </table>
                        </div>
                    </div>
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
        function sub_create_stock() {
            var product_name = document.getElementById("product_name").value;
            var product_code = document.getElementById("product_code").value;
            var quantity = document.getElementById("quantity").value;
            var total_cost = document.getElementById("total_cost").value;
            var supplier_name = document.getElementById("supplier_name").value;

            var modal = document.getElementById("myModal_stock_create");
            var span = document.getElementsByClassName("close_create_stock")[0];
            var push = document.getElementById("push_text_create_stock");
            ;
            if (product_name == "") {
                push.innerHTML = "<p>Discount name must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (product_name != "") {
                if (product_code == "") {
                    push.innerHTML = "<p>Discount value must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (product_code != "") {
                    if (quantity == "") {
                        push.innerHTML = "<p>Date from must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (quantity != "") {
                        if (total_cost == "") {
                            push.innerHTML = "<p>Date to must be choose</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (total_cost != "") {
                            if (supplier_name == "") {
                                push.innerHTML = "<p>Outlet must be choose</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            } else if (supplier_name != "") {
                                var form_sto = document.getElementById('formho_cr_sto');
                                form_sto.submit();
                            }
                        }
                    }
                }
            }
        }
    </script>
</html>
