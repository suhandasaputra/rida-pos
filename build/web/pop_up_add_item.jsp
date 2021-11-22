<%-- 
    Document   : pop_up_add_item
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .img-replace-add-item {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-add-item {
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
    .cd-popup-add-item.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-add-item-container {
        position: relative;
        width: 90%;
        height: 510px;
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
    .cd-popup-add-item-container .cd-popup-add-item-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-add-item-container .cd-popup-add-item-close::before, .cd-popup-add-item-container .cd-popup-add-item-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-add-item-container .cd-popup-add-item-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-add-item-container .cd-popup-add-item-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-add-item-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-add-item-container {
            margin: 8em auto;
        }
    }
    #label_add_item {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_item{
        display: flex;
        justify-content: center;
        align-content: center;
    }
    #box1_item {
        cursor: pointer;
        width: 215px;
        height: 200px;
        margin-right: 5px;
        border-radius: 5px;
    }
    #box2_item {
        width: 215px;
        height: 200px;
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
    #buttonon_add_item {
        color: white;
        margin-top: 0px;
        display: flex;
    }
    #btn_cancel_add_item {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_save_add_item {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-left: 8px;
        border-radius: 3px;
    }

    #btn_cancel_add_item:hover {
        background-color: #CCC;
    }
    #btn_save_add_item:hover {
        background-color: #CCC;
    }



    #img_filechooser_item {
        width: 215px;
        height: 200px;
    }
    select {
        padding-left: 10px;
        border: 1px solid #CCC; 
        border-radius: 3px;
        width: 100%;
        margin-bottom: 10px;

    }






    .switch_item {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    /* Hide default HTML checkbox */
    .switch_item input {
        opacity: 0;
        width: 0;
        height: 0;
    }














    @media only screen and (max-width: 400px) {
        #box1_item {
            cursor: pointer;
            width: 190px;
            height: 200px;
            margin-right: 5px;
            border-radius: 5px;
        }
        #box2_item {
            width: 190px;
            height: 200px;
        }
        #img_filechooser_item {
            width: 190px;
            height: 200px;
        }
    }
</style>


