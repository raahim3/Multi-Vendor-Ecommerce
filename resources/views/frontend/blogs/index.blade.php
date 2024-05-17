@extends('frontend.layouts.app')
@section('title',"All Blogs")
@section('content')

    <!-- main-area -->
    <main>
        <!-- breadcrumb-area -->
        <section class="breadcrumb-area-three breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-content text-center">
                            <h2 class="title">latest news update</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">blog sidebar</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb-area-end -->

        <!-- blog-area -->
        <section class="inner-blog-area pt-90 pb-40">
            <div class="container">
                <div class="blog-inner-wrap">
                    <div class="row justify-content-center">
                        <div class="col-8">
                            @foreach ($blogs as $blog)
                            <div class="inner-blog-item mb-50">
                                <div class="inner-blog-thumb">
                                    <a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate><img src="{{ asset('blog_image').'/'.$blog->image }}" width="100%" alt="img"></a>
                                </div>
                                <div class="inner-blog-content">
                                    
                                    @if ($blog->is_featured == 1)
                                        <a href="javascript:void(0)l" class="tag">FEATURED</a>
                                    @endif
                                    <h2 class="title"><a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate>{{ $blog->title }}</a></h2>
                                    <ul class="blog-meta">
                                        <li>By <a href="#">{{ $blog->admin->name }}</a></li>
                                        <li>{{ date('F d, Y', strtotime($blog->created_at))}}</li>
                                    </ul>
                                    <p>{{ $blog->description }}</p>
                                    <div class="blog-content-bottom">
                                        <ul>
                                            <li>by <a href="#">{{ $blog->admin->name }}</a></li>
                                        </ul>
                                        <div class="keep-reading">
                                            <a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate>keep reading...</a>
                                        </div>
                                        <ul class="social">
                                            <li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="fa-brands fa-linkedin-in"></i></a></li>
                                            <li><a href="#"><i class="fa-brands fa-pinterest-p"></i></a></li>
                                            <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                                
                            @endforeach

                            <div class="d-flex justify-content-end">
                                {!! $blogs->links() !!}
                            </div>
                        </div>
                        <div class="col-4">
                            <aside class="blog-sidebar">
                                <div class="widget mb-45">
                                    <div class="blog-widget-title text-center mb-20">
                                        <h4 class="title">recent post
                                            <span class="left-border"></span>
                                            <span class="right-border"></span>
                                        </h4>
                                    </div>
                                    <div class="rc-post-list">
                                        <ul>
                                            @foreach ($recent_blogs as $recent_blog)
                                               <li>
                                                <div class="thumb">
                                                    <a href="{{ route('blog.detail',$recent_blog->slug) }}" wire:navigate ><img src="{{ asset('blog_image').'/'.$recent_blog->image }}" alt="img"></a>
                                                </div>
                                                <div class="content">
                                                    <h4 class="title"><a href="{{ route('blog.detail',$recent_blog->slug) }}" wire:navigate>{{$recent_blog->title}}</a></h4>
                                                    <span><i class="fa-regular fa-calendar"></i>{{ date('F d, Y', strtotime($blog->created_at))}}</span>
                                                </div>
                                            </li> 
                                            @endforeach
                                            
                                        </ul>
                                    </div>
                                </div>
                                <div class="widget mb-50">
                                    <div class="blog-widget-title text-center mb-20">
                                        <h4 class="title">category's
                                            <span class="left-border"></span>
                                            <span class="right-border"></span>
                                        </h4>
                                    </div>
                                    <div class="blog-cat-list">
                                        <ul>
                                            @foreach ($sub_categories as $sub_category)
                                            <li><a href="#" wire:navigate>{{$sub_category->title}} <span>{{ count($sub_category->blog) }}</span></a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                                {{-- <div class="widget mb-45">
                                    <div class="blog-widget-title text-center mb-20">
                                        <h4 class="title">Tag post
                                            <span class="left-border"></span>
                                            <span class="right-border"></span>
                                        </h4>
                                    </div>
                                    <div class="sidebar-tag-list">
                                        <ul>
                                            <li><a href="#">lifestyle</a></li>
                                            <li><a href="#">fashion</a></li>
                                            <li><a href="#">SHOPPING</a></li>
                                            <li><a href="#">who</a></li>
                                            <li><a href="#">Business</a></li>
                                            <li><a href="#">Marketing</a></li>
                                            <li><a href="#">Branding</a></li>
                                            <li><a href="#">arts</a></li>
                                        </ul>
                                    </div>
                                </div> --}}
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- blog-area-end -->

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
    <!-- main-area-end -->


@endsection