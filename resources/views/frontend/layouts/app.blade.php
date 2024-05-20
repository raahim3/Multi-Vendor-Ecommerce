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
            }
        </style>
    </head>
    <body>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="cartCanvas" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header border-bottom">
              <h5 id="offcanvasRightLabel" class="m-0">Cart</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="cartUl">
                    <li>
                        <div class="d-flex gap-2">
                            <div>
                                <img src="{{asset('default_avatar.jpg')}}" width="65px" height="65px" alt="">
                            </div>
                            <div style="width: 230px">
                                <p class="mt-2 fw-bolder fs-6 mb-0">Product Title</p>
                                <div class="d-flex gap-2">Price : 2999 <div class="cart-plus-minus cus">
                                        <input type="text" value="1" id="quantity">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button id="removeCartBtn"><i class="fa fa-trash"></i></button>
                        </div>
                    </li>
                </ul>
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
  @yield('script')
  @livewireScripts
</body>

</html>
