<%--
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-edit-supplier
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-edit-supplier {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-supplier {
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
    .cd-popup-edit-supplier.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-supplier-container {
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

    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier div {
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
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-supplier-container .cd-buttons-edit-supplier li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-supplier-container .cd-popup-edit-supplier-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-supplier-container .cd-popup-edit-supplier-close::before, .cd-popup-edit-supplier-container .cd-popup-edit-supplier-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-supplier-container .cd-popup-edit-supplier-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-supplier-container .cd-popup-edit-supplier-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-supplier-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-supplier-container {
            margin: 8em auto;
        }
    }
    #label_edit_supplier {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_edit_supplier{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_edit_supplier {
        width: 215px;
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
    #btn_delete {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_edit_submit_supplier {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_delete:hover {
        background-color: #CCC;
    }
    #btn_edit_submit_supplier:hover {
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
    .close_edit_supplier {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_supplier:hover,
    .close_edit_supplier:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<script>
    jQuery(document).ready(function ($) {
        //open popup provide password

        $('#table_supplier').on('click', 'td', function () {
            var $row = $(this).closest("tr");
            var supplier_id = $row.find(".supplier_id").text();
            var supplier_name = $row.find(".supplier_name").text();
            var supplier_phone = $row.find(".supplier_phone").text();
            var supplier_mail = $row.find(".supplier_mail").text();
            var supplier_address = $row.find(".supplier_address").text();

            document.getElementById("supplier_id_edit_supplier").value = supplier_id;
            document.getElementById("supplier_name_edit_supplier").value = supplier_name;
            document.getElementById("supplier_phone_edit_supplier").value = supplier_phone;
            document.getElementById("supplier_mail_edit_supplier").value = supplier_mail;
            document.getElementById("supplier_addres_edit_supplier").value = supplier_address;
            $('.cd-popup-edit-supplier').addClass('is-visible');
        });

        //close popup provide password
        $('.cd-popup-edit-supplier').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-supplier-close') || $(event.target).is('.cd-popup-edit-supplier')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_edit_supplier")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-supplier').removeClass('is-visible');
            }
        });
    });
</script>

<div class="cd-popup-edit-supplier" role="alert">
    <div class="cd-popup-edit-supplier-container" style="color: #29B19C;">
        <label id="label_edit_supplier">Edit Supplier</label>
        <div id="boxx_edit_supplier">
            <div id="box2_edit_supplier">
                <div id="input_edit_user">
                    <form id="form_edit_supplier">
                        <div id="myModal_edit_supplier" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_supplier">&times;</span>
                                <div id="push_text_edit_supplier"></div>
                            </div>
                        </div>
                        <input type="text" hidden="" id="supplier_id_edit_supplier" name="supplier_id_edit_supplier">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">supplier name</label><input type="text" id="supplier_name_edit_supplier" name="supplier_name_edit_supplier" required="" placeholder="Supplier Name">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">supplier phone</label><input type="number" id="supplier_phone_edit_supplier" name="supplier_phone_edit_supplier" required="" placeholder="Supplier Phone">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">supplier email</label><input type="email" id="supplier_mail_edit_supplier" name="supplier_mail_edit_supplier" required="" placeholder="Supplier Email">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">supplier address</label><textarea id="supplier_addres_edit_supplier" name="supplier_addres_edit_supplier" required="" placeholder="Supplier Address" style="margin: 0px"></textarea>
                    </form>
                    <div id="buttonon">
                        <div id="btn_delete" onclick="sub_del_supplier()">Delete</div>
                        <div id="btn_edit_submit_supplier" onclick="sub_edt_supplier()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-supplier-close img-replace-edit-supplier">Close</a>
    </div>
</div>
<script>
    function sub_edt_supplier() {
        var supplier_id = document.getElementById("supplier_id_edit_supplier").value;
        var supplier_name = document.getElementById("supplier_name_edit_supplier").value;
        var supplier_phone = document.getElementById("supplier_phone_edit_supplier").value;
        var supplier_mail = document.getElementById("supplier_mail_edit_supplier").value;
        var supplier_address = document.getElementById("supplier_addres_edit_supplier").value;

        var modal = document.getElementById("myModal_edit_supplier");
        var span = document.getElementsByClassName("close_edit_supplier")[0];
        var push = document.getElementById("push_text_edit_supplier");
        ;
        if (supplier_name == "") {
            push.innerHTML = "<p>Supplier name must be fill</p>";
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
            if (supplier_phone == "") {
                push.innerHTML = "<p>Supplier phone must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (supplier_phone != "") {
                if (supplier_mail == "") {
                    push.innerHTML = "<p>Supplier mail must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (supplier_mail != "") {
                    if (supplier_address == "") {
                        push.innerHTML = "<p>Supplier Address must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (supplier_address != "") {
                        var datjson = new Object();
                        datjson.brand_id = brand_id;
                        datjson.supplier_id = supplier_id;
                        datjson.supplier_name = supplier_name;
                        datjson.supplier_phone = supplier_phone;
                        datjson.supplier_mail = supplier_mail;
                        datjson.supplier_address = supplier_address;
                        $.ajax({
                            dataType: "json",
                            url: "editsup",
                            data: JSON.stringify(datjson),
                            type: 'post',
                            success: function (response) {
                                if (response.resp_code == 0000) {
                                    $('#table_supplier').DataTable().ajax.reload();
                                    alert('success update supplier');
                                    $('.cd-popup-edit-supplier').removeClass('is-visible');
                                } else {
                                    alert('Failed update supplier');
                                }
                            }
                        });

                    }
                }
            }
        }
    }

    function sub_del_supplier() {
        var supplier_id = document.getElementById("supplier_id_edit_supplier").value;

        if (supplier_id == "") {
            push.innerHTML = "<p>Supplier id must be fill</p>";
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
            datjson.supplier_id = supplier_id;
            $.ajax({
                dataType: "json",
                url: "delsup",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        $('#table_supplier').DataTable().ajax.reload();
                        alert('Success Delete Supplier');
                        $('.cd-popup-edit-supplier').removeClass('is-visible');
                    } else {
                        alert('Failed Delete Supplier');
                    }
                }
            });
        }
    }
</script>