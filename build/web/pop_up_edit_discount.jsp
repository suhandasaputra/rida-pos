<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-edit-discount
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-edit-customer {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-discount {

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
    .cd-popup-edit-discount.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-discount-container {

        position: relative;
        /*width: 90%;*/
        height: 650px;
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

    .cd-popup-edit-discount-container .cd-buttons-edit-discount:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-discount-container .cd-buttons-edit-discount li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-discount-container .cd-buttons-edit-discount div {
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
    .cd-popup-edit-discount-container .cd-buttons-edit-discount li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-discount-container .cd-buttons-edit-discount li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-discount-container .cd-buttons-edit-discount li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-discount-container .cd-buttons-edit-discount li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-discount-container .cd-buttons-edit-discount li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-discount-container .cd-buttons-edit-discount li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-discount-container .cd-popup-edit-discount-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-discount-container .cd-popup-edit-discount-close::before, .cd-popup-edit-discount-container .cd-popup-edit-discount-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-discount-container .cd-popup-edit-discount-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-discount-container .cd-popup-edit-discount-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-discount-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-discount-container {
            margin: 8em auto;
        }
    }
    #label_edit_discount {
        width: 100%;
        margin: 5px;
        text-align: left;
    }
    #boxx_edit_discount{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_edit_discount {
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
    .close_edit_discount {
        padding-top: -10px;
        color: black;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_discount:hover,
    .close_edit_discount:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }







    #box3_edit_discount {
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
        margin-right: 5px;
        border-radius: 3px;
        color: #c52d18;

    }
    #btn_save_create_discount {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        margin-right: 0px;
        border-radius: 3px;
    }

    #btn_del_create_discount {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        margin-right: 0px;
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
    #btn_del_create_discount:hover {
        background-color: #c52d18;
        color: white;
    }







    #table_item_edit_discount th {
        background-color: #ACACAC;
        color: white;
        font-weight: 100;
    }
    #table_item_edit_discount {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ddd;
        font-size: 12px;
    }
    #table_item_edit_discount th {
        text-align: left;
        padding: 12px;
    }
    #table_item_edit_discount td {
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
    #table_item_edit_discount tr {
        border-bottom: 1px solid #ddd;
    }





    .selected {
        background-color: brown;
        color: #FFF;
    }



    #table_outlet_create_discount tr {
        border-bottom: 1px solid #ddd;
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
    #kategory_edit_discount{width: 285px; margin-top: 17px; margin-bottom: 10px;}

    @media only screen and (max-width: 400px) {
        #box2_edit_discount {
            width: 210px;
            height: auto;
            margin-left: 5px;
        }
        #box3_edit_discount {
            width: 210px;
            height: auto;
            margin-left: 5px;
            margin-right: 5px;
        }
        #kategory_edit_discount{width: 210px; margin-top: 17px; margin-bottom: 10px;}
    }
    img {width: 100px}
</style>

