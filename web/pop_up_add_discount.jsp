<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-add-discount
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-add-discount {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-discount {

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
    .cd-popup-add-discount.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-discount-container {

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

    .cd-popup-add-discount-container .cd-buttons-add-discount:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-discount-container .cd-buttons-add-discount li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-discount-container .cd-buttons-add-discount div {
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
    .cd-popup-add-discount-container .cd-buttons-add-discount li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-discount-container .cd-buttons-add-discount li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-discount-container .cd-buttons-add-discount li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-discount-container .cd-buttons-add-discount li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-discount-container .cd-buttons-add-discount li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-discount-container .cd-buttons-add-discount li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-discount-container .cd-popup-add-discount-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-discount-container .cd-popup-add-discount-close::before, .cd-popup-add-discount-container .cd-popup-add-discount-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-discount-container .cd-popup-add-discount-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-discount-container .cd-popup-add-discount-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-discount-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-discount-container {
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

    #box2_add_discount {
        width: 215px;
        height: auto;
        margin-left: 5px;
        /*background-color: yellow;*/
    }
    input {
        padding-left: 10px;
        border: 1px solid #CCC; 
        border-radius: 3px;
        width: 100%;
        margin-bottom: 5px;
    }











    /* The Close Button */
    .close_add_discount {
        padding-top: -10px;
        color: black;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_add_discount:hover,
    .close_add_discount:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }







    #box3_add_discount {
        width: 300px;
        height: auto;
        margin-left: 5px;
        margin-right: 5px;
        /*background-color: green;*/
    }

    textarea {
        border-radius: 3px;
        width: 100%;
        height: 70px;
    }







    #table_item_add_discount th {
        background-color: #ACACAC;
        color: white;
        font-weight: 100;
    }
    #table_item_add_discount {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ddd;
        font-size: 12px;
    }
    #table_item_add_discount th {
        text-align: left;
        padding: 12px;
    }
    #table_item_add_discount td {
        text-align: left;
        padding: 12px;
        cursor: pointer;
        border: 1px #DDD solid; 
    }

    #buttonon_create_discount {
        color: white;
        margin-top: 10px;
        display: flex;
    }
    #btn_cancel_create_discount {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #a7a0a0;
        border: 1px solid #c52d18;
        margin-right: 20px;
        border-radius: 3px;
        color: #c52d18;

    }
    #btn_save_create_discount {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_cancel_create_discount:hover {
        background-color: #c52d18;
        color: white;
    }
    #btn_save_create_discount:hover {
        background-color: #c52d18;
        color: white;
    }
    #outlet_id_add_discount{width: 285px; margin-top: 17px; margin-bottom: 5px;}
    #kategory_create_discount{width: 285px; margin-top: 17px; margin-bottom: 10px;}

    @media only screen and (max-width: 400px) {
        #box2_add_discount {
            /*background-color: yellow;*/
            width: 210px;
            height: auto;
            margin-left: 5px;
        }
        #box3_add_discount {
            /*background-color: red;*/
            width: 210px;
            height: auto;
            margin-left: 5px;
            margin-right: 5px;
        }
        #outlet_id_add_discount{width: 210px; margin-top: 17px; margin-bottom: 5px;}
        #kategory_create_discount{width: 210px; margin-top: 17px; margin-bottom: 10px;}
    }
</style>

