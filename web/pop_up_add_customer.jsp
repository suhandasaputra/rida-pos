<%-- 
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-add-category
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-add-customer {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-customer {
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
    .cd-popup-add-customer.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-customer-container {
        position: relative;
        width: 90%;
        height: 400px;
        max-width: 500px;
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

    .cd-popup-add-customer-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-customer-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-customer-container .cd-buttons-add-category div {
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
    .cd-popup-add-customer-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-customer-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-customer-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-customer-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-customer-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-customer-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-customer-container .cd-popup-add-customer-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-customer-container .cd-popup-add-customer-close::before, .cd-popup-add-customer-container .cd-popup-add-customer-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-customer-container .cd-popup-add-customer-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-customer-container .cd-popup-add-customer-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-customer-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-customer-container {
            margin: 8em auto;
        }
    }
    #label_add_customer {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_add_customer{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_add_customer {
        width: 450px;
        height: 200px;
        /*margin-left: 5px;*/
        /*background-color: yellow;*/
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
    #buttonon_customer {
        color: white;
        margin-top: 10px;
        display: flex;
        position: relative;
        left: -125px;
    }
    #btn_cancel {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_submit_customer {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_cancel:hover {
        background-color: #CCC;
    }
    #btn_submit_customer:hover {
        background-color: #CCC;
    }
    .image-upload > input {
        visibility:hidden;
        width:0;
        height:0
    }
    #panel_img {
        margin: 15px;
        height: 300px;
        width: 430px;
        background-color: white;
    }
    #blah {
        width: 430px;;
        height: 300px;
    }
    #btn_upl {
        width: 100px;
    }
    #img_filechooser_category {
        width: 215px;
        height: 200px;
    }

    /* The Close Button */
    .close {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }






    #lbl1{font-size: 10px; float: left; font-weight: 100}
    #lbl2{font-size: 10px; float: left; font-weight: 100}
    #lbl3{font-size: 10px; float: left; font-weight: 100}
    #lbl4{font-size: 10px; float: left; font-weight: 100}
    #lbl5{font-size: 10px; float: left; font-weight: 100; top: -144px; position: relative; left: 220px;}
    #outlet_id_add_cus{width: 200px; float: left; margin-top: -10px;}
    #customer_name{width: 200px; float: left; margin-top: -10px;}
    #customer_email{width: 200px; float: left; margin-top: -10px}
    #customer_phone{width: 200px; float: left; margin-top: -10px}
    #customer_address{width: 230px; float: left; margin-top: -10px; top: -144px; position: relative; left: 220px; height: 124px}

    @media only screen and (max-width: 400px) {
        #lbl1{font-size: 10px; float: left; font-weight: 100;margin-left: 10px}
        #lbl2{font-size: 10px; float: left; font-weight: 100;margin-left: 10px}
        #lbl3{font-size: 10px; float: left; font-weight: 100;margin-left: 10px}
        #lbl4{font-size: 10px; float: left; font-weight: 100;margin-left: 10px}
        #lbl5{font-size: 10px; float: left; font-weight: 100; top: -144px; position: relative; left: 220px;}

        #outlet_id_add_cus{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_name{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_email{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_phone{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_address{width: 180px; float: left; margin-top: -10px; top: -144px; position: relative; left: 220px; height: 124px}

    }
</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup provide password
        $('#add_customer').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-customer').addClass('is-visible');
        });
        //close popup provide password
        $('.cd-popup-add-customer').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-customer-close') || $(event.target).is('.cd-popup-add-customer') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_customer")[0].reset();
            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-customer').removeClass('is-visible');
            }
        });
    });</script>
