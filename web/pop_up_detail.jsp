<%-- 
    Document   : pop_up_detail
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>
<%--<%@include file='defaultextend.jsp' %>--%>
<style>
    .cd-buttons-detail
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }

    .img-replace-detail {
        /* replace text with an image */
        display: inline-block;
        overflow: hidden;
        text-indent: 100%;
        color: transparent;
        white-space: nowrap;
    }

    .cd-popup-detail {
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
    .cd-popup-detail.is-visible {
        opacity: 1;
        visibility: visible;
        -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
        -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
        transition: opacity 0.3s 0s, visibility 0s 0s;
    }

    .cd-popup-detail-container {
        position: relative;
        width: 90%;
        height: 300px;
        max-width: 720px;
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

    .cd-popup-detail-container .cd-buttons-detail:after {
        content: "";
        display: table;
        clear: both;
    }
    .cd-popup-detail-container .cd-buttons-detail li {
        float: left;
        width: 50%;
        list-style: none;
    }
    .cd-popup-detail-container .cd-buttons-detail div {
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
    .cd-popup-detail-container .cd-buttons-detail li:first-child div {
        background: #3dceb7;
        border-radius: 0 0 0 .25em;
    }
    .cd-popup-detail-container .cd-buttons-detail li:first-child div:hover {
        background: #52e4cd;
        border-radius: 0 0 0 .25em;
    }

    .no-touch .cd-popup-detail-container .cd-buttons-detail li:first-child div:hover {
        background-color: #fc8982;
    }
    .cd-popup-detail-container .cd-buttons-detail li:last-child div {
        background: #b6bece;
        border-radius: 0 0 .25em 0;
    }
    .cd-popup-detail-container .cd-buttons-detail li:last-child div:hover {
        background: #d1d9e8;
        border-radius: 0 0 .25em 0;
    }
    .no-touch .cd-popup-detail-container .cd-buttons-detail li:last-child div:hover {
        background-color: #c5ccd8;
    }
    .cd-popup-detail-container .cd-popup-detail-close {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 30px;
        height: 30px;
    }
    .cd-popup-detail-container .cd-popup-detail-close::before, .cd-popup-detail-container .cd-popup-detail-close::after {
        content: '';
        position: absolute;
        top: 12px;
        width: 14px;
        height: 3px;
        background-color: #8f9cb5;
    }
    .cd-popup-detail-container .cd-popup-detail-close::before {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
        left: 8px;
    }
    .cd-popup-detail-container .cd-popup-detail-close::after {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        right: 8px;
    }
    .is-visible .cd-popup-detail-container {
        -webkit-transform: translateY(0);
        -moz-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    @media only screen and (min-width: 1170px) {
        .cd-popup-detail-container {
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
    #btn_save1 {
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
    #btn_save1:hover {
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
</style>


<script>
            function mama() {
        //open popup add item
        
//            event.preventDefault();
            $('.cd-popup-detail').addClass('is-visible');
        

        //close popup add item
        $('.cd-popup-detail').on('click', function (event) {
            if ($(event.target).is('.cd-popup-detail-close') || $(event.target).is('.cd-popup-detail') || $(event.target).is('#btn_cancel')) {
                event.preventDefault();
                $(this).removeClass('is-visible');
            }
        });
        //close popup when clicking the esc keyboard button add item
        $(document).keyup(function (event) {
            if (event.which == '27') {
                $('.cd-popup-detail').removeClass('is-visible');
            }
        });

    }
    



</script>
<div class="cd-popup-detail" role="alert">
    <div class="cd-popup-detail-container">
        <div id="boxx_item">
            <div class="container">        
                <table class="table" id="table_detail2" style="display: none">
                    <tr>
                        <th>Product ID</th>
                        <th>Item</th>
                        <th>Code</th>
                        <th>Sell Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Tax</th>
                        <th>Discount</th>
                    </tr>
                </table>
            </div>
        </div>
        <a href="#0" class="cd-popup-detail-close img-replace-detail">Close</a>
    </div>
</div>
<script>
</script>