<script>
    jQuery(document).ready(function ($) {
        $('#create_discount_text').on('click', function (event) {
            event.preventDefault();
            $.getJSON('opt?action=option_outlet', {brand_id: brand_id}, function (data) {
                var options = '<option selected="true" disabled value="">Select Outlet</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].outlet_id + '">' + data[i].outlet_name + '</option>';
                }
                $("select#outlet_id_add_discount").html(options);
            });


            $('#outlet_id_add_discount').change(function (event) {
                var outlet_id = $("select#outlet_id_add_discount").val();
                $.getJSON('opt?action=option_category', {brand_id: brand_id, outlet_id: outlet_id}, function (data) {
                    var options = '<option selected="true" disabled value="">Select Category</option>';
                    for (var i = 0; i < data.length; i++) {
                        options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                    }
                    $("select#kategory_create_discount").html(options);
                });
            });


            $('.cd-popup-add-discount').addClass('is-visible');
            var modal = document.getElementById("myModal_discount_add");
            var span = document.getElementsByClassName("close_add_discount")[0];
            var push = document.getElementById("push_text_add_discount");

//            push.innerHTML = "<p>Select Item First</p>";
//            modal.style.display = "block";
//            span.onclick = function () {
//                modal.style.display = "none";
//            };

        });
        //close popup provide password
        $('.cd-popup-add-discount').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-discount-close') || $(event.target).is('.cd-popup-add-discount')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_discount")[0].reset();
                $('#tbody_create_discount').empty();
                var options = '<option selected="true" disabled value="">Select Category</option>';
                $("select#kategory_create_discount").html(options);

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-discount').removeClass('is-visible');
            }
        });

        $('#search_item_discount').click(function (event) {
            var user_id = window.localStorage.getItem('user_id');
            var kategory_create_discount = $("select#kategory_create_discount").val();
            var outlet_id = document.getElementById("outlet_id_add_discount").value;
            if (outlet_id === 'Select Outlet') {
                alert('choose outlet first');
            } else if (outlet_id !== 'Select Outlet') {
                if (kategory_create_discount === null) {
                    alert('category must be choose');
                } else if (kategory_create_discount !== null) {
                    $("#tbody_create_discount").empty();
                    $.get('dis_item?action', {brand_id: brand_id, category: kategory_create_discount, user_id: user_id, outlet_id: outlet_id},
                            function (response) {
                                //    generte table category  
                                if (response === 'keren') {
                                    var select = $('#table_item_add_discount');
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
                                        $("#table_item_add_discount tr").click(function () {
                                            if ($(this).hasClass('selected')) {
                                                var value = $(this).find('td:first').html();
                                                $("#add_discount_keterangan").val(function (i, val) {
                                                    var ap = val.split("|");
                                                    val = "";
                                                    for (i = 0; i < ap.length; i++)
                                                    {
                                                        if (ap[i] == value)
                                                        {
                                                            ap[i] = "";
                                                        }
                                                        if (ap[i] != "") {
                                                            if (val != "") {
                                                                val += '|' + ap[i];
                                                            } else {
                                                                val = ap[i];
                                                            }
                                                        }
                                                    }
                                                    return val;
                                                });
                                                $(this).removeClass("selected");
                                            } else {
                                                $(this).toggleClass('selected');
                                                var value = $(this).find('td:first').html();
                                                $("#add_discount_keterangan").val(function (i, val) {
                                                    if (val != "") {
                                                        return val += '|' + value;
                                                    } else {
                                                        return val += value;
                                                    }
                                                });
                                            }
                                        });
                                    }
                                    let table7 = document.querySelector("#tbody_create_discount");
                                    generateTable(table7, mountains7); // generate the table first
                                }
                            });
                }
            }
        });


    });




</script>

<div class="cd-popup-add-discount" role="alert">
    <div class="cd-popup-add-discount-container" style="color: #29B19C;">
        <label id="label_add_discount">Add Discount</label>
        <div id="boxx_add_discount">
            <div id="box2_add_discount">
                <form id="form_add_discount">
                    <div id="myModal_discount_add" class="modal">
                        <div class="modal-content">
                            <span class="close_add_discount">&times;</span>
                            <div id="push_text_add_discount"></div>
                        </div>
                    </div>
                    <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px;">Discount Name</label>
                    <input type="text" placeholder="Discount Name" id="add_discount_name" name="add_discount_name"><br>
                    <label style="margin-bottom: 0px; font-size: 10px; font-weight: 100; float: left;">Value</label>
                    <input type="number" placeholder="Value %" style="float: left;" id="add_discount_value" name="add_discount_value"><br>
                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">From</label>
                    <input type="date" style="float: left;" id="add_discount_date_from" name="add_discount_date_from">
                    <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">To</label>
                    <input type="date" style="float: left;" id="add_discount_date_to" name="add_discount_date_to">
                    <label style="font-size: 10px; float: left; font-weight: 100">Item</label>
                    <textarea id="add_discount_keterangan" name="add_discount_keterangan" readonly="" style="background-color: aquamarine; margin-top: -10px;"></textarea>
                    <input readonly="" hidden="" type="text" placeholder="Discount Id" id="add_discount_id" name="add_discount_id"><br>
                </form>
                <div id="buttonon_create_discount">
                    <div id="btn_cancel_create_discount"><a href="dis" style="color: white">Cancel</a></div>
                    <div id="btn_save_create_discount" onclick="sub_create_discount()">Create</div>
                </div>
                <div id="msgbox"></div>
            </div>
            <div id="box3_add_discount">
                <div id="bar_item" style="display: inline; color: #29B19C;">
                    <select id="outlet_id_add_discount" name="outlet_id_add_discount">
                    </select>
                    <select id="kategory_create_discount" name="kategory_create_discount">
                        <option selected disabled value="">Select Category</option>
                    </select>
                    <i class="icon fa fa-search" style="margin-left: 10px; margin-right: 20px; cursor: pointer" id="search_item_discount"></i>
                </div>
                <br>
                <div class="container" id="ref_tabel_item" style="height: 350px; overflow-y: auto; border: solid 1px;">        
                    <table class="table" id="table_item_add_discount">
                        <thead>
                            <tr>
                                <th>productcode</th>
                                <th>productname</th>
                                <th>image</th>
                            </tr>
                        </thead>
                        <tbody id="tbody_create_discount">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-discount-close img-replace-add-discount">Close</a>
    </div>
