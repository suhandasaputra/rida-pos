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

    .cd-popup-edit-user {
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
    .cd-popup-edit-user.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-user-container {
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

    .cd-popup-edit-user-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-user-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-user-container .cd-buttons-add-category div {
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
    .cd-popup-edit-user-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-user-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-user-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-user-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-user-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-user-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-user-container .cd-popup-edit-user-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-user-container .cd-popup-edit-user-close::before, .cd-popup-edit-user-container .cd-popup-edit-user-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-user-container .cd-popup-edit-user-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-user-container .cd-popup-edit-user-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-user-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-user-container {
            margin: 8em auto;
        }
    }
    #label_edit_user {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_edit_user{
        display: flex;
        justify-content: center;
        align-content: center;
    }

    #box2_edit_user {
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
    #btn_edit_submit_user {
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
    #btn_edit_submit_user:hover {
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
    .close_edit_user {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_user:hover,
    .close_edit_user:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<script>
    jQuery(document).ready(function ($) {
        //open popup provide password

        $('#table_user').on('click', 'td', function () {
            var $row = $(this).closest("tr");    // Find the row
//            console.log('ini dta satu row : '+JSON.stringify($row.find(".outlet_id").text()));
            var outlet_id = $row.find(".outlet_id").text(); //find the text
            var user_name = $row.find(".user_name").text(); // Find the text
            var user_id = $row.find(".user_id").text(); // Find the text
            var phonenumber = $row.find(".phonenumber").text(); //find the text
            var userlevel_1 = $row.find(".userlevel").text(); // Find the text

            document.getElementById("user_name_edit_user").value = user_name;
            document.getElementById("user_id_edit_user").value = user_id;
            document.getElementById("phonenumber_edit_user").value = phonenumber;
            document.getElementById("outlet_id_edit_user").value = outlet_id;
            if (userlevel_1 === 'waiter') {
                document.getElementById("userlevel_edit_user").selectedIndex = "1";
            } else if (userlevel_1 === 'kasir') {
                document.getElementById("userlevel_edit_user").selectedIndex = "2";
            } else if (userlevel_1 === 'manager') {
                document.getElementById("userlevel_edit_user").selectedIndex = "3";
            } else if (userlevel_1 === 'owner') {
                document.getElementById("userlevel_edit_user").selectedIndex = "4";
            }

            if (userlevel === 'manager') {
                document.getElementById("option_owner").style.visibility = "hidden";
                if (userlevel_1 === 'manager') {
                    document.getElementById("btn_delete").style.visibility = "hidden";
                    document.getElementById("btn_edit_submit_user").style.cssText = "position: absolute;margin-left: 55px;";
                } else {
                    document.getElementById("btn_delete").style.visibility = "visible";
                    document.getElementById("btn_edit_submit_user").style.cssText = "position: unset;margin-left: 0px;";
                }
            }
            if (userlevel === 'owner') {
                if (userlevel_1 !== 'owner') {
                    document.getElementById("label_role").style.visibility = "visible";                    
                    document.getElementById("userlevel_edit_user").style.visibility = "visible";
                    document.getElementById("option_owner").style.visibility = "hidden";
                } else {
                    document.getElementById("label_role").style.visibility = "hidden";
                    document.getElementById("userlevel_edit_user").style.visibility = "hidden";
                }
            }
            $('.cd-popup-edit-user').addClass('is-visible');
        });


        //close popup provide password
        $('.cd-popup-edit-user').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-user-close') || $(event.target).is('.cd-popup-edit-user')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_edit_user")[0].reset();

            }
        });
        //close popup when clicking the esc keyboard button provide password
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-user').removeClass('is-visible');
            }
        });
    });
</script>

