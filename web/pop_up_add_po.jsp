<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-add-po
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-add-po {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-po {

        position: fixed;
        left: 0;
        top: 0;
        height: 100%;
        width: 100%;
        background-color: rgba(94, 110, 141, 0.9);
        opacity: 0;
        visibility: hidden;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
        transition: opacity 0.3s 0s, visibility 0s 0.3s;
    }
    .cd-popup-add-po.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-po-container {

        position: relative;
        /*width: 90%;*/
        height: 550px;
        max-width: 550px;
        margin: 4em auto;
        background: #FFF;
        border-radius: .25em .25em .4em .4em;
        text-align: center;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        -webkit-transform: translateY(-40px);
        -moz-transform: translateY(-40px);
        -ms-transform: translateY(-40px);
        -o-transform: translateY(-40px);
        transform: translateY(-40px);
        /* Force Hardware Acceleration in WebKit */
        -webkit-backface-visibility: hidden;
        -webkit-transition-property: -webkit-transform;
        -moz-transition-property: -moz-transform;
        transition-property: transform;
        -webkit-transition-duration: 0.3s;
        -moz-transition-duration: 0.3s;
        transition-duration: 0.3s;
    }

    .cd-popup-add-po-container .cd-buttons-add-po:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-po-container .cd-buttons-add-po li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-po-container .cd-buttons-add-po div {
        cursor: pointer;
        display: block;
        height: 60px;
        line-height: 60px;
        text-transform: uppercase;
        color: #FFF;
        -webkit-transition: background-color 0.2s;
        -moz-transition: background-color 0.2s;
        transition: background-color 0.2s;
    }
    .cd-popup-add-po-container .cd-buttons-add-po li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-po-container .cd-buttons-add-po li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-po-container .cd-buttons-add-po li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-po-container .cd-buttons-add-po li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-po-container .cd-buttons-add-po li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-po-container .cd-buttons-add-po li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-po-container .cd-popup-add-po-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-po-container .cd-popup-add-po-close::before, .cd-popup-add-po-container .cd-popup-add-po-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-po-container .cd-popup-add-po-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-po-container .cd-popup-add-po-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-po-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-po-container {
            margin: 8em auto;
        }
    }
    #label_add_discount {
        width: 100%;
        margin: 5px;
        text-align: left;
    }
    #boxx_add_discount{
        display: flex;
        justify-content: center;
        align-content: center;
    }


    input {
        padding-left: 10px;
        border: 1px solid #CCC; 
        border-radius: 3px;
        width: 100%;
        margin-bottom: 5px;
    }

    #box1_stock {
        width: 215px;
        height: auto;
        margin-left: 5px;
    }
    #box2_add_po {
        width: 300px;
        height: auto;
        margin-left: 5px;
        /*background-color: yellow;*/
        border-radius: 5px;
    }



    #table_item_add_po th {
        background-color: #ACACAC;
        color: white;
        font-weight: 100;
    }
    #table_item_add_po {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ddd;
        font-size: 12px;
    }
    #table_item_add_po th {
        text-align: left;
        /*padding: 12px;*/
    }
    #table_item_add_po td {
        text-align: left;
        /*padding: 12px;*/
        cursor: pointer;
        border: 1px #DDD solid; 
    }





    #buttonon_add_po {
        float: left;
        color: white;
        margin-top: 10px;
        display: flex;
    }
    #btn_cancel_add_po {
        cursor: pointer;
        width: 85px;
        height: 35px;
        background-color: #a7a0a0;
        border: 1px solid #c52d18;
        margin-right: 20px;
        border-radius: 3px;
        color: #c52d18;

    }
    #btn_save_add_po {
        cursor: pointer;
        width: 85px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        margin-left: 25px;
        border-radius: 3px;
    }

    #btn_cancel_add_po:hover {
        background-color: #c52d18;
        color: white;
    }
    #btn_save_add_po:hover {
        background-color: #c52d18;
        color: white;
    }
    #supplier_add_po{
        margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; width: 215px; height: 25px;
    }
    #outlet_id_add_po{
        width: 285px; margin-top: 17px; margin-bottom: 5px;
    }
    #category_id_add_po{
        width: 285px; margin-top: 17px; margin-bottom: 5px
    }

    @media only screen and (max-width: 400px) {
        #box1_stock {
            width: 210px;
            height: auto;
            margin-left: 5px;
            /*background-color: blue;*/
        }
        #box2_add_po {
            width: 210px;
            height: auto;
            margin-left: 5px;
            /*background-color: yellow;*/
            border-radius: 5px;
        }
        #supplier_add_po{
            margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; width: 210px; height: 25px;
        }
        #btn_save_add_po {
            cursor: pointer;
            width: 85px;
            height: 35px;
            background-color: #29B19C;
            border: 1px solid #CCC;
            margin-left: 20px;
            border-radius: 3px;
        }
        #outlet_id_add_po{
            width: 210px; margin-top: 17px; margin-bottom: 5px;
        }
        #category_id_add_po{
            width: 210px; margin-top: 17px; margin-bottom: 5px
        }
    }