</div>
<script>
    function sub_create_discount() {
        var user_id = window.localStorage.getItem('user_id');
        var discount_name = document.getElementById("add_discount_name").value;
        var discount_value = document.getElementById("add_discount_value").value;
        var discount_date_from = document.getElementById("add_discount_date_from").value;
        var discount_date_to = document.getElementById("add_discount_date_to").value;
        var outlet_id_create_discount = document.getElementById("outlet_id_add_discount").value;
        var kategory_create_discount = document.getElementById("kategory_create_discount").value;
        var discount_keterangan = document.getElementById("add_discount_keterangan").value;
        var modal = document.getElementById("myModal_discount_add");
        var span = document.getElementsByClassName("close_add_discount")[0];
        var push = document.getElementById("push_text_add_discount");
        ;
        if (discount_name == "") {
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
        } else if (discount_name != "") {
            if (discount_value == "") {
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
            } else if (discount_value != "") {
                if (discount_date_from == "") {
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
                } else if (discount_date_from != "") {
                    if (discount_date_to == "") {
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
                    } else if (discount_date_to != "") {
                        if (outlet_id_create_discount == "") {
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
                        } else if (outlet_id_create_discount != "") {


                            if (kategory_create_discount == "") {
                                push.innerHTML = "<p>Category must be choose</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            } else if (kategory_create_discount != "") {


                                if (discount_keterangan == "") {
                                    push.innerHTML = "<p>Item must be choose, click <i class='icon fa fa-search'></i> to get list of product</p>";
                                    modal.style.display = "block";
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    }
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    }
                                } else if (discount_keterangan != "") {
                                    if (discount_date_from > discount_date_to) {
                                        push.innerHTML = "<p>start date must be less than end date</p>";
                                        modal.style.display = "block";
                                        span.onclick = function () {
                                            modal.style.display = "none";
                                        }
                                        window.onclick = function (event) {
                                            if (event.target == modal) {
                                                modal.style.display = "none";
                                            }
                                        }
                                    } else if (discount_date_from < discount_date_to) {
                                        var datjson = new Object();
                                        datjson.brand_id = brand_id;
                                        datjson.outlet_id = outlet_id_create_discount;
                                        datjson.user_id = user_id;

                                        datjson.discount_name = discount_name;
                                        datjson.discount_value = discount_value;
                                        datjson.discount_date_from = discount_date_from;
                                        datjson.discount_date_to = discount_date_to;
                                        datjson.discount_keterangan = discount_keterangan;
                                        $.ajax({
                                            dataType: "json",
                                            url: "cr_dis",
                                            data: JSON.stringify(datjson),
                                            type: 'post',
                                            success: function (response) {
                                                if (response.resp_code == 0000) {
                                                    alert('success create discount');
                                                    $("#form_add_discount")[0].reset();
                                                    var options = '<option selected="true" disabled value="">Select Category</option>';
                                                    $("select#kategory_create_discount").html(options);
                                                    var Parent = document.getElementById('tbody_create_discount');
                                                    while (Parent.hasChildNodes())
                                                    {
                                                        Parent.removeChild(Parent.firstChild);
                                                    }
                                                    getdiscount();
                                                    $('.cd-popup-add-discount').removeClass('is-visible');
                                                } else {
                                                    alert('failed create discount');
                                                }
                                            }
                                        });
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
</script>