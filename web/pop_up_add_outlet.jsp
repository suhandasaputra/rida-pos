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

    .img-replace-add-outlet {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-outlet {
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
    .cd-popup-add-outlet.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-outlet-container {
        position: relative;
        width: 90%;
        height: 300px;
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

    .cd-popup-add-outlet-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-outlet-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-outlet-container .cd-buttons-add-category div {
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
    .cd-popup-add-outlet-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-outlet-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-outlet-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-outlet-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-outlet-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-outlet-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-outlet-container .cd-popup-add-outlet-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-outlet-container .cd-popup-add-outlet-close::before, .cd-popup-add-outlet-container .cd-popup-add-outlet-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-outlet-container .cd-popup-add-outlet-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-outlet-container .cd-popup-add-outlet-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-outlet-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-outlet-container {
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
    #btn_submit_outlet {
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
    #btn_submit_outlet:hover {
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
</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup provide password
        $('#add_outlet').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-outlet').addClass('is-visible');
        });

        //close popup provide password
        $('.cd-popup-add-outlet').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-outlet-close') || $(event.target).is('.cd-popup-add-outlet') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_outlet")[0].reset();
            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-outlet').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-add-outlet" role="alert">
    <div class="cd-popup-add-outlet-container">
        <label id="label_add_outlet">Add Outlet</label>
        <div id="boxx_add_outlet">
            <div id="box2_add_outlet">
                <div id="input_add_outlet">
                    <form id="form_add_outlet">
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text"></div>
                            </div>
                        </div>
                        <input type="text" id="outlet_name_add_outlet" name="outlet_name_add_outlet" required="" placeholder="Outlet Name">
                        <input type="text" id="outlet_address_add_outlet" name="outlet_address_add_outlet" required="" placeholder="Outlet Address">
                        <div id="buttonon">
                            <div id="btn_cancel">Cancel</div>
                            <div id="btn_submit_outlet" onclick="sub_out()">Save</div>
                        </div>
                    </form>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-outlet-close img-replace-add-outlet">Close</a>
    </div>
</div>
<script>
    function sub_out() {
        var outlet_name_add_outlet = document.getElementById("outlet_name_add_outlet").value;
        var outlet_address_add_outlet = document.getElementById("outlet_address_add_outlet").value;


        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        var push = document.getElementById("push_text");
        ;
        if (outlet_name_add_outlet == "") {
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
        } else if (outlet_name_add_outlet != "") {
            if (outlet_address_add_outlet == "") {
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
            } else if (outlet_address_add_outlet != "") {
//                var brand_id = window.localStorage.getItem('brand_id');

                var datjson = new Object();
                datjson.brand_id = brand_id;
                datjson.outlet_name = outlet_name_add_outlet;
                datjson.outlet_address = outlet_address_add_outlet;

                $.ajax({
                    dataType: "json",
                    url: "aou",
                    data: JSON.stringify(datjson),
                    type: 'post',
                    success: function (response) {
                        if (response.resp_code == 0000) {
                            alert('success add outlet');
                            location.reload();
                            $('.cd-popup-add-outlet').removeClass('is-visible');
                        } else {
                            alert('Failed update outlet');
                            $('.cd-popup-add-outlet').removeClass('is-visible');
                        }
                    }
                });
            }
        }
    }
</script>