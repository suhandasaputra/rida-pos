<%-- 
    Document   : product
    Created on : Feb 24, 2020, 4:38:43 PM
    Author     : suhanda
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@include file='defaultextend.jsp'%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>RIDAPOS</title>
        <style>
body{
               zoom: 80%;
            }
            .card {
                background-color: white;
            }
            img {
                height: 60px; 
                width: 60px; 
                border-radius: 5px;
            }
            th {
                background-color: #CCC;
            }
            .input-group-append{
                background-color: #f2f4f6;
            }






            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            Hide default HTML checkbox 
            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            The slider 
            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #29b19c;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            Rounded sliders 
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }

            #create_voucher_search {
                background-image: url('/css/searchicon.png');
                background-position: 10px 10px;
                background-repeat: no-repeat;
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 40px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }

            #table_voucher {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #table_voucher th, #table_voucher td {
                text-align: left;
                padding: 12px;
            }

            #table_voucher tr {
                border-bottom: 1px solid #ddd;
            }

            #table_voucher tr.header, #table_voucher tr:hover {
                background-color: #f1f1f1;
            }
            .sort_filter {
                padding-left: 10px;
                padding-right: 10px;
                cursor: pointer;
            }
            .sort_filter:hover {
                background-color: #3dceb7;
            }
            #refresh_button {
                background-color: #29B19C;
                height: 25px;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                color: white;
                border-radius: 3px;
                padding: 0px 5px 0px 5px;
            }
            #refresh_button:hover {
                background-color: #3dceb7;
            }









            #label_add_category {
                width: 100%;
                margin: 20px;
                text-align: left;
            }
            #boxx_category{
                display: flex;
                justify-content: center;
                align-content: center;
            }
            #box1_discount {
                cursor: pointer;
                width: 500px;
                height: 400px;
                align-content: center;
                text-align: center;
                margin-right: 5px;
                background-color: white;
                border-radius: 5px;
            }
            #box1_content {
                width: 300px;
                /*height: 400px;*/
                /*background-color: green;*/
                display: inline-block;
            }
            #box2_discount {
                width: 500px;
                /*height: auto;*/
                margin-left: 5px;
                /*background-color: yellow;*/
                border-radius: 5px;

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
            #buttonon_edit_voucher {
                color: white;
                margin-top: 10px;
                display: flex;
                float: left;
            }
            #btn_cancel_create_discount {
                cursor: pointer;
                width: 90px;
                height: 35px;
                background-color: #a7a0a0;
                border: 1px solid #c52d18;
                /*margin-right: 20px;*/
                border-radius: 3px;
                color: #c52d18;

            }
            #btn_save_create_discount {
                cursor: pointer;
                width: 90px;
                height: 35px;
                background-color: #29B19C;
                border: 1px solid #CCC;
                margin-left: 15px;
                border-radius: 3px;
            }

            #btn_cancel_create_discount:hover {
                background-color: #c52d18;
                color: white;
            }
            #btn_save_create_discount:hover {
                background-color: #c52d18;
                color: white;
            }







            #table_item_create_discount th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_item_create_discount {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            #table_item_create_discount th {
                text-align: left;
                padding: 12px;
            }
            #table_item_create_discount td {
                text-align: left;
                padding: 12px;
                cursor: pointer;
                border: 1px #DDD solid; 
            }
            #table_outlet_create_voucher th {
                background-color: #ACACAC;
                color: white;
                font-weight: 100;
            }
            #table_outlet_create_voucher {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 12px;
            }
            #table_outlet_create_voucher th {
                text-align: left;
                padding: 12px;
            }
            #table_outlet_create_voucher td {
                text-align: left;
                padding: 12px;
                cursor: pointer;
                border: 1px #DDD solid; 
            }
            .selected {
                background-color: brown;
                color: #FFF;
            }

            #table_item_create_discount tr {
                border-bottom: 1px solid #ddd;
            }

            #table_outlet_create_voucher tr {
                border-bottom: 1px solid #ddd;
            }

            .sort_filter {
                padding-left: 10px;
                padding-right: 10px;
                cursor: pointer;
            }
            .sort_filter:hover {
                background-color: #3dceb7;
            }
            #refresh_button {
                background-color: #29B19C;
                height: 25px;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                color: white;
                border-radius: 3px;
                padding: 0px 5px 0px 5px;
            }
            #refresh_button:hover {
                background-color: #3dceb7;
            }
        </style>
        <script>
            var user_id = window.localStorage.getItem('user_id');
            jQuery(document).ready(function ($) {
                document.getElementById("edit_voucher_id").value = "${sessionScope.edit_voucher_id}";
                document.getElementById("edit_voucher_name").value = "${sessionScope.edit_voucher_name}";
                document.getElementById("edit_voucher_code").value = "${sessionScope.edit_voucher_code}";
                document.getElementById("edit_voucher_value").value = "${sessionScope.edit_voucher_value}";
                document.getElementById("edit_voucher_limit").value = "${sessionScope.edit_voucher_limit}";
                document.getElementById("edit_voucher_date_from").value = "${sessionScope.edit_voucher_startdate}";
                document.getElementById("edit_voucher_date_to").value = "${sessionScope.edit_voucher_enddate}";
            });
        </script> 
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <%@include file='header.jsp'%>
            <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@include file='sidebar_left.jsp'%>
            <!--end sidebar-->
            <div class="content-wrapper">
                <label id="label_add_category">Edit Voucher</label>
                <div id="boxx_category">
                    <div id="box1_discount">
                        <div id="box1_content">
                            <form>
                                <div id="myModal_voucher_edit" class="modal">
                                    <div class="modal-content">
                                        <span class="close_edit_voucher">&times;</span>
                                        <div id="push_text_edit_voucher"></div>
                                    </div>
                                </div>
                                <label hidden="" style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px;">Voucher id</label>
                                <input readonly="" hidden="" type="text" placeholder="Voucher Id" style="width: 300px;" id="edit_voucher_id" name="edit_voucher_id"><br>
                                <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px; margin-top: 20px;">Voucher Name</label>
                                <input type="text" placeholder="Voucher Name" style="width: 300px;" id="edit_voucher_name" name="edit_voucher_name">
                                <label style="font-size: 10px; font-weight: 100; float: left; margin-bottom: 0px;">Voucher Code</label>
                                <input type="text" placeholder="Voucher Code" style="width: 300px;" id="edit_voucher_code" name="edit_voucher_code"><br>
                                <label style="margin-bottom: 0px; font-size: 10px; font-weight: 100; float: left;">Value</label>
                                <input type="number" placeholder="Value IDR" style="width: 300px; float: left;" id="edit_voucher_value" name="edit_voucher_value"><br>
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">Item Limit</label>
                                <input type="number" placeholder="Item Limit" style="width: 300px; float: left;" id="edit_voucher_limit" name="edit_voucher_limit"><br>
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">From</label>
                                <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="edit_voucher_date_from" name="edit_voucher_date_from">
                                <label style="margin-bottom: 0px; font-size: 10px; float: left; font-weight: 100">To</label>
                                <input type="date" style="width: 300px; float: left; margin-right: 200px;" id="edit_voucher_date_to" name="edit_voucher_date_to">
                            </form>
                            <div id="buttonon_edit_voucher">
                                <div id="btn_cancel_create_discount"><a href="dis" style="color: white">Cancel</a></div>
                                <div id="btn_save_create_discount" onclick="sub_del_voucher()">Delete</div>
                                <div id="btn_save_create_discount" onclick="sub_save_voucher()">Save</div>
                            </div>
                            <div id="msgbox"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- Main Footer -->
            <%@include file='footer.jsp'%>
        </div>
    </body>
    <script>
        function sub_del_voucher() {
            var edit_voucher_id = document.getElementById("edit_voucher_id").value;
            var modal = document.getElementById("myModal_voucher_edit");
            var span = document.getElementsByClassName("close_edit_voucher")[0];
            var push = document.getElementById("push_text_edit_voucher");
            ;
            if (edit_voucher_id == "") {
                push.innerHTML = "<p>Voucher ID must be fill</p>";
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
                datjson3.voucher_id = edit_voucher_id;
                datjson3.user_id = user_id;
                datjson3.brand_id = brand_id;
                $.ajax({
                    url: "del_vou",
                    type: 'post',
                    dataType: "json",
                    data: JSON.stringify(datjson3),
                    contentType: 'application/json',
                    success: function (data) {
                        if (data.resp_code == 0000) {
                            window.location.href = 'dis';
                            alert('success delete voucher ' + edit_voucher_id);
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
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (edit_voucher_name != "") {
                if (edit_voucher_code == "") {
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
                } else if (edit_voucher_code != "") {
                    if (edit_voucher_value == "") {
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
                    } else if (edit_voucher_value != "") {
                        if (edit_voucher_limit == "") {
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
                        } else if (edit_voucher_limit != "") {
                            if (edit_voucher_date_from == "") {
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
                            } else if (edit_voucher_date_from != "") {
                                if (edit_voucher_date_to == "") {
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
                                } else if (edit_voucher_date_to != "") {
                                    var datjson = new Object();
                                    datjson.user_id = user_id;
                                    datjson.brand_id = brand_id;

                                    datjson.edit_voucher_id = edit_voucher_id;
                                    datjson.edit_voucher_name = edit_voucher_name;
                                    datjson.edit_voucher_code = edit_voucher_code;
                                    datjson.edit_voucher_value = edit_voucher_value;
                                    datjson.edit_voucher_limit = edit_voucher_limit;
                                    datjson.edit_voucher_date_from = edit_voucher_date_from;
                                    datjson.edit_voucher_date_to = edit_voucher_date_to;

                                    $.ajax({
                                        dataType: "json",
                                        url: "ed_vou",
                                        type: 'post',
                                        data: JSON.stringify(datjson),
                                        success: function (response) {
                                            if (response.resp_code == 0000) {
                                                alert('Success update voucher ' + edit_voucher_name);
                                                window.location.href = "dis";
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

    </script>
</html>
