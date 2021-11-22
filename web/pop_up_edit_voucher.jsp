<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-edit-voucher
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

    .cd-popup-edit-voucher {

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
    .cd-popup-edit-voucher.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-voucher-container {

        position: relative;
        /*width: 90%;*/
        height: 450px;
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

    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher div {
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
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-voucher-container .cd-buttons-edit-voucher li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-voucher-container .cd-popup-edit-voucher-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-voucher-container .cd-popup-edit-voucher-close::before, .cd-popup-edit-voucher-container .cd-popup-edit-voucher-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-voucher-container .cd-popup-edit-voucher-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-voucher-container .cd-popup-edit-voucher-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-voucher-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-voucher-container {
            margin: 8em auto;
        }
    }
    #label_edit_voucher {
        width: 100%;
        margin: 5px;
        text-align: left;
    }



    input {
        padding-left: 10px;
        border: 1px solid #CCC; 
        border-radius: 3px;
        width: 100%;
        margin-bottom: 5px;
    }











    /* The Close Button */
    .close_edit_voucher {
        padding-top: -10px;
        color: black;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_voucher:hover,
    .close_edit_voucher:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }










    #buttonon_create_voucher {
        color: white;
        margin-top: 10px;
        display: flex;
    }
    #btn_cancel_create_voucher {
        cursor: pointer;
        width: 80px;
        height: 35px;
        background-color: #a7a0a0;
        border: 1px solid #c52d18;
        /*margin-right: 20px;*/
        border-radius: 3px;
        color: #c52d18;

    }
    #btn_save_create_voucher {
        cursor: pointer;
        margin-right: 20px;
        width: 80px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        border-radius: 3px;
    }

    #btn_cancel_create_voucher:hover {
        background-color: #c52d18;
        color: white;
    }
    #btn_save_create_voucher:hover {
        background-color: #c52d18;
        color: white;
    }

    #boxx_gg_edit_voucher{
        display: flex;
        justify-content: center;
        align-content: center;
    }
    #box1_edit_voucher {
        cursor: pointer;
        width: 500px;
        height: 400px;
        align-content: center;
        text-align: center;
        margin-right: 5px;
        background-color: white;
        border-radius: 5px;
    }
    #box1_content_edit_voucher {
        width: 300px;
        /*height: 400px;*/
        /*background-color: green;*/
        display: inline-block;
    }

    @media only screen and (max-width: 400px) {
        .cd-popup-edit-voucher-container {

            position: relative;
            /*width: 90%;*/
            height: 450px;
            max-width: 350px;
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
    }
</style>

<script>
    jQuery(document).ready(function ($) {
        $('#table_voucher').on('click', '#id_voucher', function () {
            var $row = $(this).closest("tr");
            var id_voucher = $row.find(".id_voucher").text();
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.id_voucher = id_voucher;
            datjson.user_id = user_id;
            $.ajax({
                contentType: 'application/json',
                dataType: "json",
                url: "ed_vou?data=" + JSON.stringify(datjson),
                type: 'get',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        document.getElementById("edit_voucher_id").value = response.voucherid;
                        document.getElementById("edit_voucher_name").value = response.vouchername;
                        document.getElementById("edit_voucher_code").value = response.vouchercode;
                        document.getElementById("edit_voucher_value").value = response.value;
                        document.getElementById("edit_voucher_limit").value = response.voucherlimit;
                        document.getElementById("edit_voucher_date_from").value = response.startdate.substring(0, 10);
                        document.getElementById("edit_voucher_date_to").value = response.enddate.substring(0, 10);
                        $('.cd-popup-edit-voucher').addClass('is-visible');
                    } else {
                        alert('Failed');
                    }
                }
            });
        });





        //close popup provide password
        $('.cd-popup-edit-voucher').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-voucher-close') || $(event.target).is('.cd-popup-edit-voucher')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_editvoucher")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-voucher').removeClass('is-visible');
            }
        });
    });</script>

<div class="cd-popup-edit-voucher" role="alert">
    <div class="cd-popup-edit-voucher-container" style="color: #29B19C;">
        <label id="label_edit_voucher">Edit Voucher</label>
        <div id="boxx_gg_edit_voucher">
            <div id="box1_edit_voucher">
                <div id="box1_content_edit_voucher">
                    <form id="form_editvoucher">
                        <div id="myModal_voucher_edit" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_voucher">&times;</span>
                                <div id="push_text_edit_voucher"></div>
                            </div>
                        </div>
                        <label hidden="" style="font-size: 12px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px; color: black">voucher id</label>
                        <input readonly="" hidden="" type="text" placeholder="Voucher Id" style="width: 300px;" id="edit_voucher_id" name="edit_voucher_id"><br>
                        <label style="font-size: 12px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px; color: black">voucher name</label>
                        <input type="text" placeholder="Voucher Name" style="width: 300px;" id="edit_voucher_name" name="edit_voucher_name">
                        <label style="font-size: 12px; font-weight: 100; float: left; margin-bottom: 0px; color: black">voucher code</label>
                        <input type="text" placeholder="Voucher Code" style="width: 300px;" id="edit_voucher_code" name="edit_voucher_code"><br>
                        <label style="margin-bottom: 0px; font-size: 12px; font-weight: 100; float: left; color: black">value</label>
                        <input type="number" placeholder="Value IDR" style="width: 300px; float: left;" id="edit_voucher_value" name="edit_voucher_value"><br>
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">item limit</label>
                        <input type="number" placeholder="Item Limit" style="width: 300px; float: left;" id="edit_voucher_limit" name="edit_voucher_limit"><br>
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">from</label>
                        <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="edit_voucher_date_from" name="edit_voucher_date_from">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">to</label>
                        <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="edit_voucher_date_to" name="edit_voucher_date_to">
                    </form>
                    <div id="buttonon_create_voucher">
                        <div id="btn_cancel_create_voucher"><a href="dis" style="color: white">Cancel</a></div>
                        <div id="btn_save_create_voucher" onclick="sub_del_voucher()">Delete</div>
                        <div id="btn_save_create_voucher" onclick="sub_save_voucher()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-voucher-close img-replace-edit-customer">Close</a>
    </div>