<script>
    jQuery(document).ready(function ($) {
        $('#table_discount').on('click', '#id_discount', function () {
            $("#table_item_edit_discount tbody tr").remove();
            var $row = $(this).closest("tr");
            var id = $row.find(".id").text();
            var outlet_id = $row.find(".outlet_id").text();
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.id = id;
            datjson.outlet_id = outlet_id;
            datjson.user_id = user_id;
            $.ajax({
                contentType: 'application/json',
                dataType: "json",
                url: "ed_dis?data=" + JSON.stringify(datjson),
                type: 'get',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        document.getElementById("edit_discount_id").value = response.discount_id;
                        document.getElementById("edit_discount_name").value = response.discount_name;
                        document.getElementById("edit_discount_value").value = response.value;
                        document.getElementById("edit_discount_date_from").value = response.startdate.substring(0, 10);
                        document.getElementById("edit_discount_date_to").value = response.enddate.substring(0, 10);
                        document.getElementById("edit_send_outlet").value = response.outlet_id.replaceAll(",", "|");
                        document.getElementById("edit_discount_keterangan").value = response.product_code.replaceAll(",", "|");

                        $.getJSON('opt?action=option_category', {brand_id: brand_id, outlet_id: outlet_id}, function (data) {
                            var options = '<option selected disabled value="">Select Category</option>';
                            for (var i = 0; i < data.length; i++) {
                                options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                            }
                            $("select#kategory_edit_discount").html(options);
                        });


                        $('.cd-popup-edit-discount').addClass('is-visible');
                        $('#kategory_edit_discount').unbind().bind('change', function (event) {
                            $("#table_item_edit_discount tbody tr").remove();

                            var kategory_edit_discount = $("select#kategory_edit_discount").val();
                            var outlet_id = document.getElementById("edit_send_outlet").value;
                            $.get('dis_item?action', {brand_id: brand_id, category: kategory_edit_discount, user_id: user_id, outlet_id: outlet_id},
                                    function (response) {
                                        //    generte table category  
                                        if (response === 'keren') {
                                            var select = $('#table_item_edit_discount');
                                            select.find('td').remove();
                                        } else {
                                            let mountains12 = response;
                                            function generateTable12(table12, data) {
                                                for (let element of data) {
                                                    let row = table12.insertRow();
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
                                                $("#table_item_edit_discount tr").click(function () {
                                                    if ($(this).hasClass('selected')) {
                                                        var value = $(this).find('td:first').html();
                                                        $("#edit_discount_keterangan").val(function (i, val) {
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
                                                        var isi_dari_area_item = document.getElementById("edit_discount_keterangan").value;
                                                        var value = $(this).find('td:first').html();
                                                        if (isi_dari_area_item.includes(value)) {
                                                            $(this).toggleClass('selected');
                                                        } else {
                                                            $(this).toggleClass('selected');
                                                            $("#edit_discount_keterangan").val(function (i, val) {
                                                                if (val != "") {
                                                                    return val += '|' + value;
                                                                } else {
                                                                    return val += value;
                                                                }
                                                            });
                                                        }

                                                    }
                                                });
                                            }
                                            let table12 = document.querySelector("#table_item_edit_discount tbody");
                                            generateTable12(table12, mountains12); // generate the table first

                                        }
                                    });
                        });
                    } else {
                        alert('Failed');
                    }
                }
            });
        });





        //close popup provide password
        $('.cd-popup-edit-discount').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-discount-close') || $(event.target).is('.cd-popup-edit-discount')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_edit_discount")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-discount').removeClass('is-visible');
            }
        });
    });</script>

<div class="cd-popup-edit-discount" role="alert">
    <div class="cd-popup-edit-discount-container" style="color: #29B19C;">
        <label id="label_edit_discount">Edit Discount</label>
        <div id="boxx_edit_discount">
            <div id="box2_edit_discount">
                <div id="input_edit_discount">
                    <form id="form_edit_discount">
                        <div id="myModal_discount_edit" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_discount">&times;</span>
                                <div id="push_text_edit_discount"></div>
                            </div>
                        </div>
                        <label style="font-size: 12px; float: left; font-weight: 100; margin-bottom: 0px; color: black">outlet</label>
                        <input type="text" id="edit_send_outlet" name="edit_send_outlet" readonly="" style="background-color: aquamarine">
                        <label style="font-size: 12px; font-weight: 100; float: left; margin-bottom: 0px; color: black">discount name</label>
                        <input type="text" placeholder="Discount Name" id="edit_discount_name" name="edit_discount_name" value="${sessionScope.edit_discount_name}"><br>
                        <label style="margin-bottom: 0px; font-size: 12px; font-weight: 100; float: left; color: black">value</label>
                        <input type="number" placeholder="Value %" style="float: left;" id="edit_discount_value" name="edit_discount_value"><br>
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">from</label>
                        <input type="date" style="float: left;" id="edit_discount_date_from" name="edit_discount_date_from">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">to</label>
                        <input type="date" style="float: left;" id="edit_discount_date_to" name="edit_discount_date_to">
                        <label style="font-size: 12px; float: left; font-weight: 100; color: black">item</label>
                        <textarea id="edit_discount_keterangan" name="edit_discount_keterangan" readonly="" style="background-color: aquamarine; margin-top: -10px;"></textarea>
                        <input readonly="" hidden="" type="text" placeholder="Discount Id" id="edit_discount_id" name="edit_discount_id" value="${sessionScope.edit_discount_id}"><br>
                    </form>
                    <div id="buttonon_create_discount">
                        <div id="btn_cancel_create_discount"><a href="dis" style="color: white">Cancel</a></div>
                        <div id="btn_del_create_discount" onclick="sub_del_discount()">Delete</div>
                        <div id="btn_save_create_discount" onclick="sub_save_discount()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
            <div id="box3_edit_discount">
                <div id="bar_item" style="display: inline; color: #29B19C;">
                    <select id="kategory_edit_discount" name="kategory_edit_discount">
                    </select>
                </div>
                <br>
                <div class="container" style="height: 450px; overflow-y: auto;">        
                    <table class="table" id="table_item_edit_discount">
                        <thead>
                            <tr>
                                <th>productcode</th>
                                <th>productname</th>
                                <th>image</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-discount-close img-replace-edit-customer">Close</a>
    </div>
