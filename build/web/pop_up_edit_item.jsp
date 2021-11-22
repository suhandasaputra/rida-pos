<%-- 
    Document   : pop_up_add_category
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .img-replace-edit_item {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-item {
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
    .cd-popup-edit-item.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-item-container {
        position: relative;
        width: 90%;
        height: 580px;
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

    .cd-popup-edit-item-container .cd-popup-edit-item-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-item-container .cd-popup-edit-item-close::before, .cd-popup-edit-item-container .cd-popup-edit-item-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-item-container .cd-popup-edit-item-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-item-container .cd-popup-edit-item-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-item-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-item-container {
            margin: 8em auto;
        }
    }
    #label_edit_item {
        width: 100%;
        margin: 20px;
        text-align: left;
    }

    #boxx_edit_item{
        display: flex;
        justify-content: center;
        align-content: center;
    }
    #box1_edit_item {
        cursor: pointer;
        width: 215px;
        height: 200px;
        margin-right: 5px;
        /*background-color: #68f3e9;*/
        border-radius: 5px;
    }

    #box2_edit_item {
        width: 215px;
        height: 200px;
        margin-left: 5px;
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
    #buttonon_edit_item {
        color: white;
        margin-top: 10px;
        display: flex;
    }
    #btn_cancel_edit_item {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }
    #btn_edit_submit_item {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        /*margin-left: 8px;*/
        border-radius: 3px;
    }

    #btn_cancel_edit_item:hover {
        background-color: #CCC;
    }
    #btn_edit_submit_item:hover {
        background-color: #CCC;
    }

    #img_filechooser_edit_item {
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

    /* The Close Button */
    .close_edit_item {
        padding-top: -10px;
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close_edit_item:hover,
    .close_edit_item:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    #btn_delete_edit_item {
        cursor: pointer;
        width: 100px;
        background-color: #a7a0a0;
        border: 1px solid #CCC;
        margin-right: 8px;
        border-radius: 3px;
    }

    #btn_delete_edit_item:hover {
        background-color: #CCC;
    }


    .switch_item_edit_item {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    /* Hide default HTML checkbox */
    .switch_item_edit_item input {
        opacity: 0;
        width: 0;
        height: 0;
    }
    @media only screen and (max-width: 400px) {
        #box1_edit_item {
            cursor: pointer;
            width: 190px;
            height: 200px;
            margin-right: 5px;
            /*background-color: #68f3e9;*/
            border-radius: 5px;
        }

        #box2_edit_item {
            width: 190px;
            height: 200px;
            margin-left: 5px;
            /*background-color: yellow;*/
        }
        #img_filechooser_edit_item {
            width: 190px;
            height: 200px;
        }
    }
</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup provide password

        $('#table_item').on('click', 'td:nth-child(-n+9)', function () {
            var $row = $(this).closest("tr");
            var item_product_code_edit = $row.find(".productcode").text();
            var item_barcode_edit = $row.find(".barcode").text();
            var item_picture_edit = $row.find('img').attr('src');
            var item_name_edit = $row.find(".productname").text();
            var item_category_edit = $row.find(".category").text();
            var item_price_edit = $row.find(".price").text();
            var item_description_edit = $row.find(".detailproduct").text();
            var item_receive_stock_edit = $row.find("#change_receive").is(":checked");
            var outlet_id_edit_item = $row.find(".outlet_id").text();
            document.getElementById("item_product_code_edit").value = item_product_code_edit;
            document.getElementById("category_name_send_edit_item").value = item_category_edit;
            document.getElementById("item_name_edit_item").value = item_name_edit;
            document.getElementById("item_price_edit_item").value = item_price_edit.replace(/,/g, '');
            document.getElementById("item_barcode_edit_item").value = item_barcode_edit;
            document.getElementById("item_description_edit_item").value = item_description_edit;
            document.getElementById("img_item_edit_item").value = '-';
            document.getElementById("outlet_id_edit_item").value = outlet_id_edit_item;


            document.getElementById("outlet_id_edit_item").value = outlet_id_edit_item;

            var img_item = document.getElementById('img_filechooser_edit_item');
            img_item.src = item_picture_edit;
            var re_sto = document.getElementById('item_receive_stock_edit_item');
            re_sto.checked = item_receive_stock_edit;
            var outlet_id = outlet_id_edit_item;
            $.getJSON('opt?action=option_category', {brand_id: brand_id, outlet_id: outlet_id}, function (data) {
                var options = '<option selected disabled value="">' + item_category_edit + '</option>';
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i].category_name + '">' + data[i].category_name + '</option>';
                }
                $("select#category_name_edit_item").html(options);
            });
            $('.cd-popup-edit-item').addClass('is-visible');
        });
    }
    );
    jQuery(document).ready(function ($) {
        //close popup add item
        $('.cd-popup-edit-item').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-item-close') || $(event.target).is('.cd-popup-edit-item') || $(event.target).is('#btn_cancel_edit_item')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
                $("#form_edit_item")[0].reset();
            }
        });
        //close popup when clicking the esc keyboard button add item
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-item').removeClass('is-visible');
            }
        });
    });</script>