</style>

<script>
    jQuery(document).ready(function ($) {
        $('#outlet_id_add_po').change(function (event) {
            var outlet_id = $("select#outlet_id_add_po").val();
            $.getJSON('opt?action=option_category', {brand_id: brand_id, outlet_id: outlet_id}, function (data) {
                var options = '<option selected disabled value="">Select Category</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                }
                $("select#category_id_add_po").html(options);
            });
        });

        $('#create_po_text').on('click', function (event) {
            event.preventDefault();
            $.getJSON('opt?action=option_supplier', {brand_id: brand_id}, function (data) {
                var options = '<option selected disabled value="">Select Supplier</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].supplier_id + '">' + data[i].supplier_name + '</option>';
                }
                $("select#supplier_add_po").html(options);
            });
            $('.cd-popup-add-po').addClass('is-visible');
        });
        //close popup provide password
        $('.cd-popup-add-po').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-po-close') || $(event.target).is('.cd-popup-add-po')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_po")[0].reset();
            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-po').removeClass('is-visible');
            }
        });

        $('#search_item_add_po').click(function (event) {
            var user_id = window.localStorage.getItem('user_id');
            var kategory_add_po = $("select#category_id_add_po").val();
            var outlet_id = document.getElementById("outlet_id_add_po").value;
            if (outlet_id === 'Select Outlet') {
                alert('choose outlet first');
            } else if (outlet_id !== 'Select Outlet') {
                if (kategory_add_po === null) {
                    alert('category must be choose');
                } else if (kategory_add_po !== null) {
                    $("#tbody_create_po").empty();
                    $.get('sto_item?action', {brand_id: brand_id, category: kategory_add_po, user_id: user_id, outlet_id: outlet_id},
                            function (response) {
                                //    generte table category  
                                if (response === 'keren') {
                                    var select = $('#table_item_add_po');
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

                                        $("#table_item_add_po tr").click(function () {
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
                                    let table7 = document.querySelector("#tbody_create_po");
                                    generateTable(table7, mountains7); // generate the table first
                                }
                            });
                }
            }
        });
    });
</script>