</div>
<script>
    function sub_save_discount() {
        var edit_discount_id = document.getElementById("edit_discount_id").value;
        var edit_discount_name = document.getElementById("edit_discount_name").value;
        var edit_discount_value = document.getElementById("edit_discount_value").value;
        var edit_discount_date_from = document.getElementById("edit_discount_date_from").value;
        var edit_discount_date_to = document.getElementById("edit_discount_date_to").value;
        var edit_send_outlet = document.getElementById("edit_send_outlet").value;
        var edit_discount_keterangan = document.getElementById("edit_discount_keterangan").value;
        var modal = document.getElementById("myModal_discount_edit");
        var span = document.getElementsByClassName("close_edit_discount")[0];
        var push = document.getElementById("push_text_edit_discount");
        ;
        if (edit_discount_name == "") {
            push.innerHTML = "<p>Discount name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            };
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };
        } else if (edit_discount_name != "") {
            if (edit_discount_value == "") {
                push.innerHTML = "<p>Discount value must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                };
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                };
            } else if (edit_discount_value != "") {
                if (edit_discount_date_from == "") {
                    push.innerHTML = "<p>Date from must be choose</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    };
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    };
                } else if (edit_discount_date_from != "") {
                    if (edit_discount_date_to == "") {
                        push.innerHTML = "<p>Date to must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        };
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        };
                    } else if (edit_discount_date_to != "") {
                        if (edit_send_outlet == "") {
                            push.innerHTML = "<p>Outlet must be choose</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            };
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            };
                        } else if (edit_send_outlet != "") {
                            if (edit_discount_keterangan == "") {
                                push.innerHTML = "<p>Item must be choose</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                };
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                };
                            } else if (edit_discount_keterangan != "") {
                                if (edit_discount_date_from > edit_discount_date_to) {
                                    push.innerHTML = "<p>start date must be less than end date</p>";
                                    modal.style.display = "block";
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    }
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    };
                                } else if (edit_discount_date_from < edit_discount_date_to) {
                                    var datjson = new Object();
                                    datjson.user_id = user_id;
                                    datjson.brand_id = brand_id;

                                    datjson.edit_discount_id = edit_discount_id;
                                    datjson.edit_discount_name = edit_discount_name;
                                    datjson.edit_discount_value = edit_discount_value;
                                    datjson.edit_discount_date_from = edit_discount_date_from;
                                    datjson.edit_discount_date_to = edit_discount_date_to;
                                    datjson.edit_send_outlet = edit_send_outlet;
                                    datjson.edit_discount_keterangan = edit_discount_keterangan;

                                    $.ajax({
                                        dataType: "json",
                                        url: "ed_dis",
                                        type: 'post',
                                        data: JSON.stringify(datjson),
                                        success: function (response) {
                                            if (response.resp_code == 0000) {
                                                alert('Success update discount ' + edit_discount_name);
                                                getdiscount();
                                                $('.cd-popup-edit-discount').removeClass('is-visible');
                                            } else {
                                                alert('failed update discount ' + edit_discount_name);
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

    function sub_del_discount() {
        var edit_discount_id = document.getElementById("edit_discount_id").value;
        var edit_send_outlet = document.getElementById("edit_send_outlet").value;
        var modal = document.getElementById("myModal_discount_edit");
        var span = document.getElementsByClassName("close_edit_discount")[0];
        var push = document.getElementById("push_text_edit_discount");
        ;
        if (edit_discount_id == "") {
            push.innerHTML = "<p>Discoun ID must be choose</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (edit_discount_id != "") {
            var datjson3 = new Object();
            datjson3.brand_id = brand_id;
            datjson3.outlet_id = edit_send_outlet;
            datjson3.user_id = user_id;
            datjson3.discount_id = edit_discount_id;


            $.ajax({
                url: "del_dis",
                type: 'post',
                dataType: "json",
                data: JSON.stringify(datjson3),
                contentType: 'application/json',
                success: function (data) {
                    if (data.resp_code == 0000) {
                        alert('success delete discount ' + edit_discount_id);
                        getdiscount();
                        $('.cd-popup-edit-discount').removeClass('is-visible');
                    } else {
                        alert('failed delete discount ' + edit_discount_id);
                    }
                },
                error: function (data) {
                    alert('gagal');
                }
            });
        }
    }
</script>