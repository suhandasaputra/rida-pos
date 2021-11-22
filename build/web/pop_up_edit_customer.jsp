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

    .img-replace-edit-customer {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-customer {
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
    .cd-popup-edit-customer.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-customer-container {
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

    .cd-popup-edit-customer-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-customer-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-customer-container .cd-buttons-add-category div {
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
    .cd-popup-edit-customer-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-customer-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-customer-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-customer-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-customer-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-customer-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-customer-container .cd-popup-edit-customer-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-customer-container .cd-popup-edit-customer-close::before, .cd-popup-edit-customer-container .cd-popup-edit-customer-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-customer-container .cd-popup-edit-customer-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-customer-container .cd-popup-edit-customer-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-customer-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-customer-container {
            margin: 8em auto;
        }
    }
    #label_edit_customer {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_edit_customer{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_edit_customer {
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
    #buttonon {
        color: white;
        margin-top: 10px;
        display: flex;
    }
    #btn_delete_customer {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_edit_submit_customer {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_delete_customer:hover {
        background-color: #CCC;
    }
    #btn_edit_submit_customer:hover {
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
    .close_edit_customer {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_customer:hover,
    .close_edit_customer:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
    
    
    
    
    #lble1{font-size: 10px; float: left; font-weight: 100;color: black;}
    #lble2{font-size: 10px; float: left; font-weight: 100;color: black;}
    #lble3{font-size: 10px; float: left; font-weight: 100;color: black;}
    #lble4{font-size: 10px; float: left; font-weight: 100;color: black;}
    #lble5{font-size: 10px; float: left; font-weight: 100; top: -190px; position: relative; left: 220px;color: black;}
    #customer_outlet_edit{width: 200px; float: left; margin-top: -10px; background-color: azure;}
    #customer_email_edit{width: 200px; float: left; margin-top: -10px; background-color: azure;}
    #customer_name_edit{width: 200px; float: left; margin-top: -10px;}
    #customer_phone_edit{width: 200px; float: left; margin-top: -10px;}
    #customer_address_edit{width: 230px; float: left; margin-top: -10px; top: -190px; position: relative; left: 220px; height: 170px;}

    @media only screen and (max-width: 400px) {
        #lble1{font-size: 10px; float: left; font-weight: 100;margin-left: 10px;color: black;}
        #lble2{font-size: 10px; float: left; font-weight: 100;margin-left: 10px;color: black;}
        #lble3{font-size: 10px; float: left; font-weight: 100;margin-left: 10px;color: black;}
        #lble4{font-size: 10px; float: left; font-weight: 100;margin-left: 10px;color: black;}
        #lble5{font-size: 10px; float: left; font-weight: 100; top: -190px; position: relative; left: 220px;color: black;}

        #customer_outlet_edit{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_email_edit{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_name_edit{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_phone_edit{width: 180px; float: left; margin-top: -10px;margin-left: 10px}
        #customer_address_edit{width: 180px; float: left; margin-top: -10px; top: -190px; position: relative; left: 220px; height: 170px}

    }
</style>

<script>
    jQuery(document).ready(function ($) {
        $('#table_customer').on('click', 'td', function () {
            var $row = $(this).closest("tr");    // Find the row
            var customer_outlet_edit = $row.find(".outlet_id").text();
            var customer_name_edit = $row.find(".name").text(); // Find the text
            var customer_phone_edit = $row.find(".phonenumber").text(); // Find the text
            var customer_email_edit = $row.find(".email").text(); // Find the text
            var customer_address_edit = $row.find(".address").text(); // Find the text

            document.getElementById("customer_outlet_edit").value = customer_outlet_edit;
            document.getElementById("customer_name_edit").value = customer_name_edit;
            document.getElementById("customer_phone_edit").value = customer_phone_edit;
            document.getElementById("customer_email_edit").value = customer_email_edit;
            document.getElementById("customer_address_edit").value = customer_address_edit;
            $('.cd-popup-edit-customer').addClass('is-visible');
        });
        //close popup provide password
        $('.cd-popup-edit-customer').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-customer-close') || $(event.target).is('.cd-popup-edit-customer')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#formedit_customer")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-customer').removeClass('is-visible');
            }
        });
    });</script>