</div>
<script>
    function sub_save_voucher() {
        var edit_voucher_id = document.getElementById("edit_voucher_id").value;
        var edit_voucher_name = document.getElementById("edit_voucher_name").value;
        var edit_voucher_code = document.getElementById("edit_voucher_code").value;
        var edit_voucher_value = document.getElementById("edit_voucher_value").value;
        var edit_voucher_limit = document.getElementById("edit_voucher_limit").value;
        var edit_voucher_date_from = document.getElementById("edit_voucher_date_from").value;
        var edit_voucher_date_to = document.getElementById("edit_voucher_date_to").value;
        var modal = document.getElementById("myModal_voucher_edit");
        var span = document.getElementsByClassName("close_edit_voucher")[0];
        var push = document.getElementById("push_text_edit_voucher");
        ;
        if (edit_voucher_name == "") {
            push.innerHTML = "<p>Voucher name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            };
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };
        } else if (edit_voucher_name != "") {
            if (edit_voucher_value == "") {
                push.innerHTML = "<p>voucher value must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                };
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                };
            } else if (edit_voucher_value != "") {
                if (edit_voucher_date_from == "") {
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
                } else if (edit_voucher_date_from != "") {
                    if (edit_voucher_date_to == "") {
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
                    } else if (edit_voucher_date_to != "") {
                        if (edit_voucher_limit == "") {
                            push.innerHTML = "<p>Limit must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            };
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            };
                        } else if (edit_voucher_limit != "") {
                            if (edit_voucher_code == "") {
                                push.innerHTML = "<p>Item must be fill</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                };
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                };
                            } else if (edit_voucher_code != "") {
                                if (edit_voucher_date_from > edit_voucher_date_to) {
                                    push.innerHTML = "<p>start date must be less than end date</p>";
                                    modal.style.display = "block";
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    };
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    };
                                } else if (edit_voucher_date_from < edit_voucher_date_to) {
                                    var datjson = new Object();
                                    datjson.user_id = user_id;
                                    datjson.brand_id = brand_id;

                                    datjson.edit_voucher_id = edit_voucher_id;
                                    datjson.edit_voucher_name = edit_voucher_name;
                                    datjson.edit_voucher_value = edit_voucher_value;
                                    datjson.edit_voucher_date_from = edit_voucher_date_from;
                                    datjson.edit_voucher_date_to = edit_voucher_date_to;
                                    datjson.edit_voucher_code = edit_voucher_code;
                                    datjson.edit_voucher_limit = edit_voucher_limit;

                                    $.ajax({
                                        dataType: "json",
                                        url: "ed_vou",
                                        type: 'post',
                                        data: JSON.stringify(datjson),
                                        success: function (response) {
                                            if (response.resp_code == 0000) {
                                                alert('Success update voucher ' + edit_voucher_name);
                                                getvoucher();
                                                $('.cd-popup-edit-voucher').removeClass('is-visible');
                                            } else {
                                                alert('failed update voucher ' + edit_voucher_name);
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

    function sub_del_voucher() {
        var edit_voucher_id = document.getElementById("edit_voucher_id").value;
        var modal = document.getElementById("myModal_voucher_edit");
        var span = document.getElementsByClassName("close_edit_voucher")[0];
        var push = document.getElementById("push_text_edit_voucher");
        ;
        if (edit_voucher_id == "") {
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
        } else if (edit_voucher_id != "") {
            var datjson3 = new Object();
            datjson3.brand_id = brand_id;
            datjson3.user_id = user_id;
            datjson3.voucher_id = edit_voucher_id;


            $.ajax({
                url: "del_vou",
                type: 'post',
                dataType: "json",
                data: JSON.stringify(datjson3),
                contentType: 'application/json',
                success: function (data) {
                    if (data.resp_code == 0000) {
                        alert('success delete voucher ' + edit_voucher_id);
                        getvoucher();
                        $('.cd-popup-edit-voucher').removeClass('is-visible');
                    } else {
                        alert('failed delete voucher ' + edit_voucher_id);
                    }
                },
                error: function (data) {
                    alert('gagal');
                }
            });
        }
    }
</script>