<div class="cd-popup-add-customer" role="alert">
    <div class="cd-popup-add-customer-container">
        <label id="label_add_customer">Add Customer</label>
        <div id="boxx_add_customer">
            <div id="box2_add_customer">
                <div id="input_add_customer">
                    <form id="form_add_customer">
                        <div id="myModal_add_customer" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text_add_customer"></div>
                            </div>
                        </div>
                        <label id="lbl1">Select Outlet</label><br>
                        <select id="outlet_id_add_cus" name="outlet_id_add_cus">
                        </select><br>
                        <label id="lbl2">Full Name</label><br>
                        <input type="text" id="customer_name" name="customer_name" required="" placeholder="Full Name"><br>
                        <label id="lbl3">Email</label><br>
                        <input type="email" id="customer_email" name="customer_email" required="" placeholder="Email"><br>
                        <label id="lbl4">Phone</label><br>
                        <input type="number" id="customer_phone" name="customer_phone" required="" placeholder="Phone"><br>
                        <label id="lbl5">Address</label><br>
                        <textarea id="customer_address" name="customer_address" required="" placeholder="Address"></textarea>
                    </form>
                    <div id="buttonon_customer">
                        <div id="btn_cancel">Cancel</div>
                        <div id="btn_submit_customer" onclick="sub_customer()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-customer-close img-replace-add-customer">Close</a>
    </div>
</div>
<script>
    function sub_customer() {
        var customer_name = document.getElementById("customer_name").value;
        var customer_email = document.getElementById("customer_email").value;
        var customer_phone = document.getElementById("customer_phone").value;
        var customer_address = document.getElementById("customer_address").value;
        var outlet_id_add_cus = document.getElementById('outlet_id_add_cus').value;
        var modal = document.getElementById("myModal_add_customer");
        var span = document.getElementsByClassName("close")[0];
        var push = document.getElementById("push_text_add_customer");
        ;
        if (customer_name == "") {
            push.innerHTML = "<p>User name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (customer_name != "") {
            if (customer_email == "") {
                push.innerHTML = "<p>Email must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (customer_email != "") {
                if (customer_phone == "") {
                    push.innerHTML = "<p>Phone must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (customer_phone != "") {
                    if (customer_address == "") {
                        push.innerHTML = "<p>Address must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (customer_address != "") {
//                        var datjson = new Object();
//
//                        datjson.brand_id = brand_id;
//                        datjson.outlet_id = outlet_id_add_cus;
//                        datjson.customer_name = customer_name;
//                        datjson.customer_email = customer_email;
//                        datjson.customer_phone = customer_phone;
//                        datjson.customer_address = customer_address;
//                        $.ajax({
//                            dataType: "json",
//                            url: "addcus",
//                            data: JSON.stringify(datjson),
//                            type: 'post',
//                            success: function (response) {
//                                if (response.resp_code == 0000) {
//                                    $('#table_customer').DataTable().ajax.reload();
//                                    alert('success add customer ' + customer_name);
//                                    $("#form_add_customer")[0].reset();
//                                    $('.cd-popup-add-customer').removeClass('is-visible');
//                                } else {
//                                    alert('Failed add category ' + customer_name);
//                                }
//                            }
//                        });

                        var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                        if (customer_email.match(mailformat)) {
                            var datjson = new Object();

                            datjson.brand_id = brand_id;
                            datjson.outlet_id = outlet_id_add_cus;
                            datjson.customer_name = customer_name;
                            datjson.customer_email = customer_email;
                            datjson.customer_phone = customer_phone;
                            datjson.customer_address = customer_address;
                            $.ajax({
                                dataType: "json",
                                url: "addcus",
                                data: JSON.stringify(datjson),
                                type: 'post',
                                success: function (response) {
                                    if (response.resp_code == 0000) {
                                        $('#table_customer').DataTable().ajax.reload();
                                        alert('success add customer ' + customer_name);
                                        $("#form_add_customer")[0].reset();
                                        $('.cd-popup-add-customer').removeClass('is-visible');
                                    } else {
                                        alert('Failed add category ' + customer_name);
                                    }
                                }
                            });

                        } else {
                            push.innerHTML = "<p>Customer email not valid</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            };
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            };
                        }
                    }
                }
            }
        }
    }
</script>