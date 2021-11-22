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
            #fl_name {
                display: flex;
            }
            input[type="text"],input[type="password"]{
                margin-top: 10px;
                width: 80%;
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
            #checkbox_agree {
                margin-left: 40px;
                display: inline-flex;
                width: 350px
            }
            #cb {
                width: 20px;
            }
            #agree {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #29B19C;
                font-weight: 100;
                font-size: 12px;
                cursor:pointer;
            }
            #agree:hover {
                cursor:pointer;
                color: #3dceb7;
            }


            #signup_button {
                display: inline-block;
                align-content: center;
                /*margin-top: 2px;*/
                width: 85px;
                height: 30px;
                background: #29B19C;
                border-radius: 4px;
                /*opacity: 1;*/
                font-weight: 100;
                font-size: 12px;
                color: white;
                padding-top: 5px;
                cursor:pointer;
            }
            #signup_button:hover {
                cursor:pointer;
                background: #3dceb7;
            }

            #already {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #29B19C;
                font-weight: 100;
                font-size: 12px;
                /*margin-top: -40px;*/
                cursor: pointer;
                text-decoration: underline;
            }

            #already:hover {
                cursor:pointer;
                color: #3dceb7;
            }

            #footer {
                font-family: Open Sans,sans-serif;
                letter-spacing: 0;
                color: #29B19C;
                font-weight: 100;
                font-size: 9px;
                position: absolute;
                bottom: 50px;
                margin-left: 80px;
                cursor: pointer;
            }
            #footer:hover {
                cursor:pointer;
                color: #3dceb7;
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
            #brand_category {
                /*opacity: 0.5;*/
                color: #4D4D4D;
                width: 220px;
                border-radius: 4px;
            }


            /*--------------------------------------------------------------------------------*/            

            @media only screen and (max-width: 400px) {
                #isi {
                    align-content: center;
                    height: 100%;
                    width: 100%;
                    display: flex;
                    justify-content: center;
                }
                #box1 {
                    display: none;
                    background-color: white;
                    width: 40%;
                    /*height: 100%;*/
                }

                #box2 {
                    background-color: white;
                    width: -webkit-fill-available;
                    width: -webkit-fill-available;
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
                #fl_name {
                    display: flex;
                }
                input[type="text"],input[type="password"]{
                    margin-top: 10px;
                    width: 80%;
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
                #checkbox_agree {
                    margin-left: 20px;
                    display: inline-flex;
                    width: 350px
                }
                #cb {
                    width: 20px;
                }
                #agree {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #29B19C;
                    font-weight: 100;
                    font-size: 12px;
                    cursor:pointer;
                }
                #agree:hover {
                    cursor:pointer;
                    color: #3dceb7;
                }


                #signup_button {
                    display: inline-block;
                    align-content: center;
                    margin-top: 20px;
                    width: 85px;
                    height: 30px;
                    background: #29B19C;
                    border-radius: 4px;
                    /*opacity: 1;*/
                    font-weight: 100;
                    font-size: 12px;
                    color: white;
                    padding-top: 5px;
                    cursor:pointer;
                }
                #signup_button:hover {
                    cursor:pointer;
                    background: #3dceb7;
                }

                #already {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #29B19C;
                    font-weight: 100;
                    font-size: 12px;
                    margin-top: -40px;
                    /*position: absolute;*/
                    cursor: pointer;
                    text-decoration: underline;
                }

                #already:hover {
                    cursor:pointer;
                    color: #3dceb7;
                }

                #footer {
                    font-family: Open Sans,sans-serif;
                    letter-spacing: 0;
                    color: #29B19C;
                    font-weight: 100;
                    font-size: 9px;
                    position: absolute;
                    bottom: -30px;
                    margin-left: 80px;
                    cursor: pointer;
                }
                #footer:hover {
                    cursor:pointer;
                    color: #3dceb7;
                }
                #brand_category {
                    /*opacity: 0.5;*/
                    color: #4D4D4D;
                    width: 220px;
                    border-radius: 4px;
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
                    width: 250px;
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
            jQuery(document).ready(function ($) {
                $.getJSON('opt?action=option_business', function (data) {
                    var options = '<option disabled="" selected="" value="">Business Sector</option>';
                    for (var i = 0; i < data.length; i++) {
                        options += '<option value="' + data[i].business_id + '">' + data[i].business_name + '</option>';
                    }
                    $("select#brand_category").html(options);
                });
            });
        </script>
        <title>sign up</title>
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
                    <strong><label id="title_form">RIDAPOS</label></strong><br><br>
                    <label id="welcomeback">Please complete to create your account</label>
                    <br><br>
                    <form id="form_nya" style="margin-top: -20px;">
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <div id="push_text"></div>
                            </div>
                        </div>
                        <select id="brand_category" name="brand_category" style="font-size: 13px">
                        </select>
                        <input type="text" required="" placeholder="Full Name(as shown on ID Card)" id="username" name="username">
                        <input type="text" required="" placeholder="Brand Name" id="brandname" name="brandname">
                        <input type="text" required="" placeholder="Phone number" id="phonenumber" name="phonenumber">
                        <input type="text" required="" placeholder="Email" id="email" name="email">
                        <input type="password" required="" placeholder="Create Password" id="pass" name="pass">
                        <input type="password" required="" placeholder="Confirm Password" id="cpass" name="cpass">

                        <br>
                        <br>
                        <div id="checkbox_agree">
                            <input type="checkbox" value="" id="cb"><label id="agree">I agree with term and conditions</label>
                        </div>
                        <div id="signup_button" onclick="signup()">
                            Sign Up
                        </div>
                    </form>
                    <a href="ho">
                        <div id="already" align="center">
                            Already have an account? <b style="font-weight: 600">Sign in</b>
                        </div>
                    </a>
                    <div id="footer" align="center">
                        Term of use. Privacy Policy
                    </div>
                </div>
            </div>
        </div>
        <script>
            function signup() {
                var brand_category = document.getElementById("brand_category").value;
                var username = document.getElementById("username").value;
                var brandname = document.getElementById("brandname").value;
                var phonenumber = document.getElementById("phonenumber").value;
                var email = document.getElementById("email").value;
                var pass = document.getElementById("pass").value;
                var cpas = document.getElementById("cpass").value;
                var agree = document.getElementById("cb").checked;

                var modal = document.getElementById("myModal");
                var span = document.getElementsByClassName("close")[0];
                var push = document.getElementById("push_text");
                ;
                if (brand_category == "") {
                    push.innerHTML = "<p>Select Category Please</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (brand_category != "") {
                    if (username == "") {
                        push.innerHTML = "<p>Username must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (username != "") {
                        if (brandname == "") {
                            push.innerHTML = "<p>Brand Name must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (brandname != "") {
                            if (phonenumber == "") {
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
                            } else if (phonenumber != "") {
                                if (email == "") {
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
                                } else if (email != "") {
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
                                        if (cpas == "") {
                                            push.innerHTML = "<p>Confirm Password must be fill</p>";
                                            modal.style.display = "block";
                                            span.onclick = function () {
                                                modal.style.display = "none";
                                            }
                                            window.onclick = function (event) {
                                                if (event.target == modal) {
                                                    modal.style.display = "none";
                                                }
                                            }
                                        } else if (cpas != "") {
                                            if (pass != cpas) {
                                                push.innerHTML = "<p>Password Not Match</p>";
                                                modal.style.display = "block";
                                                span.onclick = function () {
                                                    modal.style.display = "none";
                                                }
                                                window.onclick = function (event) {
                                                    if (event.target == modal) {
                                                        modal.style.display = "none";
                                                    }
                                                }
                                            } else if (pass == cpas) {
                                                if (agree == false) {
                                                    push.innerHTML = "<p>term and condition must be checked</p>";
                                                    modal.style.display = "block";
                                                    span.onclick = function () {
                                                        modal.style.display = "none";
                                                    }
                                                    window.onclick = function (event) {
                                                        if (event.target == modal) {
                                                            modal.style.display = "none";
                                                        }
                                                    }
                                                } else if (agree == true) {
//                                                                document.getElementById('form_nya').submit();
                                                    var datjson = new Object();
                                                    datjson.brand_category = brand_category;
                                                    datjson.username = username;
                                                    datjson.brandname = brandname;
                                                    datjson.phonenumber = phonenumber;
                                                    datjson.email = email;
                                                    datjson.pass = pass;
                                                    $.ajax({
                                                        contentType: 'application/json',
                                                        dataType: "json",
                                                        url: "sgn",
                                                        data: JSON.stringify(datjson),
                                                        type: 'post',
                                                        success: function (response) {
                                                            if (response.resp_code == 0000) {
                                                                window.location.href = "ho";
                                                                alert('Success Create User ID ' + email);
                                                            } else if (response.resp_code == 0002) {
                                                                alert('Duplicate User ID ' + email);
                                                            } else {
                                                                alert('Failed Create User ID ' + email);
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
                    }
                }
            }
        </script>
    </body>
</html>