<div class="cd-popup-edit-user" role="alert">
    <div class="cd-popup-edit-user-container" style="color: #29B19C;">
        <label id="label_edit_user">Edit Employee</label>
        <div id="boxx_edit_user">
            <div id="box2_edit_user">
                <div id="input_edit_user">
                    <form id="form_edit_user">
                        <div id="myModal_edit_user" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_user">&times;</span>
                                <div id="push_text_edit_user"></div>
                            </div>
                        </div>
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">email</label><input readonly="" type="email" id="user_id_edit_user" name="user_id_edit_user" required="" placeholder="Email" style="background-color: azure;" disabled="">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">outlet</label><input type="text" readonly="" id="outlet_id_edit_user" name="outlet_id_edit_user" style="background-color: azure;" disabled="">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">full name</label><input type="text" id="user_name_edit_user" name="user_name_edit_user" required="" placeholder="Full Name">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black">phone</label><input type="number" id="phonenumber_edit_user" name="phonenumber_edit_user" required="" placeholder="Phone">
                        <label style="margin-bottom: 0px; font-size: 12px; float: left; font-weight: 100; color: black" id="label_role">Role</label><select id="userlevel_edit_user" style="width: 215px; padding: 0px; margin-top: 5px;" name="userlevel_edit_user">
                            <option selected disabled value="">Select Role</option>
                            <option value="1">Waiter</option>
                            <option value="2">Kasir</option>
                            <option value="3">Manager</option>
                            <option value="4" id="option_owner">Owner</option>
                        </select>
                    </form>
                    <div id="buttonon">
                        <div id="btn_delete" onclick="sub_del_user()">Delete</div>
                        <div id="btn_edit_submit_user" onclick="sub_edt_user()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-user-close img-replace-edit-customer">Close</a>
    </div>
</div>
<script>
    function sub_edt_user() {
        var user_name_edit_user = document.getElementById("user_name_edit_user").value;
        var user_id_edit_user = document.getElementById("user_id_edit_user").value;
        var phonenumber_edit_user = document.getElementById("phonenumber_edit_user").value;
        var outlet_id_edit_user = document.getElementById("outlet_id_edit_user").value;
        var userlevel_edit_user = document.getElementById("userlevel_edit_user").value;


        var modal = document.getElementById("myModal_edit_user");
        var span = document.getElementsByClassName("close_edit_user")[0];
        var push = document.getElementById("push_text_edit_user");
        ;
        if (user_name_edit_user == "") {
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
        } else if (user_name_edit_user != "") {
            if (user_id_edit_user == "") {
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
            } else if (user_id_edit_user != "") {
                if (phonenumber_edit_user == "") {
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
                } else if (phonenumber_edit_user != "") {
                    if (outlet_id_edit_user == "") {
                        push.innerHTML = "<p>Outlet must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (outlet_id_edit_user != "") {
                        if (userlevel_edit_user == "") {
                            push.innerHTML = "<p>User Role must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (userlevel_edit_user != "") {
//                            var brand_id = window.localStorage.getItem('brand_id');
                            var datjson = new Object();
                            datjson.brand_id = brand_id;
                            datjson.user_name_edit_user = user_name_edit_user;
                            datjson.user_id_edit_user = user_id_edit_user;
                            datjson.phonenumber_edit_user = phonenumber_edit_user;
                            datjson.outlet_id_edit_user = outlet_id_edit_user;
                            datjson.userlevel_edit_user = userlevel_edit_user;
                            console.log('ini adalah log nya : '+ JSON.stringify(datjson));
                            $.ajax({
                                dataType: "json",
                                url: "edituser",
                                data: JSON.stringify(datjson),
                                type: 'post',
                                success: function (response) {
                                    if (response.resp_code == 0000) {
                                        alert('success update user');
                                        location.reload();
                                    } else {
                                        alert('Failed update user');
                                    }
                                }
                            });
                        }
                    }
                }
            }
        }
    }

    function sub_del_user() {
        var user_id_edit_user = document.getElementById("user_id_edit_user").value;
        var outlet_id_edit_user = document.getElementById("outlet_id_edit_user").value;

        if (user_id_edit_user == "") {
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
        } else if (user_id_edit_user != "") {
//            var brand_id = window.localStorage.getItem('brand_id');
            var datjson = new Object();
            datjson.brand_id = brand_id;
            datjson.user_id_edit_user = user_id_edit_user;
            datjson.outlet_id_edit_user = outlet_id_edit_user;
            $.ajax({
                dataType: "json",
                url: "deluser",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        alert('Success Delete User');
                        location.reload();
                    } else {
                        alert('Failed Delete User');
                    }
                }
            });
        }
    }
</script>