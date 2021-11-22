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
            .card {
                background-color: white;
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
            #boxx_edit_stock{
                min-height: 680px;
                display: flex;
                align-content: center;
            }
            #box1_stock {
                cursor: pointer;
                width: 300px;
                /*height: 400px;*/
                align-content: center;
                text-align: center;
                margin-right: 5px;
                background-color: white;
                border-radius: 5px;
                margin-left: 20px;
            }
            #box1_content {
                width: 300px;
                /*height: 400px;*/
                /*background-color: green;*/
                display: inline-block;
            }
            #box2_stock {
                width: -webkit-fill-available;
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
            #buttonon_edit_stock {
                color: white;
                margin-top: 10px;
                display: flex;
                place-content: center;
            }
            #btn_cancel_edit_stock {
                cursor: pointer;
                width: 70px;
                height: 35px;
                background-color: #a7a0a0;
                border: 1px solid #c52d18;
                margin-right: 20px;
                border-radius: 3px;
                color: #c52d18;

            }
            #btn_save_edit_stock {
                cursor: pointer;
                width: 70px;
                height: 35px;

                background-color: #29B19C;
                border: 1px solid #CCC;
                margin-left: 8px;
                border-radius: 3px;
            }
            #btn_print_invoice {
                /*float: left;*/
                cursor: pointer;
                width: 120px;
                height: 35px;
                background-color: #0074f0;
                /*margin-right: 20px;*/
                border-radius: 3px;
                color: white;
                display: block;
                margin: auto;
            }
            #btn_print_invoice:hover {
                background-color: #c52d18;
                color: white;
            }
            #btn_receive {
                /*float: left;*/
                /*cursor: pointer;*/
                width: 120px;
                height: 35px;
                background-color: #29B19C;
                /*margin-right: 20px;*/
                border-radius: 3px;
                color: white;
                display: block;
                margin: auto;
            }
            #btn_return {
                /*float: left;*/
                /*cursor: pointer;*/
                width: 120px;
                height: 35px;
                background-color: red;
                /*margin-right: 20px;*/
                border-radius: 3px;
                color: white;
                display: block;
                margin: auto;
            }

            #btn_cancel_edit_stock:hover {
                background-color: #c52d18;
                color: white;
            }
            #btn_save_edit_stock:hover {
                background-color: #c52d18;
                color: white;
            }

            .selected {
                background-color: brown;
                color: #FFF;
            }



            @media only screen and (max-width: 400px) {
                #boxx_edit_stock {
                    min-height: 680px;
                    display: block;
                    justify-content: center; 
                }
                #box1_stock {
                    margin-left: 70px;
                }
                #box2_stock {
                    width: -webkit-fill-available;
                    margin-left: 5px;
                    border-radius: 5px;
                }
            }
        </style>
        <script>
            $(document).ready(function () {
                var table = $('#table_edit_receive_stock').DataTable({
                    "scrollX": true,
                    "scrollY": true,
                    data: ${det_re_stock},
                    "dataSrc": "",
                    "contentType": "application/json",
                    retrieve: true,
                    paging: false,
                    searching: false,
                    bInfo: false,
                    columns: [
                        {data: "date"},
                        {data: "supplier_name"},
                        {data: "id"},
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
                        {data: "status",
                            render: function (data) {
                                if (data == "") {
                                    return "";
                                } else if (data == "RECEIVE STOCK") {
                                    return '<input type="button" value="RECEIVE" id="btn_receive" disabled/>';
                                } else if (data == "RETURN STOCK") {
                                    return '<input type="button" value="RETURN" id="btn_return" disabled/>';
                                }
                            },
                        },
                        {data: "product_code",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "product_name",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "qty"
                                    //                            ,
                                    //                            "visible": false,
                                    //                            "searchable": false
                        },
                        {data: "price",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "pic",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "reason_return",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "supplier_email",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "supplier_address",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "supplier_phone",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "outlet_name",
                            "visible": false,
                            "searchable": true
                        },
                        {data: "pic_phone",
                            "visible": false,
                            "searchable": false
                        },
                        {data: "id",
                            render: function (data) {
                                if (data == "") {
                                    return "";
                                } else {
                                    return '<input type="button" value="Print" id="btn_print_invoice"/>';
                                }
                            },
                            "defaultContent": ""
                        }
                    ]
                });

                //open popup edit contact
                var table = $('#table_edit_receive_stock').DataTable();
                $('#table_edit_receive_stock tbody').on('click', 'td:nth-child(7)', function () {
                    document.getElementById("buyer_email").value = table.row(this).data().pic;
                    document.getElementById("buyer_phone").value = table.row(this).data().pic_phone;
                    document.getElementById("sup_name").value = table.row(this).data().supplier_name;
                    document.getElementById("sup_email").value = table.row(this).data().supplier_email;
                    document.getElementById("sup_phone").value = table.row(this).data().supplier_phone;
                    document.getElementById("sup_address").value = table.row(this).data().supplier_address;
                    document.getElementById("invoice_val").innerHTML = table.row(this).data().id;
                    document.getElementById("outlet_val").innerHTML = table.row(this).data().outlet_name;
                    document.getElementById("date_str").innerHTML = table.row(this).data().date;
                    document.getElementById("type_inv").innerHTML = table.row(this).data().status;
                    document.getElementById("prod_name").value = table.row(this).data().product_name;

                    //        document.getElementById("sales").innerHTML = masking_duit(total_sales);

                    document.getElementById("qty").value = masking_duit(table.row(this).data().qty);
                    document.getElementById("price").value = masking_duit(table.row(this).data().price);
                    document.getElementById("total_price").value = masking_duit(table.row(this).data().total_cost);


                    $('.cd-popup-edit-contact').addClass('is-visible');
                });

                //close popup edit contact
                $('.cd-popup-edit-contact').on('click', function (event) {
                    if ($(event.target).is('.cd-popup-edit-contact-close') || $(event.target).is('.cd-popup-edit-contact') || $(event.target).is('#btn_cancel')) {
                        event.preventDefault();
                        $(this).removeClass('is-visible');
                        //                $("#formho_pass")[0].reset();

                    }
                });
                //close popup when clicking the esc keyboard button edit contact
                $(document).keyup(function (event) {
                    if (event.which == '27') {
                        $('.cd-popup-edit-contact').removeClass('is-visible');
                    }
                });
            });
        </script> 
    </head>
    <body class="hold-transition sidebar-mini sidebar-collapse">
        <div class="wrapper">
            <!-- Navbar -->
            <%@include file='header.jsp'%>
            <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@include file='sidebar_left.jsp'%>
            <!--end sidebar-->
            <div class="content-wrapper">
                <label id="label_add_category"></label>
                <div id="boxx_edit_stock">
                    <div id="box1_stock">
                        <label id="label_add_category">Return PO</label>
                        <div id="box1_content">
                            <form action="del_sto" id="formho_ed_sto" method="post">
                                <div id="myModal_stock_edit" class="modal">
                                    <div class="modal-content">
                                        <span class="close_edit_stock">&times;</span>
                                        <div id="push_text_edit_stock"></div>
                                    </div>
                                </div>
                                <label style="font-size: 18px; font-weight: 500; margin-bottom: 0px; margin-top: 20px;">Input Quantity</label><br>
                                <input type="text" readonly="" placeholder="Product Name" style="width: 250px;" id="product_name_rs" name="product_name_rs" value="${return_productname}"><br>
                                <input type="number" max='${return_sisa}' min=0 placeholder="Qty" style="width: 90px; margin-left: 0px; float: left; margin-left: 25px" id="qty_rs" name="qty_rs">
                                <input type="number" readonly="" placeholder="Total" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="total_cost" name="total_cost">
                                <input type="text" readonly="" hidden="" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="return_sisa" name="return_sisa" value="${return_sisa}">
                                <input type="text" readonly="" hidden="" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="return_productcode" name="return_productcode" value="${return_productcode}">
                                <input type="text" readonly="" hidden="" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="return_supplierid" name="return_supplierid" value="${return_supplierid}">
                                <input type="text" readonly="" hidden="" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="return_id_receive" name="return_id_receive" value="${return_id_receive}">
                                <input type="text" readonly="" hidden="" style="width: 150px; margin-left: 0px; float: left; margin-left: 10px" id="outlet_id_edit_po" name="outlet_id_edit_po" value="${outlet_id_edit_po}">


                                <label style="font-size: 18px; font-weight: 500; margin-bottom: 0px; margin-top: 20px;">Reason for Return</label><br><br>
                                <div style="height: 30px; margin-top: -20px"><input type="checkbox" name="returned_items" id="returned_items" style="float: left; width: 30px; margin-left: 25px; margin-top: 8px;" value="Returned Items"><label style="float: left; margin-top: 2px; font-weight: 100">Returned Items</label></div><br>
                                <div style="height: 30px; margin-top: -20px"><input type="checkbox" name="accidental_charge" id="accidental_charge" style="float: left; width: 30px; margin-left: 25px; margin-top: 8px;" value="Accidental Charge"><label style="float: left; margin-top: 2px; font-weight: 100">Accidental Charge</label></div><br>
                                <div style="height: 30px; margin-top: -20px"><input type="checkbox" name="canceled_order" id="canceled_order" style="float: left; width: 30px; margin-left: 25px; margin-top: 8px;" value="Canceled Order"><label style="float: left; margin-top: 2px; font-weight: 100">Canceled Order</label></div><br>
                                <div style="height: 30px; margin-top: -20px"><input type="checkbox" name="fraudulent_charge" id="fraudulent_charge" style="float: left; width: 30px; margin-left: 25px; margin-top: 8px;" value="Fraudulent Charge"><label style="float: left; margin-top: 2px; font-weight: 100">Fraudulent Charge</label></div><br>
                                <div style="height: 30px; margin-top: -20px"><input type="checkbox" name="other" id="other" style="float: left; width: 30px; margin-left: 25px; margin-top: 8px;" value="other"><label style="float: left; margin-top: 2px; font-weight: 100">Other</label></div><br>
                            </form>
                            <script>
                                $(document).ready(function () {
                                    $('input:checkbox').click(function () {
                                        $('input:checkbox').not(this).prop('checked', false);
                                    });
                                });
                            </script>
                            <div id="buttonon_edit_stock">
                                <div id="btn_cancel_edit_stock"><a href="sto" style="color: white">Cancel</a></div>
                                <div id="btn_save_edit_stock" onclick="sub_save_stock()">Save</div>
                            </div>
                            <div id="msgbox"></div>
                        </div>
                    </div>
                    <div id="box2_stock">
                        <div class="container" id="ref_tabel_receive">
                            <div style="display: flex"><label id="label_add_category">History PO</label>
                                <!--<input type="button" value="Print Invoice" id="btn_print_invoice"/>-->
                            </div>
                            <table class="table" id="table_edit_receive_stock" style="width: 100%; font-size: 12px;">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Supplier Name</th>
                                        <th>Order Number</th>
                                        <th>Total Cost</th>
                                        <th>Trx Type</th>
                                        <th>Product code</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Pic</th>
                                        <th>Reason</th>
                                        <th>supplier email</th>
                                        <th>supplier address</th>
                                        <th>supplier phone</th>
                                        <th>outlet name</th>
                                        <th>pic phone</th>
                                        <th></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file='pop_up_print_po.jsp'%>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- Main Footer -->
            <%@include file='footer.jsp'%>
        </div>
    </body>
    <script>
        var user_id = window.localStorage.getItem('user_id');
        $('#qty_rs').change(function (event) {
            var sisa = ${return_sisa};
            var totalcost = ${return_sisauang};
            var harga = totalcost / sisa;
            var total_cost = document.getElementById('total_cost');
            var qty = document.getElementById('qty_rs').value;
            total_cost.value = harga * qty;
        });
        function sub_save_stock() {
            var qty_rs = document.getElementById("qty_rs").value;
            var return_reason = document.getElementsByName("reason").value;
            var total_cost1 = document.getElementById('total_cost').value;
            var modal = document.getElementById("myModal_stock_edit");
            var span = document.getElementsByClassName("close_edit_stock")[0];
            var push = document.getElementById("push_text_edit_stock");
            if (qty_rs == "") {
                push.innerHTML = "<p>Quantity must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                //                console.log
            } else if (qty_rs != "") {
                if (total_cost1 == "") {
                    push.innerHTML = "<p>Out Of Stock</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (total_cost1 != "") {
                    if (return_reason == "") {
                        push.innerHTML = "<p>Reason must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (return_reason != "") {

                        var returned_items = document.getElementById("returned_items").value;
                        var accidental_charge = document.getElementById("accidental_charge").value;
                        var canceled_order = document.getElementById("canceled_order").value;
                        var fraudulent_charge = document.getElementById("fraudulent_charge").value;
                        var other = document.getElementById("other").value;

                        var returned_items_c = document.getElementById("returned_items").checked;
                        var accidental_charge_c = document.getElementById("accidental_charge").checked;
                        var canceled_order_c = document.getElementById("canceled_order").checked;
                        var fraudulent_charge_c = document.getElementById("fraudulent_charge").checked;
                        var other_c = document.getElementById("other").checked;

                        var qty_rs = document.getElementById("qty_rs").value;
                        var product_name_rs = document.getElementById("product_name_rs").value;
                        var total_cost = document.getElementById("total_cost").value;
                        var return_sisa = document.getElementById("return_sisa").value;
                        var return_productcode = document.getElementById("return_productcode").value;
                        var return_supplierid = document.getElementById("return_supplierid").value;
                        var return_id_receive = document.getElementById("return_id_receive").value;
                        var outlet_id_edit_po = document.getElementById("outlet_id_edit_po").value;


                        var datjson = new Object();
                        datjson.user_id = user_id;
                        datjson.brand_id = brand_id;
                        datjson.outlet_id = outlet_id_edit_po;

                        datjson.qty_rs = qty_rs;
                        datjson.product_name_rs = product_name_rs;
                        datjson.total_cost = total_cost;
                        datjson.return_sisa = return_sisa;
                        datjson.return_productcode = return_productcode;
                        datjson.return_supplierid = return_supplierid;
                        datjson.return_id_receive = return_id_receive;

                        if (returned_items_c === true) {
                            datjson.return_reason = returned_items;
                        } else if (accidental_charge_c === true) {
                            datjson.return_reason = accidental_charge;
                        } else if (canceled_order_c === true) {
                            datjson.return_reason = canceled_order;
                        } else if (fraudulent_charge_c === true) {
                            datjson.return_reason = fraudulent_charge;
                        } else if (other_c === true) {
                            datjson.return_reason = other;
                        }
                        $.ajax(
                                {
                                    dataType: "json",
                                    url: "del_sto",
                                    type: 'post',
                                    data: JSON.stringify(datjson),
                                    success: function (response) {
                                        if (response.resp_code == 0000) {
                                            alert('Success return item ' + product_name_rs);
                                            window.location.href = "sto";
                                        } else {
                                            alert('failed return item ' + product_name_rs);
                                        }
                                    }
                                }
                        );

                    }
                }
            }
        }
        ;
    </script>
</html>
