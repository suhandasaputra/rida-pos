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

    .img-replace-add-user {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-user {
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
    .cd-popup-add-user.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-user-container {
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

    .cd-popup-add-user-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-add-user-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-add-user-container .cd-buttons-add-category div {
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
    .cd-popup-add-user-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-add-user-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-add-user-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-add-user-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-add-user-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-add-user-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-add-user-container .cd-popup-add-user-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-user-container .cd-popup-add-user-close::before, .cd-popup-add-user-container .cd-popup-add-user-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-user-container .cd-popup-add-user-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-user-container .cd-popup-add-user-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-user-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-user-container {
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
        if (userlevel !== 'owner') {
            $('#option_manager').remove();
        }



        //open popup provide password
        $('#add_user').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-user').addClass('is-visible');
        });

        //close popup provide password
        $('.cd-popup-add-user').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-user-close') || $(event.target).is('.cd-popup-add-user') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_add_user")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-user').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-add-user" role="alert">
    <div class="cd-popup-add-user-container">
        <label id="label_add_user">Add Employee</label>
        <div id="boxx_add_user">
            <div id="box2_add_user">
                <div id="input_add_user">
                    <form id="form_add_user">
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text"></div>
                            </div>
                        </div>
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Full Name</label><input type="text" id="user_name" name="user_name" required="" placeholder="Full Name">
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Email</label><input type="email" id="user_id_add_user" name="user_id_add_user" required="" placeholder="Email">
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Phone</label><input type="number" id="phonenumber" name="phonenumber" required="" placeholder="Phone">
                        <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Outlet</label><select id="outlet_id_user" style="width: 215px; padding: 0px; margin-bottom: 5px;" name="outlet_id_user"></select>
                        <label style="margin-bottom: -5px; font-size: 10px; float: left; font-weight: 100">Role</label><select id="level_user" style="width: 215px; padding: 0px; margin-top: 5px;" name="level_user">
                            <option selected disabled value="">Select Role</option>
                            <option value="1">Waiter</option>
                            <option value="2">Kasir</option>
                            <option value="3" id="option_manager">Manager</option>
                        </select>
                    </form>
                    <div id="buttonon">
                        <div id="btn_cancel">Cancel</div>
                        <div id="btn_submit_user" onclick="sub_out()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-user-close img-replace-add-user">Close</a>
    </div>
</div>
<script>
    function sub_out() {
        var user_name = document.getElementById("user_name").value;
        var user_id_add_user = document.getElementById("user_id_add_user").value;
        var phonenumber = document.getElementById("phonenumber").value;
        var outlet_id_user = document.getElementById("outlet_id_user").value;
        var level_user = document.getElementById("level_user").value;

        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        var push = document.getElementById("push_text");
        ;
        if (user_name == "") {
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
        } else if (user_name != "") {
            if (user_id_add_user == "") {
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
            } else if (user_id_add_user != "") {
                if (phonenumber == "") {
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
                } else if (phonenumber != "") {
                    if (outlet_id_user == "") {
                        push.innerHTML = "<p>outlet must be choose</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (outlet_id_user != "") {
                        if (level_user == "") {
                            push.innerHTML = "<p>user role must be choose</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (level_user != "") {
                            var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                            if (user_id_add_user.match(mailformat)) {
                                var datjson = new Object();
                                datjson.brand_id = brand_id;
                                datjson.user_id = user_id_add_user;
                                datjson.user_name = user_name;
                                datjson.phonenumber = phonenumber;
                                datjson.outlet_id_user = outlet_id_user;
                                datjson.level_user = level_user;
                                $.ajax({
                                    dataType: "json",
                                    url: "adduser",
                                    data: JSON.stringify(datjson),
                                    type: 'post',
                                    success: function (response) {
                                        if (response.resp_code == 0000) {
                                            $('#table_user').DataTable().ajax.reload();
                                            alert('success add user');
                                            $('.cd-popup-add-user').removeClass('is-visible');
                                            $("#form_add_user")[0].reset();
                                        } else {
                                            alert('Failed add user');
                                        }
                                    }
                                });
                            } else {
                                push.innerHTML = "<p>Email not valid</p>";
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
    }
</script>