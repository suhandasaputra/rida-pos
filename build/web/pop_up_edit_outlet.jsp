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

    .img-replace-edit-outlet {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-outlet {
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
    .cd-popup-edit-outlet.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-outlet-container {
        position: relative;
        width: 90%;
        height: 350px;
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

    .cd-popup-edit-outlet-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-outlet-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-outlet-container .cd-buttons-add-category div {
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
    .cd-popup-edit-outlet-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-outlet-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-outlet-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-outlet-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-outlet-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-outlet-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-outlet-container .cd-popup-edit-outlet-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-outlet-container .cd-popup-edit-outlet-close::before, .cd-popup-edit-outlet-container .cd-popup-edit-outlet-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-outlet-container .cd-popup-edit-outlet-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-outlet-container .cd-popup-edit-outlet-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-outlet-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-outlet-container {
            margin: 8em auto;
        }
    }
    #label_add_outlet {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_add_outlet{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_add_outlet {
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
    #btn_cancel {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_edit_submit_outlet {
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
    #btn_edit_submit_outlet:hover {
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
    .close_edit_outlet {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_outlet:hover,
    .close_edit_outlet:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
    #btn_delete_edit_outlet {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        /*margin-right: 3px;*/
        border-radius: 3px;
    }

    #btn_delete_edit_outlet:hover {
        background-color: #CCC;
    }
</style>


<script>
    jQuery(document).ready(function ($) {
        $('#table_oke').on('click', 'td', function () {
            var $row = $(this).closest("tr");    // Find the row
            var id = $row.find("#outlet_id").text(); // Find the text
            var name = $row.find("#outlet_name").text(); // Find the text
            var address = $row.find("#outlet_address").text(); //find the text

            document.getElementById("outlet_id1").value = id;
            document.getElementById("outlet_name1").value = name;
            document.getElementById("outlet_address1").value = address;

            $('.cd-popup-edit-outlet').addClass('is-visible');
        });

        //close popup provide password
        $('.cd-popup-edit-outlet').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-outlet-close') || $(event.target).is('.cd-popup-edit-outlet') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                                                                $("#form_edit_outlet")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-outlet').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-edit-outlet" role="alert">
    <div class="cd-popup-edit-outlet-container" style="color: #29B19C;">
        <label id="label_add_outlet">Edit Outlet</label>
        <div id="boxx_add_outlet">
            <div id="box2_add_outlet">
                <div id="input_add_outlet">
                    <form id="form_edit_outlet">
                        <div id="myModal_edit_outlet" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_outlet">&times;</span>
                                <div id="push_text_edit_outlet"></div>
                            </div>
                        </div>
                        <label style="font-weight: 100;
                               float: left;
                               margin: 0px 0px 1px 0px;
                               color: black;
                               font-size: 12px;">outlet id</label>
                        <input id="outlet_id1" name="outlet_id1" readonly="" style="background-color: aquamarine;" disabled=""><br>
                        <label style="font-weight: 100;
                               float: left;
                               margin: 0px 0px 1px 0px;
                               color: black;
                               font-size: 12px;">outlet name</label>
                        <input type="text" id="outlet_name1" name="outlet_name1" required="" placeholder="Outlet Name"><br>
                        <label style="font-weight: 100;
                               float: left;
                               margin: 0px 0px 1px 0px;
                               color: black;
                               font-size: 12px;">outlet address</label>
                        <input type="text" id="outlet_address1" name="outlet_address1" required="" placeholder="Outlet Address">
                    </form>
                    <div id="buttonon">
                        <div id="btn_cancel">Cancel</div>
                        <div id="btn_delete_edit_outlet" onclick="sub_del_out()">Delete</div>
                        <div id="btn_edit_submit_outlet" onclick="sub_edt_out()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-outlet-close img-replace-edit-outlet">Close</a>
    </div>
</div>
<script>
    function sub_edt_out() {
        var oid1 = document.getElementById("outlet_id1").value;
        var oname1 = document.getElementById("outlet_name1").value;
        var oadd1 = document.getElementById("outlet_address1").value;

        var modal = document.getElementById("myModal_edit_outlet");
        var span = document.getElementsByClassName("close_edit_outlet")[0];
        var push = document.getElementById("push_text_edit_outlet");
        ;
        if (oname1 == "") {
            push.innerHTML = "<p>Outlet name must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (oname1 != "") {
            if (oadd1 == "") {
                push.innerHTML = "<p>Outlet address name must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (oadd1 != "") {
//                var brand_id = window.localStorage.getItem('brand_id');
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = oid1;
                datjson.outlet_name = oname1;
                datjson.outlet_address = oadd1;
                $.ajax({
                    dataType: "json",
                    url: "editou",
                    data: JSON.stringify(datjson),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            alert('success update outlet');
                            location.reload();
                        } else {
                            alert('Failed update outlet');
                        }
                    }
                });
            }
        }
    }
    
    function sub_del_out() {
        var oid1 = document.getElementById("outlet_id1").value;

        var modal = document.getElementById("myModal_edit_outlet");
        var span = document.getElementsByClassName("close_edit_outlet")[0];
        var push = document.getElementById("push_text_edit_outlet");
        ;
            if (oid1 == "") {
                push.innerHTML = "<p>Outlet id must be fill</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (oid1 != "") {
                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_id = oid1;
                $.ajax({
                    dataType: "json",
                    url: "delou",
                    data: JSON.stringify(datjson),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            alert('success delete outlet');
                            location.reload();
                        } else {
                            alert('Failed delete outlet');
                        }
                    }
                });
            }
        
    }
</script>