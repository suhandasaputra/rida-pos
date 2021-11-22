<%-- 
    Document   : signup
    Created on : 20-Feb-2020, 20:57:35
    Author     : suhanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='defaultextend.jsp'%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            #isi {
                align-content: center;
                height: 100%;
                width: 100%;
                display: flex;
                justify-content: center;
            }
            #box1 {
                background-color: white;
                width: 40%;
                /*height: 100%;*/
            }

            #box2 {
                background-color: white;
                width: 40%;
                height: 100%;
            }
            #form {
                /*border: 1px solid #ccc;*/
                padding-top: 180px;
                font-family: Open Sans,sans-serif;
                background-color: white;
                margin: 250px auto;
                margin-top: 100px;
                padding: 10px;
                width: 300px;
                text-align: center;
                height: -webkit-fill-available;
            }
            #title_form {
                color: #29B19C;
                font-family: Open Sans,sans-serif;
                letter-spacing: 6px;
                font-size: 25px;
                font-weight: 600;
            }
            #welcomeback {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #4D4D4D;
                /*opacity: 0.5;*/
                font-weight: 100;
                font-size: 12px;
            }
            input[type="text"],input[type="password"]{
                margin-top: 10px;
                width: 85%;
                letter-spacing: 0;
                color: #4D4D4D;
                /*opacity: 0.5;*/
                font-weight: 100;
                font-size: 11px;
                padding-top: 15px;
                border: 0;
                outline: 0;
                background: transparent;
                border-bottom: 1px solid #4d4d4d57;
            }
            #checkbox_remember {
                display: inline-flex;
                width: 350px;
                margin-left: 15px;
            }
            #forgot_password {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #29B19C;
                font-weight: 100;
                font-size: 12px;
                padding-top: 3px;
                margin-left: 55px;
                cursor:pointer;
            }
            #forgot_password:hover {
                cursor:pointer;
                color: #3dceb7;
            }
            #button_depan {
                margin-top: 40px;
                display: inline-flex;
                width: 250px
            }
            #login_button {
                float: left;
                width: 85px;
                height: 30px;
                background: #29B19C;
                border-radius: 4px;
                /*opacity: 1;*/
                font-weight: 100;
                font-size: 12px;
                color: white;
                padding-top: 7px;
                cursor:pointer;
            }
            #login_button:hover {
                cursor:pointer;
                background: #3dceb7;
            }
            #signup {
                width: 85px;
                height: 30px;
                background: white;
                border: 1px solid #29B19C;
                border-radius: 4px;
                /*opacity: 1;*/
                font-weight: 100;
                font-size: 12px;
                margin-left: 100px;
                color: black;
                padding-top: 7px;
                cursor:pointer;
            }
            #signup:hover {
                cursor:pointer;
                background: #3dceb7;
                color: white;
            }
            #footer {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #29B19C;
                font-weight: 100;
                font-size: 9px;
                position: absolute;
                bottom: 40px;
                margin-left: 80px;
                cursor: pointer;
            }



            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

            }

            /* Modal Content */
            .modal-content {

                display: inline-block;
                background-color: #29B19C;
                margin-left: 140px;
                margin-top: 80px;
                position: fixed;
                padding: 20px;
                border: 1px solid white;
                width: 20%;
                height: 5%;
                padding-top: 4px;
                padding-left: -70px;
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: white;
                font-weight: 100;
                font-size: 14px;    
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


            /*--------------------------------------------------------------------------------*/


            @media only screen and (max-width: 360px) {
                #isi {
                    align-content: center;
                    height: -webkit-fill-available;
                    width: -webkit-fill-available;
                    justify-content: center;
                }
                #box1 {
                    display: none;
                }

                #box2 {
                    background-color: white;
                    height: -webkit-fill-available;
                    width: -webkit-fill-available;
                }

                #form {
                    padding-top: 0px;
                    font-family: Open Sans,sans-serif;
                    background-color: white;
                    margin: 250px auto;
                    margin-top: 100px;
                    padding: 10px;
                    width: 300px;
                    text-align: center;
                    height: -webkit-fill-available;
                }
                #title_form {
                    color: #29B19C;
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 6px;
                    font-size: 25px;
                    font-weight: 600;
                }
                #welcomeback {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #4D4D4D;
                    font-weight: 100;
                    font-size: 12px;
                }
                input[type="text"],input[type="password"]{
                    margin-top: 10px;
                    width: 85%;
                    letter-spacing: 0;
                    color: #4D4D4D;
                    font-weight: 100;
                    font-size: 11px;
                    padding-top: 15px;
                    border: 0;
                    outline: 0;
                    background: transparent;
                    border-bottom: 1px solid #4d4d4d57;
                }
                #checkbox_remember {
                    display: inline-flex;
                    width: 350px;
                    margin-left: 15px;
                }
                #forgot_password {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #29B19C;
                    font-weight: 100;
                    font-size: 12px;
                    padding-top: 3px;
                    margin-left: 75px;
                    cursor:pointer;
                }
                #forgot_password:hover {
                    cursor:pointer;
                    color: #3dceb7;
                }

                #button_depan {
                    margin-top: 40px;
                    display: inline-flex;
                    width: 250px
                }
                #login_button {
                    float: left;
                    width: 85px;
                    height: 30px;
                    background: #29B19C;
                    border-radius: 4px;
                    opacity: 1;
                    font-weight: 100;
                    font-size: 12px;
                    color: white;
                    padding-top: 7px;
                    cursor:pointer;
                }
                #login_button:hover {
                    cursor:pointer;
                    background: #3dceb7;
                }
                #signup {
                    width: 85px;
                    height: 30px;
                    background: white;
                    border: 1px solid #29B19C;
                    border-radius: 4px;
                    font-weight: 100;
                    font-size: 12px;
                    margin-left: 100px;
                    color: black;
                    padding-top: 7px;
                    cursor:pointer;
                }
                #signup:hover {
                    cursor:pointer;
                    background: #3dceb7;
                    color: white;
                }
                #footer {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #29B19C;
                    font-weight: 100;
                    font-size: 9px;
                    position: absolute;
                    bottom: 40px;
                    margin-left: 80px;
                    cursor: pointer;
                }



                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    padding-top: 100px;
                    left: 0;
                    top: 0;
                    width: -webkit-fill-available; 
                    height: -webkit-fill-available; 
                    overflow: auto; 
                    background-color: rgb(0,0,0);
                    background-color: rgba(0,0,0,0.4);

                }


                .modal-content {
                    right: 110px;
                    display: inline-block;
                    background-color: #29B19C;
                    margin-left: 0px;
                    margin-top: 80px;
                    position: fixed;
                    padding: 0px;
                    border: 1px solid white;
                    width: 210px;
                    height: 5%;
                    padding-top: 4px;
                    padding-left: 0px;
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: white;
                    font-weight: 100;
                    font-size: 14px;    
                }


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
            }
        </style>
        <script>
            $(function () {
                //                if (localStorage.chkbx && localStorage.chkbx != '') {
                //                    $('#cb').attr('checked', 'checked');
                $('#user').val(localStorage.user);
                //                } else {
                //                    $('#cb').removeAttr('checked');
                //                }
                //
                //                $('#cb').click(function () {
                //                    if ($('#cb').is(':checked')) {
                //                        // save username
                //                        window.localStorage.setItem('user', $('#user').val());
                //                        window.localStorage.setItem('chkbx', $('#cb').val());
                //                    } else {
                //                        window.localStorage.removeItem('user');
                //                        localStorage.chkbx = '';
                //                    }
                //                });
            });

        </script>
        <title>login</title>
    </head>

    <body>
        <div id="isi">
            <div id="box1">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="image/1_1.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="image/2_1.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="image/3_1.png" alt="Third slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="image/4_1.png" alt="Fourth slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div id="box2">
                <div id="form" align="center">
                    <strong><label id="title_form">RIDAPOS</label></strong><br>
                    <label id="welcomeback">Welcome back! Please login to your account</label>
                    <br><br>
                    <form>                       
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text"></div>
                            </div>
                        </div>
                        <input id="user" name="user" type="text" required="" placeholder="Email/Username">
                        <br>

                        <input id="pass" name="pass" type="password" required="" placeholder="Password" style="margin-left: 20px;">
                        <i class="fa fa-eye-slash" id="show_pass"></i>
                        <br>
                        <br>
                        <br>
                        <div id="checkbox_remember">
                            <!--<input type="checkbox" value="remember" id="cb"><label id="remember">Remember me</label>-->
                            <label id="forgot_password" onclick="forgot()">Forgot Password</label>
                        </div>
                        <div id="button_depan">
                            <div id="login_button" onclick="login()">
                                Sign in
                            </div>
                            <a href="su">
                                <div id="signup">
                                    Sign up
                                </div>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function forgot() {
                window.location.href = "fopa";
            }
            ;
            $("#show_pass").on('click', function () {
                var lihat_dong = $("#pass");
                var lihat_key = $("#show_pass");
                if (lihat_dong.attr("type") === "password") {
                    lihat_dong.attr("type", "text");
                    lihat_key.attr("class", "fa fa-eye");
                } else {
                    lihat_dong.attr("type", "password");
                    lihat_key.attr("class", "fa fa-eye-slash");
                }
            });




            function login() {
                var user = document.getElementById("user").value;
                var pass = document.getElementById("pass").value;
                var modal = document.getElementById("myModal");
                var span = document.getElementsByClassName("close")[0];
                var push = document.getElementById("push_text");
                ;
                if (user == "") {
                    push.innerHTML = "<p>Email / Username must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (user != "") {
                    if (pass == "") {
                        push.innerHTML = "<p>Password must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (pass != "") {
                        var datjson = new Object();
                        datjson.user = user;
                        datjson.pass = pass;
                        $.ajax({
                            contentType: 'application/json',
                            dataType: "json",
                            url: "lgs",
                            data: JSON.stringify(datjson),
                            type: 'post',
                            success: function (response) {
                                if (response.resp_code == 0000) {
                                    if (response.userlevel == 'administrator') {
                                        window.localStorage.setItem('side', 'db_a');
                                        window.localStorage.setItem('user', $('#user').val());
                                        window.localStorage.setItem('user_id', response.user_id);
                                        window.localStorage.setItem('userlevel', response.userlevel);
                                        window.location.href = "db_a";
                                    } else {
                                        window.localStorage.setItem('side', 'db');
                                        window.localStorage.setItem('user', $('#user').val());
                                        window.localStorage.setItem('brand_id', response.brand_id);
                                        window.localStorage.setItem('user_id', response.user_id);
                                        window.localStorage.setItem('userlevel', response.userlevel);
                                        window.localStorage.setItem('user_name', response.user_name);
                                        window.localStorage.setItem('outlet_store_id', response.outlet_id);
                                        window.localStorage.setItem('outlet_store_name', response.outlet_name);
                                        window.location.href = "db";
                                    }

                                } else {
                                    alert('Incorrect Username / Password ');
                                }
                            }
                        });
                    }
                }
            }


            $(document).ready(function () {
                //                var input1 = document.getElementById("pass");
                var input2 = document.getElementById("pass");
                //                input1.addEventListener("keyup", function (event) {
                //                    if (event.keyCode === 13) {
                //                        event.preventDefault();
                //                        login();
                //                    }
                //                });
                input2.addEventListener("keyup", function (event) {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                        login();
                    }
                });
            });
        </script>
    </body>
</html>