<div class="cd-popup-edit-customer" role="alert">
    <div class="cd-popup-edit-customer-container" style="color: #29B19C;">
        <label id="label_edit_customer">Edit Customer</label>
        <div id="boxx_edit_customer">
            <div id="box2_edit_customer">
                <div id="input_edit_customer">
                    <form action="editcus" id="formedit_customer" method="post">
                        <div id="myModal_edit_customer" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_customer">&times;</span>
                                <div id="push_text_edit_customer"></div>
                            </div>
                        </div>
                        <label id="lble1">outlet</label><br>
                        <input type="text" id="customer_outlet_edit" readonly="" name="customer_outlet_edit" required="" placeholder="outlet"><br>
                        <label id="lble2">email</label><br>
                        <input type="email" id="customer_email_edit" readonly="" name="customer_email_edit" required="" placeholder="Email"><br>
                        <label id="lble3">full name</label><br>
                        <input type="text" id="customer_name_edit" name="customer_name_edit" required="" placeholder="Full Name"><br>
                        <label id="lble4">phone</label><br>
                        <input type="number" id="customer_phone_edit" name="customer_phone_edit" required="" placeholder="Phone"><br>
                        <label id="lble5">address</label><br>
                        <textarea id="customer_address_edit" name="customer_address_edit" required="" placeholder="Address"></textarea>
                    </form>
                    <div id="buttonon">
                        <div id="btn_delete_customer" onclick="sub_del_customer()">Delete</div>
                        <div id="btn_edit_submit_customer" onclick="sub_edt_customer()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-customer-close img-replace-edit-customer">Close</a>
    </div>
</div>
<script>
    function sub_edt_customer() {
        var customer_name_edit = document.getElementById("customer_name_edit").value;
        var customer_email_edit = document.getElementById("customer_email_edit").value;
        var customer_phone_edit = document.getElementById("customer_phone_edit").value;
        var customer_address_edit = document.getElementById("customer_address_edit").value;
        var customer_outlet_edit = document.getElementById('customer_outlet_edit').value;

        var modal = document.getElementById("myModal_edit_customer");
        var span = document.getElementsByClassName("close_edit_customer")[0];
        var push = document.getElementById("push_text_edit_customer");
        ;
        if (customer_name_edit == "") {
            push.innerHTML = "<p>Customer name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (customer_name_edit != "") {
            if (customer_email_edit == "") {
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
            } else if (customer_email_edit != "") {
                if (customer_phone_edit == "") {
                    push.innerHTML = "<p>Phone Number must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (customer_phone_edit != "") {
                    if (customer_address_edit == "") {
                        push.innerHTML = "<p>Address must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (customer_address_edit != "") {

                        var datjson4 = new Object();
                        datjson4.brand_id = brand_id;
                        datjson4.customer_name_edit = customer_name_edit;
                        datjson4.customer_email_edit = customer_email_edit;
                        datjson4.customer_phone_edit = customer_phone_edit;
                        datjson4.customer_address_edit = customer_address_edit;
                        datjson4.customer_outlet_edit = customer_outlet_edit;

                        $.ajax({
                            contentType: 'application/json',
                            dataType: "json",
                            url: "editcus",
                            data: JSON.stringify(datjson4),
                            type: 'post',
                            success: function (response) {
                                if (response.resp_code == 0000) {
                                    alert('success update customer ' + customer_email_edit);
                                    $('#table_customer').DataTable().ajax.reload();
                                    $('.cd-popup-edit-customer').removeClass('is-visible');
                                } else {
                                    alert('failed update user ' + customer_email_edit);
                                }
                            }
                        });
                    }
                }
            }
        }
    }

    function sub_del_customer() {
        var customer_email_delete = document.getElementById("customer_email_edit").value;

        if (customer_email_delete == "") {
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
        } else if (customer_email_delete != "") {
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.email = customer_email_delete;
            $.ajax({
                dataType: "json",
                url: "delcus",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        alert('Success Delete ' + customer_email_delete);
                        $('#table_customer').DataTable().ajax.reload();
                        $('.cd-popup-edit-customer').removeClass('is-visible');
                    } else {
                        alert('Failed Delete ' + customer_email_delete);
                    }
                }
            });
        }
    }
</script>