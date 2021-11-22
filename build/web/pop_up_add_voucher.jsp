<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-add-voucher
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-add-voucher {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-voucher {

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
    .cd-popup-add-voucher.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-voucher-container {

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

    .cd-popup-add-voucher-container .cd-buttons-add-voucher:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-voucher-container .cd-buttons-add-voucher li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-voucher-container .cd-buttons-add-voucher div {
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
    .cd-popup-add-voucher-container .cd-buttons-add-voucher li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-voucher-container .cd-buttons-add-voucher li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-voucher-container .cd-buttons-add-voucher li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-voucher-container .cd-buttons-add-voucher li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-voucher-container .cd-buttons-add-voucher li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-voucher-container .cd-buttons-add-voucher li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-voucher-container .cd-popup-add-voucher-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-voucher-container .cd-popup-add-voucher-close::before, .cd-popup-add-voucher-container .cd-popup-add-voucher-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-voucher-container .cd-popup-add-voucher-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-voucher-container .cd-popup-add-voucher-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-voucher-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-voucher-container {
            margin: 8em auto;
        }
    }
    #label_add_voucher {
        width: 100%;
        margin: 5px;
        text-align: left;
    }
    #boxx_add_voucher{
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

    #buttonon_create_voucher {
        color: white;
        margin-top: 10px;
        display: flex;
        float: left;
    }
    #btn_cancel_create_voucher {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #a7a0a0;
        border: 1px solid #c52d18;
        margin-right: 20px;
        border-radius: 3px;
        color: #c52d18;

    }
    #btn_save_create_voucher {
        cursor: pointer;
        width: 135px;
        height: 35px;
        background-color: #29B19C;
        border: 1px solid #CCC;
        margin-left: 8px;
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


    #box1_content {
        width: 300px;
        height: 400px;
        /*background-color: green;*/
        display: inline-block;
    }
    
    
    @media only screen and (max-width: 400px) {
    .cd-popup-add-voucher-container {
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
        $('#create_voucher_text').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-voucher').addClass('is-visible');
        });
        //close popup provide password
        $('.cd-popup-add-voucher').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-voucher-close') || $(event.target).is('.cd-popup-add-voucher')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_voucher")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-voucher').removeClass('is-visible');
            }
        });
    });




</script>

<div class="cd-popup-add-voucher" role="alert">
    <div class="cd-popup-add-voucher-container" style="color: #29B19C;">
        <label id="label_add_voucher">Create Voucher</label>
        <div id="boxx_add_voucher">
            <div id="box2_add_voucher">
                <div id="box1_content">
                    <form id="form_add_voucher">
                        <div id="myModal_voucher_create" class="modal">
                            <div class="modal-content">
                                <span class="close_create_voucher">&times;</span>
                                <div id="push_text_create_voucher"></div>
                            </div>
                        </div>
                        <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px;">Voucher Name</label>
                        <input type="text" placeholder="Voucher Name" style="width: 300px;" id="voucher_name" name="voucher_name">
                        <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px;">Voucher Code</label>
                        <input type="text" placeholder="Voucher Code" style="width: 300px;" id="voucher_code" name="voucher_code"><br>
                        <label style="margin-bottom: 0px; font-size: 10px; font-weight: 100; float: left;">Value</label>
                        <input type="number" placeholder="Value IDR" style="width: 300px; float: left;" id="voucher_value" name="voucher_value"><br>
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Item Limit</label>
                        <input type="number" placeholder="Item Limit" style="width: 300px; float: left;" id="voucher_limit" name="voucher_limit"><br>
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">From</label>
                        <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="voucher_date_from" name="voucher_date_from">
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">To</label>
                        <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="voucher_date_to" name="voucher_date_to">
                    </form>
                    <div id="buttonon_create_voucher">
                        <div id="btn_cancel_create_voucher"><a href="dis" style="color: white">Cancel</a></div>
                        <div id="btn_save_create_voucher" onclick="sub_create_voucher()">Create</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>

        </div>
        <a href="#0" class="cd-popup-add-voucher-close img-replace-add-voucher">Close</a>
    </div>
</div>
<script>
    var user_id = window.localStorage.getItem('user_id');
    function sub_create_voucher() {
        var voucher_name = document.getElementById("voucher_name").value;
        var voucher_code = document.getElementById("voucher_code").value;
        var voucher_value = document.getElementById("voucher_value").value;
        var voucher_limit = document.getElementById("voucher_limit").value;


        var voucher_date_from = document.getElementById("voucher_date_from").value;
        var voucher_date_to = document.getElementById("voucher_date_to").value;



        var modal = document.getElementById("myModal_voucher_create");
        var span = document.getElementsByClassName("close_create_voucher")[0];
        var push = document.getElementById("push_text_create_voucher");
        ;
        if (voucher_name == "") {
            push.innerHTML = "<p>Voucher name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (voucher_name != "") {
            if (voucher_code == "") {
                push.innerHTML = "<p>Voucher code must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (voucher_code != "") {
                if (voucher_value == "") {
                    push.innerHTML = "<p>Voucher Value must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (voucher_value != "") {
                    if (voucher_limit == "") {
                        push.innerHTML = "<p>Voucher limit must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (voucher_limit != "") {
                        if (voucher_date_from == "") {
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
                        } else if (voucher_date_from != "") {
                            if (voucher_date_to == "") {
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
                            } else if (voucher_date_to != "") {
                                if (voucher_date_from > voucher_date_to) {
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
                                } else if (voucher_date_from < voucher_date_to) {
                                    var datjson = new Object();
                                    datjson.brand_id = brand_id;
                                    datjson.user_id = user_id;

                                    datjson.voucher_name = voucher_name;
                                    datjson.voucher_code = voucher_code;
                                    datjson.voucher_value = voucher_value;
                                    datjson.voucher_limit = voucher_limit;
                                    datjson.voucher_date_from = voucher_date_from;
                                    datjson.voucher_date_to = voucher_date_to;

                                    $.ajax({
                                        dataType: "json",
                                        url: "cr_vou",
                                        data: JSON.stringify(datjson),
                                        type: 'post',
                                        success: function (response) {
                                            if (response.resp_code == 0000) {
                                                alert('success create voucher');
                                                $("#form_add_voucher")[0].reset();
                                                getvoucher();
                                                $('.cd-popup-add-voucher').removeClass('is-visible');
                                            } else {
                                                alert('failed create voucher');
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
</script>