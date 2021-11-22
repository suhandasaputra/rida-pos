<%-- 
    Document   : pop_up_edit_brand
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

    .img-replace-edit-biodata {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-edit-biodata {
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
    .cd-popup-edit-biodata.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-edit-biodata-container {
        position: relative;
        width: 90%;
        height: 300px;
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

    .cd-popup-edit-biodata-container .cd-buttons-add-category:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-edit-biodata-container .cd-buttons-add-category li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-edit-biodata-container .cd-buttons-add-category div {
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
    .cd-popup-edit-biodata-container .cd-buttons-add-category li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-edit-biodata-container .cd-buttons-add-category li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-edit-biodata-container .cd-buttons-add-category li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-edit-biodata-container .cd-buttons-add-category li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-edit-biodata-container .cd-buttons-add-category li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-edit-biodata-container .cd-buttons-add-category li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-edit-biodata-container .cd-popup-edit-biodata-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-edit-biodata-container .cd-popup-edit-biodata-close::before, .cd-popup-edit-biodata-container .cd-popup-edit-biodata-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-edit-biodata-container .cd-popup-edit-biodata-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-edit-biodata-container .cd-popup-edit-biodata-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-edit-biodata-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-edit-biodata-container {
            margin: 8em auto;
        }
    }
    #label_edit_biodata {
        width: 100%;
        margin: 20px;
        text-align: left;
    }
    #boxx_biodata{
        display: flex;
        justify-content: center;
        align-content: center;
    }
    #box1_biodata {
        cursor: pointer;
        width: 215px;
        height: 200px;
        margin-right: 5px;
        /*background-color: #68f3e9;*/
        border-radius: 5px;
    }
    #box2_biodata {
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
    #btn_save {
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
    #btn_save:hover {
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
</style>


<script>
    jQuery(document).ready(function ($) {
        //open popup edit biodata
        $('#add_account_biodata').on('click', function (event) {
            event.preventDefault();
            var fname = document.getElementById("full_name").value;
            document.getElementById("biodata_name").value = fname;
            $('.cd-popup-edit-biodata').addClass('is-visible');
        });

        //close popup edit biodata
        $('.cd-popup-edit-biodata').on('click', function (event) {
            if ($(event.target).is('.cd-popup-edit-biodata-close') || $(event.target).is('.cd-popup-edit-biodata') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
            }
        });
        //close popup when clicking the esc keyboard button edit biodata
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-edit-biodata').removeClass('is-visible');
            }
        });
    });
</script>
<div class="cd-popup-edit-biodata" role="alert">
    <div class="cd-popup-edit-biodata-container">
        <label id="label_edit_biodata">Edit Biodata</label>
        <div id="boxx_biodata">
            <div id="box2_biodata">
                <div id="input_biodata">
                    <form>
                        <label style="font-weight: 100;
                               float: left;
                               margin: 0px 0px 3px 0px;
                               color: black;
                               font-size: 12px;">full name</label>
                        <input type="text" id="biodata_name" name="biodata_name" required="" placeholder="Full name" style="width: 215px">
                    </form>
                    <div id="buttonon">
                        <div id="btn_cancel">Cancel</div>
                        <div id="btn_save">Save</div>
                    </div>
                    <div id="msgbox"></div>
                </div>
            </div>
        </div>
        <a href="#0" class="cd-popup-edit-biodata-close img-replace-edit-biodata">Close</a>
    </div>
</div>
<script>
    jQuery(document).ready(function ($) {
        //open popup add category
        $('#box1_biodata').on('click', function (event) {
            $('#file-input-biodata').trigger('click');
        });

        $('#btn_save').on('click', function (event) {
//            var brand_id = window.localStorage.getItem('brand_id');
            var user_id = window.localStorage.getItem('user_id');
            var user_name = document.getElementById('biodata_name').value;
            var datjson = new Object();
            datjson.user_id = user_id;
            datjson.brand_id = brand_id;
            datjson.user_name = user_name;
            $.ajax({
                dataType: "json",
                url: "ebi",
                data: JSON.stringify(datjson),
                type: 'post',
                success: function (response) {
                    if (response.resp_code == 0000) {
                        alert('success update user name');
                        window.localStorage.removeItem('user_name');
                        window.localStorage.setItem('user_name', response.user_name);
                        location.reload();
                        $('.cd-popup-edit-biodata').removeClass('is-visible');
                    } else {
                        alert('Failed Update Username');
                    }

                }
            });
        });
    });
</script>