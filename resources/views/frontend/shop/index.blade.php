@extends('frontend.layouts.app')
@section('title','Shop')
@section('content')
<main>
    <!-- breadcrumb-area -->
    <section class="breadcrumb-area breadcrumb-bg">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-xl-3 col-lg-4 col-md-5 col-sm-8 order-2 order-md-0">
                    <div class="breadcrumb-product text-center">
                        <div class="thumb">
                            <a href="shop-details.html"><img src="assets/img/product/br_product_img.png" alt="img"></a>
                            <span>35% OFF</span>
                        </div>
                        <div class="content">
                            <div class="rating">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <h4 class="title"><a href="shop-details.html">Blender Mixer Food</a></h4>
                            <h5 class="price">$37.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-7">
                    <div class="breadcrumb-content">
                        <h2 class="title">Discount shop</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shop</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- shop-area -->
    <div class="shop-area pt-90 pb-90">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-3 col-lg-4 col-md-8 col-sm-10 order-2 order-lg-0">
                    <form action="" method="get">
                    <aside class="shop-sidebar">
                        <div class="widget mb-35">
                            <div class="widget-title mb-25">
                                <h4 class="title">Category</h4>
                            </div>
                            <div class="shop-cat-list">
                                @foreach ($categoires as $key => $category)
                                <div class="accordion" id="accordionPanelsStayOpenExample">
                                    <div class="accordion-item">
                                      <h2 class="accordion-header" id="car_acc_hed_{{ $key }}">
                                        <button class="accordion-button p-2" type="button" data-bs-toggle="collapse" data-bs-target="#car_acc_cont_{{ $key }}" aria-expanded="true" aria-controls="car_acc_cont_{{ $key }}">
                                            {{$category->title}}
                                        </button>
                                      </h2>
                                      <div id="car_acc_cont_{{ $key }}" class="accordion-collapse collapse show" aria-labelledby="car_acc_hed_{{ $key }}">
                                        <div class="accordion-body categoty_acrd_body">
                                            <ul>
                                                @foreach ($category->sub_categories()->with('products')->get() as $sub_category)
                                                    <li>
                                                        <a href="#">
                                                            <input type="checkbox" 
                                                                {{ in_array($sub_category->slug, (array) request('category', [])) ? 'checked' : '' }} 
                                                                name="category[]" 
                                                                value="{{ $sub_category->slug }}" 
                                                                id="{{ $sub_category->slug }}">
                                                            &nbsp; <label for="{{ $sub_category->slug }}">{{ $sub_category->title }}</label> <span>{{ count($sub_category->products) }}</span></a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                      </div>
                                   </div>
                                  </div>
                                @endforeach
                                
                                
                            </div>
                        </div>
                        <div class="widget mb-40">
                            <div class="widget-title price-title mb-15">
                                <h4 class="title">Filter by price :</h4>
                            </div>
                            <div class="price_filter">
                                <div id="slider-range"></div>
                                <div class="price_slider_amount">
                                    <input type="submit" class="btn" value="Filter">
                                    <span>Price :</span>
                                    <input type="text" id="amount" name="" placeholder="Add Your Price" />
                                    <input type="number" hidden name="min_price" id="min_price" value="{{ request('min_price') && request('min_price') != ""  ? request('min_price') : 100 }}">
                                    <input type="number" hidden name="max_price" id="max_price" value="{{ request('min_price') && request('max_price') != "" ? request('max_price') : 10000 }}">
                                </div>
                            </div>
                        </div>
                    </aside>
                </form>
                </div>
                <div class="col-xl-9 col-lg-8">
                    <div class="shop-top-wrap mb-35">
                        <div class="shop-top-left">
                            <h5 class="title">Shop</h5>
                        </div>
                        <div class="shop-top-right">
                            <form action="#">
                                <label for="shortBy">sort By</label>
                                <select id="shortBy" name="select" class="form-select" aria-label="Default select example">
                                    <option value="">Sorting</option>
                                    <option>Free Shipping</option>
                                    <option>Best Match</option>
                                    <option>Newest Item</option>
                                    <option>Size A - Z</option>
                                </select>
                            </form>
                            <ul>
                                <li>View</li>
                                <li class="active"><a href="#"><i class="fa-solid fa-table-cells"></i></a></li>
                                <li><a href="#"><i class="fa-solid fa-bars"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        @foreach ($products as $product)
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-8">
                                <div class="shop-product-item mb-30">
                                    <div class="shop-thumb">
                                        <a href="{{ route('product.detail',$product->slug) }}" wire:navigate><img src="{{ asset('product_image').'/'.$product->image }}" alt="{{$product->title}}" width="100%" height="220px"></a>
                                        <span>New</span>
                                    </div>
                                    <div class="shop-content">
                                        <ul class="tag">
                                            <li>Sold by <a href="vendor-profile.html">{{$product->vendor->name}}</a></li>
                                        </ul>
                                        <h2 class="title"><a href="{{ route('product.detail',$product->slug) }}" wire:navigate>{{$product->title}}</a></h2>
                                        <div class="rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span>Already Sold : {{$product->percentageSold()}}%</span>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: {{$product->percentageSold()}}%" role="progressbar" aria-valuenow="{{$product->percentageSold()}}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="content-bottom">
                                            <h4 class="price">Rs {{ $product->actual_price }}</h4>
                                            <p>{{ count($product->order) }} orders 
                                                @if($product->discount)
                                                <span>-{{ $product->discount }}%</span></p>
                                                @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                            
                    </div>
                    <div class="shop-bottom-wrap">
                        <div class="shop-bottom-top">
                            <h5 class="title">Shop</h5>
                            <p>{{ $products->firstItem() }}-{{ $products->lastItem() }} of {{ $products->total() }} item(s)</p>
                        </div>
                        <div class="shop-bottom-box">
                            <div class="shop-bottom-left">
                                <form action="#">
                                    <select id="short-By" name="select" class="form-select" aria-label="Default select example">
                                        <option value="">Show 09</option>
                                        <option>Show 12</option>
                                        <option>Show 08</option>
                                        <option>Show 06</option>
                                        <option>Show 03</option>
                                    </select>
                                </form>
                            </div>
                            <div class="shop-bottom-right">
                                {{ $products->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- shop-area-end -->

    <!-- newsletter-area -->
    <section class="newsletter-area-two">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-xl-7 col-lg-6 col-md-12">
                    <div class="newsletter-content">
                        <i class="fa-regular fa-paper-plane"></i>
                        <h2 class="title">Sign Up for get 10% Weekly <span>Newsletter</span></h2>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-6 col-md-10">
                    <div class="newsletter-form">
                        <input type="text" placeholder="Your email here...">
                        <button type="submit">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- newsletter-area-end -->
</main>
@endsection