<div class="cd-popup-edit-item" role="alert">
    <div class="cd-popup-edit-item-container" style="color: #29B19C;">
        <label id="label_edit_item">Edit Item</label>
        <div id="boxx_edit_item">
            <div id="box1_edit_item">
                <img id="img_filechooser_edit_item" src="image/upload_icon.jpeg">
            </div>
            <div id="formhi_edit_item">
                <input id="file-input-edit-item" type="file" onchange="readURL_edit_item(this)" style="display: none"/>
            </div>
            <div id="box2_edit_item">
                <div id="input_edit_item">
                    <form id="form_edit_item">
                        <div id="myModal_edit_item" class="modal">
                            <div class="modal-content">
                                <span class="close_edit_item">&times;</span>
                                <div id="push_text_edit_item"></div>
                            </div>
                        </div>
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">outlet id</label>
                        <input type="text" id="outlet_id_edit_item" name="outlet_id_edit_item" readonly="" style="background-color: aquamarine">
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">product code</label>
                        <input type="text" readonly="" id="item_product_code_edit" name="item_product_code_edit" required="" style="background-color: aquamarine">
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">category</label>
                        <select id="category_name_edit_item" class="form-control select2" style="padding: 0px; margin: 0px; height: 30px;" name="category_name_edit_item">
                        </select>
                        <input type="text" readonly="" hidden="" id="category_name_send_edit_item" name="category_name_send_edit_item" required="">
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">product name</label>
                        <input type="text" id="item_name_edit_item" name="item_name_edit_item" required="" placeholder="Item name">
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">price</label>
                        <input type="number" name="item_price_edit_item" id="item_price_edit_item" placeholder="Price"/>
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">barcode</label>
                        <input type="text" name="item_barcode_edit_item" id="item_barcode_edit_item" placeholder="Barcode"/>
                        <label style="font-weight: 100;color: black;font-size: 12px; margin: 0px; float: left">description</label>
                        <textarea id="item_description_edit_item" name="item_description_edit_item" required="" placeholder="Description" style="height: 80px; margin: 0px; padding: 0px;"></textarea>
                        <label class="switch_item_edit_item" style="float: left"><input disabled="" type="checkbox" id="item_receive_stock_edit_item" name="item_receive_stock_edit_item"><span class="slider round"></span></label><label style="color: #29B19C; margin-left: -30px; margin-top: 5px;">Receive Stock</label>
                        <input class="form-control" hidden type="text" readonly name="img_item_edit_item" id="img_item_edit_item"/>
                    </form>
                    <div id="buttonon_edit_item">
                        <div id="btn_cancel_edit_item">Cancel</div>
                        <div id="btn_delete_edit_item" onclick="sub_del_item()">Delete</div>
                        <div id="btn_edit_submit_item" onclick="sub_edt_itm()">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-item-close img-replace-edit_item">Close</a>
    </div>
