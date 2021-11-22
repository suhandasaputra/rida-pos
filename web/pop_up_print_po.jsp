<%-- 
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>

<div class="cd-popup-edit-contact" role="alert">
    <div class="cd-popup-edit-contact-container">
        <label id="label_edit_contact">Print PO</label>
        <div id="print_plis" style="position: center; border: solid 1px #000">
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

                .img-replace-edit-contact {
                    /* replace text with an image */
                    display: inline-block;
                    overflow: hidden;
                    text-indent: 100%;
                    color: transparent;
                    white-space: nowrap;
                }

                .cd-popup-edit-contact {
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
                .cd-popup-edit-contact.is-visible {
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
                    -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
                    transition: opacity 0.3s 0s, visibility 0s 0s;
                }

                .cd-popup-edit-contact-container {
                    position: relative;
                    width: 90%;
                    height: 550px;
                    max-width: 600px;
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

                .cd-popup-edit-contact-container .cd-buttons-add-category:after {
                    content: "";
                    display: table;
                    clear: both;
                }
                .cd-popup-edit-contact-container .cd-buttons-add-category li {
                    float: left;
                    width: 50%;
                    list-style: none;
                }
                .cd-popup-edit-contact-container .cd-buttons-add-category div {
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
                .cd-popup-edit-contact-container .cd-buttons-add-category li:first-child div {
                    background: #3dceb7;
                    border-radius: 0 0 0 .25em;
                }
                .cd-popup-edit-contact-container .cd-buttons-add-category li:first-child div:hover {
                    background: #52e4cd;
                    border-radius: 0 0 0 .25em;
                }

                .no-touch .cd-popup-edit-contact-container .cd-buttons-add-category li:first-child div:hover {
                    background-color: #fc8982;
                }
                .cd-popup-edit-contact-container .cd-buttons-add-category li:last-child div {
                    background: #b6bece;
                    border-radius: 0 0 .25em 0;
                }
                .cd-popup-edit-contact-container .cd-buttons-add-category li:last-child div:hover {
                    background: #d1d9e8;
                    border-radius: 0 0 .25em 0;
                }
                .no-touch .cd-popup-edit-contact-container .cd-buttons-add-category li:last-child div:hover {
                    background-color: #c5ccd8;
                }
                .cd-popup-edit-contact-container .cd-popup-edit-contact-close {
                    position: absolute;
                    top: 8px;
                    right: 8px;
                    width: 30px;
                    height: 30px;
                }
                .cd-popup-edit-contact-container .cd-popup-edit-contact-close::before, .cd-popup-edit-contact-container .cd-popup-edit-contact-close::after {
                    content: '';
                    position: absolute;
                    top: 12px;
                    width: 14px;
                    height: 3px;
                    background-color: #8f9cb5;
                }
                .cd-popup-edit-contact-container .cd-popup-edit-contact-close::before {
                    -webkit-transform: rotate(45deg);
                    -moz-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    -o-transform: rotate(45deg);
                    transform: rotate(45deg);
                    left: 8px;
                }
                .cd-popup-edit-contact-container .cd-popup-edit-contact-close::after {
                    -webkit-transform: rotate(-45deg);
                    -moz-transform: rotate(-45deg);
                    -ms-transform: rotate(-45deg);
                    -o-transform: rotate(-45deg);
                    transform: rotate(-45deg);
                    right: 8px;
                }
                .is-visible .cd-popup-edit-contact-container {
                    -webkit-transform: translateY(0);
                    -moz-transform: translateY(0);
                    -ms-transform: translateY(0);
                    -o-transform: translateY(0);
                    transform: translateY(0);
                }

                @media only screen and (min-width: 1170px) {
                    .cd-popup-edit-contact-container {
                        margin: 8em auto;
                    }
                }
                #label_edit_contact {
                    width: 100%;
                    margin: 20px;
                    text-align: left;
                }
                #boxx_contact{
                    height: 230px;
                    display: flex;
                    justify-content: center;
                    align-content: center;
                    /*background-color: blue;*/
                }
                #box1_contact {
                    width: 250px;
                    height: 230px;
                    /*background-color: red;*/
                    margin-right: 5px;
                }
                #box2_contact {
                    width: 250px;
                    height: 230px;
                    /*background-color: yellow;*/
                    margin-left: 5px;
                }
                #box3_contact {
                    width: 510px;
                    height: 80px;
                    /*background-color: green;*/
                    /*margin-left: 5px;*/
                }
                input {
                    padding-left: 10px;
                    border: 1px solid #CCC; 
                    border-radius: 3px;
                    /*width: 200px;*/
                    margin-bottom: 5px;
                    border: 0;
                    background: transparent;
                    border-bottom: 1px solid #4d4d4d57;

                }
                textarea {
                    border-radius: 3px;
                    width: 100%;
                    margin-top: 2px;
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
                #lblpritpo1{margin-right: 50px; margin-left: 45px;}
                #lblpritpo2{margin-right: 32px;}
                #lblpritpo3{margin-right: 70px;}

                #prod_name{float: left; width: 150px; margin-right: 10px;}
                #qty{float: left; width: 50px; margin-right: 10px;}
                #price{float: left; width: 100px; margin-right: 10px;}
                #total_price{float: left; width: 100px;}
                #value_nya{display: flex; margin-left: 30px;}


                @media print { 
                    @page { 
                        margin-top: 0; 
                        margin-bottom: 0; 
                    } 
                    body { 
                        padding-top: 72px; 
                        padding-bottom: 72px ; 
                    } 
                }
                @media only screen and (max-width: 400px) {
                    .cd-popup-edit-contact-container {
                        width: 80%;
                        height: 550px;
                    }


                    #boxx_contact{
                        width: fit-content;
                        height: 230px;
                        display: flex;
                        justify-content: center;
                        align-content: center;
                        /*background-color: blue;*/
                    }
                    #box1_contact {
                        width: 185px;
                        height: 230px;
                        /*background-color: red;*/
                        margin-right: 5px;
                        margin-left: 5px;
                    }
                    #box2_contact {
                        width: 185px;
                        height: 230px;
                        /*background-color: yellow;*/
                        margin-left: 5px;
                    }
                    #box3_contact {
                        width: 380px;
                        height: 80px;
                        font-size: 12px;
                    }
                    #lblpritpo1{margin-right: 50px; margin-left: 25px;}
                    #lblpritpo2{margin-right: 32px;}
                    #lblpritpo3{margin-right: 70px;}

                    #prod_name{float: left; width: 120px; margin-right: 10px;}
                    #qty{float: left; width: 50px; margin-right: 10px;}
                    #price{float: left; width: 80px; margin-right: 10px;}
                    #total_price{float: left; width: 90px;}
                    #value_nya{display: flex; margin-left: 10px;}
                }
            </style>
            <div id="header_invoice" style="background-color: #b6bece; height: 130px;">
                <label id="type_inv" style="margin-top: 5px;
                       padding-left: 10px;
                       border: 1px solid black;
                       height: 30px;
                       padding-right: 10px;">
                </label>
                <br>
                <div id="inv_str" style="display: inline-flex; height: 25px;"><label style="font-weight: 600; font-size: 20px;">INVOICE NUMBER :</label>#<div id="invoice_val" style="font-size: 18px"></div></div><br>
                <div id="out_str" style="display: inline-flex; height: 20px;"><label id="buyer_outlet">Outlet :</label><div id="outlet_val"></div></div>
                <label id="date_str" style="font-weight: 600; display: block"></label>
            </div>
            <div id="bungkus" style="display: inline-block;">
                <div id="boxx_contact">
                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <div id="push_text"></div>
                        </div>
                    </div>
                    <br>
                    <div id="box1_contact">
                        <label style="float: left">Buyer</label>
                        <input type="text" id="buyer_email" name="buyer_email" required="" placeholder="Buyer Email" style="float: left" readonly="" disabled="">
                        <input type="text" id="buyer_phone" name="buyer_phone" required="" placeholder="Buyer Phone" style="float: left" readonly="" disabled="">
                    </div>
                    <div id="box2_contact">
                        <label style="float: left">Supplier</label>
                        <input type="text" id="sup_name" name="sup_name" required="" placeholder="Supplier Name" style="float: left" readonly="" disabled="">
                        <input type="text" id="sup_email" name="sup_email" required="" placeholder="Supplier Email" style="float: left" readonly="" disabled="">
                        <input type="text" id="sup_phone" name="sup_phone" required="" placeholder="Supplier Phone" style="float: left" readonly="" disabled="">
                        <textarea id="sup_address" name="sup_address" required="" placeholder="Supplier Address" style="float: left; height: 90px" readonly="" disabled=""></textarea>
                    </div>
                </div>
                <div id="box3_contact">
                    <div style="display: flex">
                        <label id="lblpritpo1">Product Name</label>
                        <label id="lblpritpo2">Qty</label>
                        <label id="lblpritpo3">Price</label>
                        <label>Total Price</label>
                    </div>
                    <div id="value_nya">
                        <input type="text" id="prod_name" name="prod_name" required="" readonly="" disabled="">
                        <input type="text" id="qty" name="qty" required="" readonly="" disabled="">
                        <input type="text" id="price" name="price" required="" readonly="" disabled="">
                        <input type="text" id="total_price" name="total_price" required="" readonly="" disabled="">
                    </div>
                </div>
            </div>
        </div>
        <input type="button" id="doPrint" value="Print" style="background-color: #CCC;"/>
        <a href="#0" class="cd-popup-edit-contact-close img-replace-edit-contact">Close</a>
    </div>
</div>
<script>
    document.getElementById("doPrint").addEventListener("click", function () {
        var label_old = document.getElementById('label_edit_contact');
        var btn_old = document.getElementById('doPrint');
        var box1_stock = document.getElementById('box1_stock');
        var footer_edit_po = document.getElementById('footer_edit_po');

        label_old.style.display = "none";
        btn_old.style.display = "none";
        box1_stock.style.display = "none";
        footer_edit_po.style.display = "none";

        window.print();

        label_old.style.display = "block";
        btn_old.style.display = "block";
        box1_stock.style.display = "block";
        footer_edit_po.style.display = "block";
    });
</script>