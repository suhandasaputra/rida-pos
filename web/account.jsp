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

            #account_body {
                /*background-color: blue;*/
                height: 300px;
                display: flex;
                color: #29B19C;
            }

            #account_right {
                margin: 10px;
                /*background-color: yellow;*/
                height: 280px;
                width: 600px;
                /*display: flex;*/
            }
            #account_biodata {
                margin-top: 10px;
                /*background-color: purple;*/
                height: 120px;
                width: 600px;
                /*display: flex;*/
            }
            #account_contact {
                margin-top: 10px;
                /*background-color: brown;*/
                height: 120px;
                width: 600px;
                /*display: flex;*/
            }
            .card-body{
                min-height: 705px;
            }
            #full_name{
                position: relative; left: 10px; height: 25px; width: 300px; border: 0;
            }
            #add_account_biodata{
                float: right; right: 170px; position: relative; cursor: pointer;
            }
            #email{
                position: relative; left: 40px; height: 25px; width: 300px; border: 0;
            }
            #phone{
                position: relative; left: 33px; height: 25px; width: 300px; border: 0;
            }
            #edit_account_phone{
                float: right; right: 175px; position: relative; cursor: pointer
            }




            @media only screen and (max-width: 400px) {
                body{
                    zoom: 80%;
                }
                .card {
                    background-color: white;
                }
                #account_body {
                    /*background-color: blue;*/
                    height: 300px;
                    display: flex;
                    color: #29B19C;
                }
                #account_right {
                    margin: 10px;
                    /*background-color: yellow;*/
                    height: 280px;
                    width: -webkit-fill-available;
                    /*display: flex;*/
                }
                #account_biodata {
                    margin-top: 10px;
                    /*background-color: purple;*/
                    height: 120px;
                    width: -webkit-fill-available;
                    /*display: flex;*/
                }
                #account_contact {
                    margin-top: 10px;
                    /*background-color: brown;*/
                    height: 120px;
                    width: -webkit-fill-available;
                    /*display: flex;*/
                }
                .card-body{
                    min-height: 620px;
                }
                #full_name{
                    position: relative; left: 10px; height: 25px; width: 200px; border: 0;
                }
                #add_account_biodata{
                    float: right; right: 50px; position: relative; cursor: pointer;
                }
                #email{
                    position: relative; left: 40px; height: 25px; width: 200px; border: 0;
                }
                #phone{
                    position: relative; left: 33px; height: 25px; width: 200px; border: 0;
                }
                #edit_account_phone{
                    float: right; right: 50px; position: relative; cursor: pointer
                }
            }
        </style>
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
                <div class="content-header">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <p class="text-left" style="color: #29B19C; font-size: 20px;">
                                                        Account
                                                    </p>
                                                </div>
                                            </div>
                                            <!--                                            <div class="row">
                                                                                            <ul class="nav nav-tabs topnav" id="myTab">
                                                                                                <li><a data-toggle="tab" href="#profile" class="active">Profile</a></li>
                                                                                            </ul>
                                                                                        </div>-->
                                            <div class="row">
                                                <div id="account_body" class="tab-content" style="width: 100%">
                                                    <div id="account_right">
                                                        <div id="account_biodata">
                                                            Biodata<br>
                                                            <label style="color: #CCC; font-size: 16px; font-weight: 500">Full Name</label>
                                                            <input type="text" id="full_name" readonly="" disabled="">
                                                            <label id="add_account_biodata">Edit</label>
                                                            <br>
                                                        </div>
                                                        <div id="account_contact">
                                                            Contact<br>
                                                            <label style="color: #CCC;  font-size: 16px; font-weight: 500">Email</label>
                                                            <input type="text" id="email" readonly="" disabled=""><br>
                                                            <label style="color: #CCC;  font-size: 16px; font-weight: 500">Phone</label>
                                                            <input type="text" id="phone" readonly="" disabled="">
                                                            <label id="edit_account_phone">Edit</label><br>
                                                        </div>
                                                        <label id="edit_password" style="cursor: pointer">Change Password</label>
                                                    </div>
                                                    <%@include file='pop_up_edit_biodata.jsp'%>
                                                    <%@include file='pop_up_edit_phone.jsp'%>
                                                    <%@include file='pop_up_edit_password.jsp'%>
                                                </div>    
                                            </div>
                                            <!-- /.row -->
                                        </div>
                                        <!-- ./card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </section>
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
        jQuery(document).ready(function ($) {
            var userlevel = window.localStorage.getItem('userlevel');
            if (userlevel === 'administrator') {
                window.location.href = "ho";
            }

            var user_id = window.localStorage.getItem('user_id');

            var datjson = new Object();
            datjson.user_id = user_id;
            datjson.brand_id = brand_id;

            $.ajax({
                contentType: 'application/json',
                dataType: "json",
                url: "accget?data=" + JSON.stringify(datjson),
                type: 'get',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        var full_name = response.user_name;
                        var email = response.user_id;
                        var phone = response.phonenumber;
                        document.getElementById('full_name').value = full_name;
                        document.getElementById('email').value = email;
                        document.getElementById('phone').value = phone;
                    } else {
                        alert('failed retrieve data');
                    }
                }
            });
        });
    </script>
</html>
