<%-- 
    Document   : dashboard
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@include file='defaultextend.jsp'%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
    </head>
    <body class="hold-transition sidebar-mini">
        <button>bubu</button>
    </body>
    <script>
    jQuery(document).ready(function ($) {    
    var ss = numberWithCommas(-5000000);
    console.log('juju : '+ss);
    });
    function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    </script>
</html>
