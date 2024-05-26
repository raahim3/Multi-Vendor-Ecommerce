<!doctype html>
<html class="no-js" lang="">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@yield('title') | {{ $settings->site_name }}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="shortcut icon" type="image/x-icon" href="{{ asset('settings/site'.'/'.$settings->site_favicon) }}">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/animate.min.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/fontawesome-all.min.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/mCustomScrollbar.min.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/flaticon.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/slick.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/jquery-ui.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/default.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/style.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend_assets/css/responsive.css') }}">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        @livewireStyles
        <style>
            .cartUl{
                list-style: none;
                padding: 0px;

            }
            .cartUl li{
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid rgb(218, 218, 218);
                padding: 10px 0px;
            }
            .cart-plus-minus.cus input{
                height: 25px;
            }
            .cart-plus-minus.cus .qtybutton{
                width: 18px
            }
            .cart-plus-minus.cus
            {
                width:66px;
                flex: 0 0 70px
            }
            #removeCartBtn{
                padding: 7px 14px;
                background-color: #1339fe;
                color: #fff;
                border: none;
                border-radius: 2px;
            }.offcanvas-body{
                position: relative;
            }
            #cartBottom{
                position: absolute;
                bottom: 10px;
                left: 10px;
                width: 95%;
            }
            .text-right{
                text-align: right !important;
            }
            .cartColor{
                height: 15px;
                width: 15px;
                border-radius:3px; 
                display: inline-block;
            }
            a,button{
                position: relative;
            }
            #loader_div{
                position: absolute;
                top: -1px;
                left: -1px;
                background-color: #ffffffeb;
                width: 101%;
                height: 101%;
                display: flex;
                justify-content: center;
                align-content: center
            }
            .fs-13{
                font-size: 12px
            }
        </style>
    </head>
    <body>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="cartCanvas" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header border-bottom">
              <h5 id="offcanvasRightLabel" class="m-0">Cart</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" id="cartCanavsBody">
                <ul class="cartUl" id="cartUl">
                    
                </ul>
                <div id="cartBottom"></div>
            </div>
          </div>
        <!-- Preloader -->
        {{-- <div id="preloader">
            <div id="preloader-status">
                <div class="preloader-position loader"> <span></span> </div>
            </div>
        </div> --}}
        <!-- Preloader end -->

		<!-- Scroll-top -->
        <button class="scroll-top scroll-to-target" data-target="html">
            <i class="fas fa-angle-up"></i>
        </button>
        <!-- Scroll-top-end-->

        <livewire:frontend.layouts.header />
        @yield('content')
        <livewire:frontend.layouts.footer />


  <!-- JS here -->
  <script>
    let ASSET_URL = "{{ asset('/') }}";
    let SITE_URL = "{{ url('/') }}";
    let LOADER = "{{ asset('/frontend_assets/img/loader.gif') }}"
  </script>
  <script src="{{ asset('frontend_assets/js/vendor/jquery-3.6.0.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/bootstrap.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/isotope.pkgd.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/imagesloaded.pkgd.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/jquery.countdown.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/jquery.mCustomScrollbar.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/jquery-ui.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/slick.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/wow.min.js') }}"></script>
  <script src="{{ asset('frontend_assets/js/main.js') }}"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
  @yield('script')
  @livewireScripts
  @session('success')
        <script>
        Toastify({
            text: "{{ session('success') }}",
            className: "success",
            style: {
                background: "#008000",
            }
            }).showToast();
        </script>
        @endsession
        @session('error')
        <script>
        Toastify({
            text: "{{ session('error') }}",
            className: "success",
            style: {
                background: "red",
            }
            }).showToast();
        </script>
        @endsession
</body>

</html>
