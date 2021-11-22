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
    .inv_1 {
        border-radius: 5px;
        padding: 5px;
    }
    .inv_1:hover {
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
    <a href="db_a" class="brand-link">
        <img src="image/use.jpeg" alt="Ridapos Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light" style="color: white">R I D A P O S</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
                <li class="nav-item has-treeview" onclick="li_db_a()">
                    <a href="db_a" class="nav-link" id="li_db_a">
                        <i class="nav-icon fas fa-chart-bar"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item has-treeview" onclick="li_usr_a()">
                    <a href="usr_a" class="nav-link" id="li_usr_a">
                        <i class="nav-icon fas fa-star"></i>
                        <p>Merchant</p>
                    </a>
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

                function li_db_a() {
                    window.localStorage.setItem('side', 'db_a');
                }
                ;
                
                function li_usr_a() {
                    window.localStorage.setItem('side', 'usr_a');
                }
                ;
                


                var side = window.localStorage.getItem('side');
                switch (side) {
                    case 'db_a':
                        document.getElementById("li_db_a").classList.add("active");
                        break;
                    case 'usr_a':
                        document.getElementById("li_usr_a").classList.add("active");
                        break;
                }
            </script>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>