<%-- 
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-expense
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-expense {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-expense {
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
    .cd-popup-expense.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-expense-container {
        position: relative;
        width: 90%;
        height: 450px;
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

    .cd-popup-expense-container .cd-buttons-expense:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-expense-container .cd-buttons-expense li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-expense-container .cd-buttons-expense div {
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
    .cd-popup-expense-container .cd-buttons-expense li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-expense-container .cd-buttons-expense li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-expense-container .cd-buttons-expense li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-expense-container .cd-buttons-expense li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-expense-container .cd-buttons-expense li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-expense-container .cd-buttons-expense li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-expense-container .cd-popup-expense-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-expense-container .cd-popup-expense-close::before, .cd-popup-expense-container .cd-popup-expense-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-expense-container .cd-popup-expense-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-expense-container .cd-popup-expense-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-expense-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-expense-container {
            margin: 8em auto;
        }
    }
    #label_add_user {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_add_user{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_add_user {
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

    select {
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
    #btn_submit_user {
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
    #btn_submit_user:hover {
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
        if (userlevel === 'owner') {
            $.getJSON('opt?action=option_outlet', {brand_id: brand_id}, function (data) {
                var options = '<option value="" selected disabled>Select Outlet</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].outlet_id + '">' + data[i].outlet_name + '</option>';
                }
                $("select#outlet_id_addexpense").html(options);
            });
        } else {
            var outlet_id = window.localStorage.getItem('outlet_store_id');
            var outlet_name = window.localStorage.getItem('outlet_store_name');
            var options = '<option value="' + brand_id + outlet_id + '">' + outlet_name + '</option>';
            $("select#outlet_id_addexpense").html(options);
        }
        //close popup provide password
        $('.cd-popup-expense').on('click', function (event) {
            if ($(event.target).is('.cd-popup-expense-close') || $(event.target).is('.cd-popup-expense') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_expense")[0].reset();
            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-expense').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-expense" role="alert">
    <div class="cd-popup-expense-container">
        <label id="label_add_user">Expense</label>
        <div id="boxx_add_user">
            <div id="box2_add_user">
                <div id="input_add_user">
                    <form id="form_expense">
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text"></div>
                            </div>
                        </div>
                        <select id="outlet_id_addexpense" name="outlet_id_addexpense">
                        </select>
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Subject</label>
                        <select id="expense_subject" name="expense_subject">
                            <option value="Payment">Payment</option>
                            <option value="Purchase">Purchase</option>
                            <option value="Other cost">Other cost</option>
                        </select>
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">To</label><input type="text" id="expense_to" name="expense_to">                        
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Amount</label><input type="text" id="expense_amount" name="expense_amount">
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Description</label><textarea id="expense_desc" name="expense_desc"></textarea>
                    </form>
                    <div id="buttonon">
                        <div id="btn_cancel">Cancel</div>
                        <div id="btn_submit_user" onclick="sub_ref()">Submit</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-expense-close img-replace-expense">Close</a>
    </div>
</div>
<script>
    function sub_ref() {
        var user_id = window.localStorage.getItem('user_id');
        var brand = brand_id;
        var outlet = document.getElementById("outlet_id_addexpense").value;
        var user_name = window.localStorage.getItem('user_name');

        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        var push = document.getElementById("push_text");
        ;
        if (outlet === "") {
            push.innerHTML = "<p>outlet must be selected</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            };
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        } else if (outlet !== "") {
            if (document.getElementById("expense_to").value === "") {
                push.innerHTML = "<p>destination must be filled</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                };
                window.onclick = function (event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                };
            } else if (document.getElementById("expense_to").value !== "") {
                if (document.getElementById("expense_amount").value === "") {
                    push.innerHTML = "<p>Amount must be filled</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    };
                    window.onclick = function (event) {
                        if (event.target === modal) {
                            modal.style.display = "none";
                        }
                    };
                } else if (document.getElementById("expense_amount").value !== "") {
                    if (document.getElementById("expense_desc").value === "") {
                        push.innerHTML = "<p>Description must be filled</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        };
                        window.onclick = function (event) {
                            if (event.target === modal) {
                                modal.style.display = "none";
                            }
                        };
                    } else if (document.getElementById("expense_desc").value !== "") {
                        var datjson = new Object();
                        datjson.user_id = user_id;
                        datjson.brand_id = brand_id;
                        datjson.outlet_id = outlet;
                        datjson.user_name = user_name;

                        datjson.expense_subject = document.getElementById("expense_subject").value;
                        datjson.expense_to = document.getElementById("expense_to").value;
                        datjson.expense_amount = document.getElementById("expense_amount").value;
                        datjson.expense_desc = document.getElementById("expense_desc").value;


                        $.ajax({
                            dataType: "json",
                            url: "add_expense",
                            type: 'post',
                            data: JSON.stringify(datjson),
                            success: function (response) {
                                if (response.resp_code == 0000) {
                                    $('#table_expense').DataTable().ajax.reload();
                                    alert('Success Create Expense');
                                    $("#form_expense")[0].reset();
                                    $('.cd-popup-expense').removeClass('is-visible');
                                } else {
                                    alert('failed Create Expense');
                                }
                            }
                        });
                    }
                }
            }
        }
    }
</script>