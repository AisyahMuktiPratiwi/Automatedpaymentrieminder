<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>dashboard Penghuni</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ asset('template/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('template/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('template/dist/css/adminlte.min.css') }}">
    @stack('css')

    <style>
        .nav-link {
            color: white !important;
        }



    </style>

</head>

<body class="hold-transition  sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" style="background-color: rgb(226, 226, 220)">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__wobble" src="{{ asset('template/dist/img/logu.png') }}" alt="AdminLTELogo"
                height="60" width="60">
        </div>

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand" style="background-color:#7dacd8;">
            <!-- Left navbar links -->
            <ul class="navbar-nav" style="color: white;">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"
                            style="color:white;"></i></a>
                </li>

            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">

                </li>



                <li class="nav-item">

                <li class="nav-item">
                    <form id="logout-form" action="{{ route('logout') }}" method="POST">
                        @csrf
                        <button type="submit" class="btn"><i class="fa fa-sign-out-alt"
                                style="color: white;"></i></button>
                    </form>
                </li>


            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color:#7dacd8;">
            <!-- Brand Logo -->
            <a href="/" class="brand-link" style="background-color:#7dacd8;">
                  <img src="{{ asset('template/dist/img/logu.png') }}"
                  width="50px">
                <span class="brand-text font-weight-light">Kontrami</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="{{ asset('template/dist/img/avatar2.png') }}" class="img-circle elevation-2"
                            alt="User Image">


                        @if(Auth::guard('pelanggan')->check())
                            <p style="color:white">{{ Auth::guard('pelanggan')->user()->nama }}</p>
                        @endif

                    </div>
                    <div class="info">
                        <a href="#" class="d-block"></a>
                    </div>
                </div>

                <!-- SidebarSearch Form -->

                <!-- Sidebar Menu -->
                <nav class="mt-2" style="color :white">

                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

                        <li class="nav-item menu-open">
                            <a href="#" class="nav-link active" style="background-color: rgb(231, 223, 207);">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Kelola Data

                                </p>
                            </a>


                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        @yield('content')
        <!-- /.content-wrapper -->

        <!-- Control Sidebar -->
        <!-- <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        <!-- </aside> -->
        <!-- /.control-sidebar -->

        <!-- Main Footer -->
        <footer class="main-footer" style="background-color:#7dacd8;">
            <strong style="color:white;"> Copyright &copy; 2025 Kontrami</strong>


        </footer>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->
    <!-- jQuery -->
    <script src="{{ asset('template/plugins/jquery/jquery.min.js') }}"></script>
    <!-- Bootstrap -->
    <script src="{{ asset('template/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <!-- overlayScrollbars -->
    <script src="{{ asset('template/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ asset('template/dist/js/adminlte.js') }}"></script>

    <!-- PAGE PLUGINS -->
    <!-- jQuery Mapael -->
    <script src="{{ asset('template/plugins/jquery-mousewheel/jquery.mousewheel.js') }}"></script>
    <script src="{{ asset('template/plugins/raphael/raphael.min.js') }}"></script>
    <script src="{{ asset('template/plugins/jquery-mapael/jquery.mapael.min.js') }}"></script>
    <script src="{{ asset('template/plugins/jquery-mapael/maps/usa_states.min.js') }}"></script>
    <!-- ChartJS -->
    <script src="{{ asset('template/plugins/chart.js/Chart.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="{{ asset('template/dist/js/demo.js') }}"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="{{ asset('template/dist/js/pages/dashboard2.js') }}"></script>
    @stack('scripts')
</body>

</html>
