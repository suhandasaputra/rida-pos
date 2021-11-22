<%-- 
    Document   : sidebar_left
    Created on : Jan 03, 2020, 4:38:43 PM
    Author     : suhanda
--%>

<style>
    .nav-link:hover{
        background-color: #3dceb7;
    }
    .isi{
        display: none;
    }
    .active {
        display: block;
    }
    ul, #isi {
        list-style-type: none;
    }

    .isi_1{
        display: none;
    }
    .active {
        display: block;
    }

    ul, #isi_1 {
        list-style-type: none;
    }


    .inv_1 {
        border-radius: 5px;
        padding: 5px;
    }
    .inv_1:hover {
        background-color: rgba(255,255,255,.1);
    }
    .atg_1 {
        border-radius: 5px;
        padding: 5px;
    }
    .atg_1:hover {
        background-color: rgba(255,255,255,.1);
    }
    li.active {
        background-color: #3dceb7;
    }
    .sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active {
        background-color: #3dceb7;
    }



</style>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="db" class="brand-link">
        <img src="image/4.png" alt="Ridapos Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light" style="color: white">R I D A P O S</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
                <li class="nav-item has-treeview" onclick="li_db()">
                    <a href="db" class="nav-link" id="li_db">
                        <i class="nav-icon fas fa-chart-bar"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_acc()">
                    <a href="acc" class="nav-link" id="li_acc">
                        <i class="nav-icon fas fa-user"></i>
                        <p>Account</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_bus()">
                    <a href="bus" class="nav-link" id="li_bus">
                        <i class="nav-icon fas fa-star"></i>
                        <p>Business</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_usr()" id="list_user">
                    <a href="usr" class="nav-link"  id="li_usr">
                        <i class="nav-icon fas fa-users"></i>
                        <p>User</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_pd()">
                    <a href="pd" class="nav-link" id="li_pd">
                        <i class="nav-icon fas fa-barcode"></i>
                        <p>Product</p>
                    </a>
                </li>
                <li class="nav-item has-treeview inv">
                    <a href="#" class="nav-link" id="li_inv">
                        <i class="nav-icon fas fa-barcode"></i>
                        <p>Inventory</p>
                    </a>
                    <ul class="isi">
                        <li class="inv_1" onclick="li_sum()" id="li_sum"><a href="sum" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Summary</a></li>
                        <li class="inv_1" onclick="li_sup()" id="li_sup"><a href="sup" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Suppliers</a></li>
                        <li class="inv_1" onclick="li_po()" id="li_po"><a href="sto" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Purchase Order</a></li>
                    </ul>
                </li>





                <li class="nav-item has-treeview" onclick="li_dis()">
                    <a href="dis" class="nav-link" id="li_dis">
                        <i class="nav-icon fas fa-percent"></i>
                        <p>Promo</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_cus()">
                    <a href="cus" class="nav-link" id="li_cus">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Customer</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_rpt()">
                    <a href="rpt" class="nav-link" id="li_rpt">
                        <i class="nav-icon fas fa-file"></i>
                        <p>Report</p>
                    </a>
                </li>
                <li class="nav-item has-treeview atg">
                    <a href="#" class="nav-link" id="li_atg">
                        <i class="nav-icon fas fa-barcode"></i>
                        <p>Jurnal</p>
                    </a>
                    <ul class="isi_1">
                        <li class="atg_1" onclick="li_inc()" id="li_inc"><a href="inc" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Income</a></li>
                        <li class="atg_1" onclick="li_exp()" id="li_exp"><a href="exp" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Expense</a></li>
                        <li class="atg_1" onclick="li_jur()" id="li_jur"><a href="jur" style="display: inline-flex"><i class="nav-icon fas fa-barcode"></i>Jurnal</a></li>
                    </ul>
                </li>
            </ul>
            <script>
                var toggler = document.getElementsByClassName("inv");
                var i;
                for (i = 0; i < toggler.length; i++) {
                    toggler[i].addEventListener("click", function () {
                        this.parentElement.querySelector(".isi").classList.toggle("active");
                    });
                }
                var toggler1 = document.getElementsByClassName("atg");
                var i;
                for (i = 0; i < toggler1.length; i++) {
                    toggler1[i].addEventListener("click", function () {
                        this.parentElement.querySelector(".isi_1").classList.toggle("active");
                    });
                }

                function li_db() {
                    window.localStorage.setItem('side', 'db');
                }
                ;
                function li_acc() {
                    window.localStorage.setItem('side', 'acc');
                }
                ;
                function li_bus() {
                    window.localStorage.setItem('side', 'bus');
                }
                ;
                function li_usr() {
                    window.localStorage.setItem('side', 'usr');
                }
                ;
                function li_pd() {
                    window.localStorage.setItem('side', 'pd');
                }
                ;

                function li_dis() {
                    window.localStorage.setItem('side', 'dis');
                }
                ;
                function li_cus() {
                    window.localStorage.setItem('side', 'cus');
                }
                ;
                function li_rpt() {
                    window.localStorage.setItem('side', 'rpt');
                }
                ;




                function li_sum() {
                    window.localStorage.setItem('side', 'sum');
                }
                ;
                function li_sup() {
                    window.localStorage.setItem('side', 'sup');
                }
                ;
                function li_po() {
                    window.localStorage.setItem('side', 'po');
                }
                ;





                function li_exp() {
                    window.localStorage.setItem('side', 'exp');
                }
                ;
                function li_inc() {
                    window.localStorage.setItem('side', 'inc');
                }
                ;
                function li_jur() {
                    window.localStorage.setItem('side', 'jur');
                }
                ;






                var side = window.localStorage.getItem('side');
                switch (side) {
                    case 'db':
                        document.getElementById("li_db").classList.add("active");
                        break;
                    case 'acc':
                        document.getElementById("li_acc").classList.add("active");
                        break;
                    case 'bus':
                        document.getElementById("li_bus").classList.add("active");
                        break;
                    case 'usr':
                        document.getElementById("li_usr").classList.add("active");
                        break;
                    case 'pd':
                        document.getElementById("li_pd").classList.add("active");
                        break;
                    case 'dis':
                        document.getElementById("li_dis").classList.add("active");
                        break;
                    case 'cus':
                        document.getElementById("li_cus").classList.add("active");
                        break;
//                    case 'exp':
//                        document.getElementById("li_exp").classList.add("active");
//                        break;
                    case 'db':
                        document.getElementById("li_db").classList.add("active");
                        break;
                    case 'rpt':
                        document.getElementById("li_rpt").classList.add("active");
                        break;

                    case 'sum':
                        document.querySelector(".isi").classList.toggle("active");
                        document.getElementById("li_inv").classList.toggle("active");
                        document.getElementById("li_sum").classList.toggle("active");
                        break;
                    case 'sup':
                        document.querySelector(".isi").classList.toggle("active");
                        document.getElementById("li_inv").classList.toggle("active");
                        document.getElementById("li_sup").classList.toggle("active");
                        break;
                    case 'po':
                        document.querySelector(".isi").classList.toggle("active");
                        document.getElementById("li_inv").classList.toggle("active");
                        document.getElementById("li_po").classList.toggle("active");
                        break;





                    case 'exp':
                        document.querySelector(".isi_1").classList.toggle("active");
                        document.getElementById("li_atg").classList.toggle("active");
                        document.getElementById("li_exp").classList.toggle("active");
                        break;
                    case 'inc':
                        document.querySelector(".isi_1").classList.toggle("active");
                        document.getElementById("li_atg").classList.toggle("active");
                        document.getElementById("li_inc").classList.toggle("active");
                        break;
                    case 'jur':
                        document.querySelector(".isi_1").classList.toggle("active");
                        document.getElementById("li_atg").classList.toggle("active");
                        document.getElementById("li_jur").classList.toggle("active");
                        break;
                }
            </script>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>