<script>
    jQuery(document).ready(function ($) {
        $('#outlet_id').change(function (event) {
            var outlet_id = $("select#outlet_id").val();
            $.getJSON('opt?action=option_category', {brand_id: brand_id, outlet_id: outlet_id}, function (data) {
                var options = '<option selected disabled value="">Select Category</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                }
                $("select#category_name_item").html(options);
//                    $("select#category_name_edit_item").html(options);
            });
        });


        //open popup add item
        $('#add_item_text').on('click', function (event) {
            event.preventDefault();
            $('.cd-popup-add-item').addClass('is-visible');
        });

        //close popup add item
        $('.cd-popup-add-item').on('click', function (event) {
            if ($(event.target).is('.cd-popup-add-item-close') || $(event.target).is('.cd-popup-add-item') || $(event.target).is('#btn_cancel_add_item')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#formho_add_item")[0].reset();
                $('#img_filechooser_item').prop('src', 'image/upload_icon.jpeg');
            }
        });
        //close popup when clicking the esc keyboard button add item
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-add-item').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-add-item" role="alert">
    <div class="cd-popup-add-item-container">
        <label id="label_add_item">Add Item</label>
        <div id="push_text1"></div>
        <div id="boxx_item">
            <div id="box1_item">
                <img id="img_filechooser_item" src="image/upload_icon.jpeg">
            </div>
            <div id="formhi_item">
                <input id="file-input-item" name="file1" type="file" onchange="readURLItem(this)" style="display: none"/>
            </div>

            <div id="box2_item">
                <div id="input_item">
                    <form id="formho_add_item">
                        <div id="myModal_add_item" class="modal">
                            <div class="modal-content">
                                <span class="close_add_item">&times;</span>
                                <div id="push_text_add_item"></div>
                            </div>
                        </div>
                        <select id="outlet_id" class="form-control select2" style="padding: 2px 2px 2px 5px; height: 30px;" name="outlet_id">
                        </select>
                        <select id="category_name_item" class="form-control select2" style="padding: 2px 2px 2px 5px; height: 30px;" name="category_name_item">
                            <option selected disabled value="">Select Category</option>
                        </select>
                        <input type="text" id="item_name" name="item_name" required="" placeholder="Item name">
                        <input type="number" id="sku" name="sku" placeholder="Sku/Product code" required="">
                        <input type="number" name="item_price" id="item_price" placeholder="Price"/>
                        <input type="number" name="item_barcode" id="item_barcode" placeholder="Barcode"/>
                        <textarea id="item_description" name="item_description" required="" placeholder="Description" style="height: 60px; margin-top: -2px;"></textarea>
                        <label class="switch_item" style="float: left"><input type="checkbox" id="item_receive_stock" name="item_receive_stock" onclick="checkvalue()"><span class="slider round"></span></label><label style="color: #29B19C; margin-left: -30px; margin-top: 5px;">Receive Stock</label>
                        <input type="number" placeholder="input stock" id="stock_beginning" min="0" style="visibility: hidden">
                        <input hidden="" class="form-control" type="text" readonly name="img_item" id="img_item"/>
                    </form>
                    <div id="buttonon_add_item">
                        <div id="btn_cancel_add_item">Cancel</div>
                        <div id="btn_save_add_item">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-add-item-close img-replace-add-item">Close</a>
    </div>
</div>
<script>
    function readURLItem(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {

                var layar = window.screen.availWidth;
                if (layar < 400) {
                    $('#img_filechooser_item')
                            .attr('src', e.target.result)
                            .width(190)
                            .height(200);
                } else if (layar > 400) {
                    $('#img_filechooser_item')
                            .attr('src', e.target.result)
                            .width(215)
                            .height(200);
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    if (window.File && window.FileReader && window.FileList && window.Blob) {
        document.getElementById('file-input-item').addEventListener('change', handleFileSelectItem, false);
    } else {
        alert('The File APIs are not fully supported in this browser.');
    }
    function handleFileSelectItem(evt) {
        var f = evt.target.files[0]; // FileList object
        var reader = new FileReader();
        // Closure to capture the file information.
        reader.onload = (function (theFile) {
            return function (e) {
                var binaryData = e.target.result;
                //Converting Binary Data to base 64
                var base64String = window.btoa(binaryData);
                //showing file converted to base64
                document.getElementById('img_item').value = base64String;
//                alert('sukses convert gambar');
            };
        })(f);
        // Read in the image file as a data URL.
        reader.readAsBinaryString(f);
    }

    function checkvalue() {
        var status_receive = document.getElementById("item_receive_stock").checked;
        var stockbegin = document.getElementById("stock_beginning");


        if (status_receive === false) {
            stockbegin.style.visibility = "hidden";
        } else if (status_receive === true) {
            stockbegin.style.visibility = "visible";
        }
    }

    jQuery(document).ready(function ($) {
//        var brand_id = window.localStorage.getItem('brand_id');
        var user = window.localStorage.getItem('user_id');
        //open popup add item
        $('#box1_item').on('click', function (event) {
            $('#file-input-item').trigger('click');
        });

        $('#btn_save_add_item').on('click', function (event) {

            var category_name_item = document.getElementById('category_name_item').value;
            var item_name = document.getElementById('item_name').value;
            var sku = document.getElementById('sku').value;
            var item_description = document.getElementById('item_description').value;
            var img_item = document.getElementById('img_item').value;
            var item_price = document.getElementById('item_price').value;
            var item_receive_stock = document.getElementById('item_receive_stock').checked;
            var item_barcode = document.getElementById('item_barcode').value;
            var stock_beginning = document.getElementById('stock_beginning').value;
            var outlet_id = document.getElementById('outlet_id').value;
            var brand_id = window.localStorage.getItem('brand_id');
            var user = window.localStorage.getItem('user_id');

            var modal = document.getElementById("myModal_add_item");
            var span = document.getElementsByClassName("close_add_item")[0];
            var push = document.getElementById("push_text_add_item");

            if (category_name_item == "") {
                push.innerHTML = "<p>Categoty Name must be Choose</p>";
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            } else if (category_name_item != "") {
                if (item_name == "") {
                    push.innerHTML = "<p>Item name must be fill</p>";
                    modal.style.display = "block";
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                } else if (item_name != "") {
                    if (sku == "") {
                        push.innerHTML = "<p>Sku must be fill</p>";
                        modal.style.display = "block";
                        span.onclick = function () {
                            modal.style.display = "none";
                        }
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                    } else if (sku != "") {
                        if (item_description == "") {
                            push.innerHTML = "<p>Item Description must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (item_description != "") {
                            if (img_item == "") {
                                push.innerHTML = "<p>Item Image must be choose</p>";
                                modal.style.display = "block";
                                span.onclick = function () {
                                    modal.style.display = "none";
                                }
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            } else if (img_item != "") {
                                if (item_price == "") {
                                    push.innerHTML = "<p>Item Price must be fill</p>";
                                    modal.style.display = "block";
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    }
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    }
                                } else if (item_price != "") {
                                    var datjson = new Object();
                                    datjson.brand_id = brand_id;
                                    datjson.outlet_id = outlet_id;
                                    datjson.user_id = user;
                                    datjson.category_name_item = category_name_item;
                                    datjson.item_name = item_name;
                                    datjson.item_description = item_description;
                                    datjson.img_item = img_item;
                                    datjson.item_price = item_price;
                                    datjson.item_receive_stock = item_receive_stock;
                                    datjson.item_barcode = item_barcode;
                                    datjson.stock_beginning = stock_beginning;
                                    datjson.sku = sku;
                                    $.ajax({
                                        dataType: "json",
                                        url: "add_item",
                                        data: JSON.stringify(datjson),
                                        type: 'post',
                                        success: function (response) {
                                            if (response.resp_code == 0000) {
                                                destroy();
                                                hehe();
                                                alert('success add product');
                                                $("#formho_add_item")[0].reset();
                                                $('#img_filechooser_item').prop('src', 'image/upload_icon.jpeg');
                                                $('.cd-popup-add-item').removeClass('is-visible');
                                            } else {
                                                alert('Failed add product');
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    }
                }
            }
        });
    });
</script>