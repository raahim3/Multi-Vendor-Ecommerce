@extends('frontend.layouts.app')
@section('title',$blog->title)
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
                                <li class="breadcrumb-item active" aria-current="page">{{ $blog->title }}</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- blog-area -->
    <section class="blog-details-area pt-90 pb-90">
        <div class="container">
            <div class="blog-inner-wrap">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="inner-blog-item mb-50">
                            <div class="inner-blog-thumb">
                                <img src="{{ asset('blog_image').'/'.$blog->image }}" alt="img">
                            </div>
                            <div class="inner-blog-content">
                                <a href="#" class="tag">FEATURED</a>
                                <h2 class="title">{{ $blog->title }}</h2>
                                <ul class="blog-meta">
                                    <li>By <a href="#">{{ $blog->admin->first_name.' '.$blog->admin->last_name }}</a></li>
                                    <li>{{ date('F d, Y', strtotime($blog->created_at))}}</li>
                                </ul>
                                <p>{{ $blog->description }}</p>
                                <div>
                                    {!! $blog->content !!}
                                </div>
                                <div class="blog-details-tag-wrap justify-content-end">
                                    {{-- <div class="blog-details-tag-list">
                                        <ul>
                                            <li class="title">Tag post :</li>
                                            <li><a href="#">Lifestyle,</a></li>
                                            <li><a href="#">Fashion,</a></li>
                                            <li><a href="#">who,</a></li>
                                            <li><a href="#">arts</a></li>
                                        </ul>
                                    </div> --}}
                                    <div class="blog-details-comment">
                                        <ul>
                                            <li><a href="#"><i class="fa-regular fa-message"></i>05</a></li>
                                            <li><p class="m-0 {{ $isLike && $isLike->id ? 'active' : '' }}" id="storeLike" data-like_id="{{$isLike && $isLike->id ? $isLike->id : ''}}"><i class="fa-regular fa-heart"></i> <span id="likes">{{ count($blog->likes) }}</span></p></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="blog-content-bottom">
                                    <ul>
                                        <li>by <a href="#">{{ $blog->admin->first_name.' '.$blog->admin->last_name }}</a></li>
                                    </ul>
                                    <div class="keep-reading">
                                        <a href="blog-details.html">keep reading...</a>
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
                        <div class="blog-comment-box">
                            <h3 class="title">LEAVE A COMMENT</h3>
                            <p>Your email address will not be published. Required fields are marked *</p>
                            <div class="alert alert-success d-none" id="commentSuccess" role="alert"></div>
                            <div class="alert alert-danger d-none" id="commentError" role="alert"></div>
                            <form>
                                <textarea name="comment" placeholder="Your Comment" required></textarea>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Your Name *" name="name" required 
                                        value="{{auth()->check() ? auth()->user()->name : (auth()->guard('vendor')->check() ? auth()->guard('vendor')->user()->name : (auth()->guard('admin')->check() ? auth()->guard('admin')->user()->name : ''))}}"
                                        {{auth()->check() ? 'readonly' : (auth()->guard('vendor')->check() ? 'readonly' : (auth()->guard('admin')->check() ? 'readonly' : ''))}}>
                                        <input type="hidden" value="{{$blog->id}}" name="blog_id">
                                        <input type="hidden" value="{{ auth()->guard('vendor')->check() ? auth()->guard('vendor')->user()->id : "" }}" name="vendor_id">
                                        <input type="hidden" value="{{ auth()->guard('admin')->check() ? auth()->guard('admin')->user()->id : "" }}" name="admin_id">
                                        <input type="hidden" value="{{ auth()->check() ? auth()->user()->id : "" }}" name="user_id">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="email" placeholder="Your Email *" name="email" required 
                                        value="{{auth()->check() ? auth()->user()->email : (auth()->guard('vendor')->check() ? auth()->guard('vendor')->user()->email : (auth()->guard('admin')->check() ? auth()->guard('admin')->user()->email : ''))}}"
                                        {{auth()->check() ? 'readonly' : (auth()->guard('vendor')->check() ? 'readonly' : (auth()->guard('admin')->check() ? 'readonly' : ''))}}>
                                    </div>
                                </div>
                                <button type="button" id="commentStore">submit</button>
                            {{-- </form> --}}
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
                                                <a href="{{ route('blog.detail',$recent_blog->slug) }}"><img src="{{ asset('blog_image').'/'.$recent_blog->image }}" alt="img"></a>
                                            </div>
                                            <div class="content">
                                                <h4 class="title"><a href="{{ route('blog.detail',$recent_blog->slug) }}">{{$recent_blog->title}}</a></h4>
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
                                        <li><a href="#">{{$sub_category->title}} <span>{{ count($sub_category->blog) }}</span></a></li>
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

@section('script')
    <script>
           let user_id = "{{ auth()->check() && auth()->user()->id }}";
           let vendor_id = "{{ auth()->guard('vendor')->check() && auth()->guard('vendor')->user()->id }}";
           let admin_id = "{{ auth()->guard('admin')->check() && auth()->guard('admin')->user()->id }}";
           let blog_id = "{{ $blog->id }}";
        $(document).on('click','#storeLike',function () {
           let like_id = $(this).data('like_id') ?? null;
           if(user_id == null || admin_id == null || vendor_id == null)
           {
                window.location.href="{{ route('login') }}";
           }
           else{
                $.ajax({
                    url:"{{ route('blog.like.store') }}",
                    method:"GET",
                    data:{user_id:user_id,blog_id:blog_id,vendor_id:vendor_id,admin_id:admin_id,like_id:like_id},
                    success:function(response){
                        // console.log(response);
                        if(response.status == 'store'){
                            $('#storeLike').data('like_id',response.like_id);
                            $('#storeLike').addClass('active');
                            $('#likes').text(response.likes);
                        }
                        if(response.status == 'unlike'){
                            $('#storeLike').data('like_id',' ');
                            $('#storeLike').removeClass('active');
                            $('#likes').text(response.likes);
                        }
                    }
                });
           }
        });

        $(document).on('click','#commentStore',function(e){
            e.preventDefault();
            let name = $('input[name="name"]').val();
            let email = $('input[name="email"]').val();
            let comment = $('textarea[name="comment"]').val();
                $.ajax({
                    url:"{{ route('blog.comment.store') }}",
                    method:"GET",
                    data:{name,email,comment,user_id,vendor_id,admin_id,blog_id},
                    success:function(response){
                        if(response.status == 'success'){
                            $('#commentError').addClass('d-none');
                            $('#commentSuccess').removeClass('d-none').text('Your comment will appear once the admin has approved it.');
                        }
                        if(response.status == 'error'){
                            $('#commentSuccess').addClass('d-none');
                            $('#commentError').removeClass('d-none').text(response.message);
                        }
                    }
                });
        });

    </script>
@endsection
@endsection