</div>
<script>
//    var brand_id = window.localStorage.getItem('brand_id');
    var user = window.localStorage.getItem('user_id');
    function readURL_edit_item(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {


                var layar = window.screen.availWidth;
                if (layar < 400) {
                    $('#img_filechooser_edit_item')
                            .attr('src', e.target.result)
                            .width(190)
                            .height(200);
                } else if (layar > 400) {
                    $('#img_filechooser_edit_item')
                            .attr('src', e.target.result)
                            .width(215)
                            .height(200);
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    if (window.File && window.FileReader && window.FileList && window.Blob) {
        document.getElementById('file-input-edit-item').addEventListener('change', handleFileSelectitem, false);
    } else {
        alert('The File APIs are not fully supported in this browser.');
    }


    function handleFileSelectitem(evt) {
        var f = evt.target.files[0]; // FileList object
        var reader = new FileReader();
        // Closure to capture the file information.
        reader.onload = (function (theFile) {
            return function (e) {
                var binaryData = e.target.result;
                //Converting Binary Data to base 64
                var base64String = window.btoa(binaryData);
                //showing file converted to base64
                document.getElementById('img_item_edit_item').value = base64String;
//                alert('sukses convert gambar');
            };
        })(f);
        // Read in the image file as a data URL.
        reader.readAsBinaryString(f);
    }

    function sub_edt_itm() {

        var category_name_edit_item = document.getElementById('category_name_edit_item').value;
        var item_product_code_edit = document.getElementById('item_product_code_edit').value;
        var category_name_send_edit_item = document.getElementById('category_name_send_edit_item').value;
        var item_name_edit_item = document.getElementById('item_name_edit_item').value;
        var item_description_edit_item = document.getElementById('item_description_edit_item').value;
        var img_item_edit_item = document.getElementById('img_item_edit_item').value;
        var item_price_edit_item = document.getElementById('item_price_edit_item').value;
        var item_receive_stock_edit_item = document.getElementById('item_receive_stock_edit_item').checked;
        var item_barcode_edit_item = document.getElementById('item_barcode_edit_item').value;
        var outlet_id_edit_item = document.getElementById('outlet_id_edit_item').value;
        var modal = document.getElementById("myModal_edit_item");
        var span = document.getElementsByClassName("close_edit_item")[0];
        var push = document.getElementById("push_text_edit_item");
        if (item_product_code_edit == "") {
            push.innerHTML = "<p>Product Code Must Be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (item_product_code_edit != "") {
            if (item_name_edit_item == "") {
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
            } else if (item_name_edit_item != "") {
                if (item_description_edit_item == "") {
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
                } else if (item_description_edit_item != "") {
                    if (item_price_edit_item == "") {
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
                    } else if (item_price_edit_item != "") {
                        if (item_barcode_edit_item == "") {
                            push.innerHTML = "<p>Item code must be fill</p>";
                            modal.style.display = "block";
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        } else if (item_barcode_edit_item != "") {

                            var datjson = new Object();
                            datjson.item_product_code_edit = item_product_code_edit;
                            datjson.category_name_send_edit_item = category_name_send_edit_item;
                            datjson.item_name_edit_item = item_name_edit_item;
                            datjson.item_description_edit_item = item_description_edit_item;
                            datjson.img_item_edit_item = img_item_edit_item;
                            datjson.item_price_edit_item = item_price_edit_item;
                            datjson.item_receive_stock_edit_item = item_receive_stock_edit_item;
                            datjson.item_barcode_edit_item = item_barcode_edit_item;
                            datjson.outlet_id_edit_item = outlet_id_edit_item;
                            datjson.category_name_edit_item = category_name_edit_item;
                            datjson.brand_id = brand_id;
                            datjson.user_id = user;
                            $.ajax({
                                dataType: "json",
                                url: "edit_item",
                                data: JSON.stringify(datjson),
                                type: 'post',
                                success: function (response) {
                                    if (response.resp_code == 0000) {
                                        destroy();
                                        hehe();
                                        alert('Success update product');
                                        $('.cd-popup-edit-item').removeClass('is-visible');
                                    } else {
                                        alert('Failed Update product');
                                    }
                                }
                            });
                        }
                    }
                }
            }
        }
    }


    function sub_del_item() {
        var outlet_id_edit_item = document.getElementById('outlet_id_edit_item').value;
        var item_product_code_edit = document.getElementById("item_product_code_edit").value;
        var modal = document.getElementById("myModal_edit_item");
        var span = document.getElementsByClassName("close_edit_item")[0];
        var push = document.getElementById("push_text_edit_item");
        if (item_product_code_edit == "") {
            push.innerHTML = "<p>Product Code must be fill</p>";
            modal.style.display = "block";
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        } else if (item_product_code_edit != "") {
            var datjson3 = new Object();
            datjson3.brand_id = brand_id;
            datjson3.item_product_code_edit = item_product_code_edit;
            datjson3.outlet_id_edit_item = outlet_id_edit_item;
            $.ajax({
                contentType: 'application/json',
                dataType: "json",
                url: "del_item",
                data: JSON.stringify(datjson3),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        destroy();
                        hehe();
                        alert('Success Delete Product');
                        $('.cd-popup-edit-item').removeClass('is-visible');
                    } else {
                        alert('Failed Delete Product');
                    }
                }
            });
        }
    }









    jQuery(document).ready(function ($) {
        //open popup add category
        $('#box1_edit_item').on('click', function (event) {
            $('#file-input-edit-item').trigger('click');
        });
//        $('#btn_save_edit_category').on('click', function (event) {
//            var category_name_edit = document.getElementById('category_name_edit').value;
//            var img_cate_edit = document.getElementById('img_cate_edit').value;
//
//            var modal = document.getElementById("myModal_edit_cate");
//            var span = document.getElementsByClassName("close_edit_cate")[0];
//            var push = document.getElementById("push_text_edit_cate");
//
//            if (category_name_edit == "") {
//                push.innerHTML = "<p>Categoty Name must be Fill</p>";
//                modal.style.display = "block";
//                span.onclick = function () {
//                    modal.style.display = "none";
//                }
//                window.onclick = function (event) {
//                    if (event.target == modal) {
//                        modal.style.display = "none";
//                    }
//                }
//            } else if (category_name_edit != "") {
//                if (img_cate_edit == "") {
//                    push.innerHTML = "<p>Category Image must be choose</p>";
//                    modal.style.display = "block";
//                    span.onclick = function () {
//                        modal.style.display = "none";
//                    }
//                    window.onclick = function (event) {
//                        if (event.target == modal) {
//                            modal.style.display = "none";
//                        }
//                    }
//                } else if (img_cate_edit != "") {
//                    var form_edit_cate = document.getElementById('form_edit_category');
//                    form_edit_cate.submit();
//                }
//            }
//        });
    });
</script>