<div class="cd-popup-add-po" role="alert">
    <div class="cd-popup-add-po-container" style="color: #29B19C;">
        <label id="label_add_discount">Create PO</label>
        <div id="boxx_add_discount">
            <div id="box1_stock">
                <form id="form_add_po">
                    <div id="myModal_add_po" class="modal">
                        <div class="modal-content">
                            <span class="close_add_po">&times;</span>
                            <div id="push_text_add_po"></div>
                        </div>
                    </div>
                    <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px;">Product Name</label>
                    <input type="text" readonly="" placeholder="Product Name" id="product_name" name="product_name" style="background-color: aquamarine"><br>
                    <label style="margin-bottom: 0px; font-size: 10px; font-weight: 100; float: left;">Product Code</label>
                    <input type="text" readonly="" placeholder="Product Code" style="float: left; background-color: aquamarine" id="product_code" name="product_code"><br>
                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Quantity</label>
                    <input type="number" style="float: left;" id="quantity" name="quantity">

                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Price</label>
                    <input type="number" style="float: left;" id="price" name="price">

                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Total Cost</label>
                    <input type="number" style="float: left;" id="total_cost" name="total_cost" readonly="">
                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Supplier Name</label>
                    <select id="supplier_add_po" name="supplier_add_po">
                    </select>
                </form>
                <br>
                <div id="buttonon_add_po">
                    <div id="btn_cancel_add_po"><a href="sto" style="color: white">Cancel</a></div>
                    <div id="btn_save_add_po" onclick="sub_add_po()">Create</div>
                </div>
                <div id="msgbox"></div>
            </div>
            <div id="box2_add_po">
                <div id="bar_item" style="display: inline; color: #29B19C;">
                    <select id="outlet_id_add_po" name="outlet_id_add_po">
                    </select>
                    <select id="category_id_add_po" name="category_id_add_po">
                        <option>Select Category</option>
                    </select>
                    <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" id="search_item_add_po"></i>
                </div>
                <br>
                <div class="container" id="ref_tabel_item" style="height: 350px; overflow-y: auto; border: solid 1px;">        
                    <table class="table" id="table_item_add_po">
                        <thead>
                            <tr>
                                <th>productcode</th>
                                <th>productname</th>
                                <th>image</th>
                            </tr>
                        </thead>
                        <tbody id="tbody_create_po">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-po-close img-replace-add-po">Close</a>
    </div>
</div>
<script>
    $("input[id=price],input[id=quantity]").change(function (event) {
        var qty = document.getElementById("quantity").value;
        var price = document.getElementById("price").value;
        var total_cost = document.getElementById('total_cost');
        total_cost.value = price * qty;
    });
    function sub_add_po() {
        var user_id = window.localStorage.getItem('user_id');
        var product_name = document.getElementById("product_name").value;
        var product_code = document.getElementById("product_code").value;
        var quantity = document.getElementById("quantity").value;
        var price = document.getElementById("price").value;
        var total_cost = document.getElementById("total_cost").value;
        var supplier_id = document.getElementById("supplier_add_po").value;
        var outlet_id_add_po = document.getElementById("outlet_id_add_po").value;

        var modal = document.getElementById("myModal_add_po");
        var span = document.getElementsByClassName("close_add_po")[0];
        var push = document.getElementById("push_text_add_po");
        ;
        if (product_name == "") {
            push.innerHTML = "<p>product name must be fill</p>";
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
                push.innerHTML = "<p>product code must be fill</p>";
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
                    push.innerHTML = "<p>quantity must be fill</p>";
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
                        push.innerHTML = "<p>total cost must be fill</p>";
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
                        if (supplier_id == "") {
                            push.innerHTML = "<p>Supplier name must be choose</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (supplier_id != "") {
                            var datjson = new Object();
                            datjson.brand_id = brand_id;
                            datjson.outlet_id = outlet_id_add_po;
                            datjson.user_id = user_id;

                            datjson.product_name = product_name;
                            datjson.product_code = product_code;
                            datjson.quantity = quantity;
                            datjson.price = price;
                            datjson.total_cost = total_cost;
                            datjson.supplier_id = supplier_id;
                            $.ajax({
                                dataType: "json",
                                url: "cr_sto",
                                data: JSON.stringify(datjson),
                                type: 'post',
                                success: function (response) {
                                    if (response.resp_code == 0000) {
                                        alert('success create PO');
                                        getpo();
                                        $("#form_add_po")[0].reset();
                                        var options = '<option selected="true" disabled>Select Category</option>';
                                        $("select#category_id_add_po").html(options);
                                        var Parent = document.getElementById('tbody_create_po');
                                        while (Parent.hasChildNodes())
                                        {
                                            Parent.removeChild(Parent.firstChild);
                                        }



                                        $('.cd-popup-add-po').removeClass('is-visible');
                                    } else {
                                        alert('failed create PO');
                                    }
                                }
                            });
                        }
                    }
                }
            }
        }
    }
</script>