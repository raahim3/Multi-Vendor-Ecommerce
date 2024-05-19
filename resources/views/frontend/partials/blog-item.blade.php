<div class="col-xl-4 col-lg-6 col-md-6 col-sm-9">
    <div class="blog-item mb-30">
        <div class="blog-thumb">
            <a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate><img src="{{ asset('blog_image').'/'.$blog->image }}" alt="{{ $blog->title }}" width="100%" height="220px"></a>
        </div>
        <div class="blog-content">
            <div class="comment">
                <a href="#">
                    <i class="fa-regular fa-comment"></i>
                    <span>{{ count($blog->comments) }}</span>
                </a>
            </div>
            <a href="{{ route('blog.detail',$blog->slug) }}" class="tag">{{ $blog->blog_category->title }}</a>
            <h4 class="title"><a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate>{{ $blog->title }}</a></h4>
            <p>{{ $blog->description }}</p>
            <div class="blog-meta">
                <ul>
                    <li>{{ $blog->admin->first_name.' '.$blog->admin->last_name }} .</li>
                    <li><a href="{{ route('blog.detail',$blog->slug) }}" wire:navigate>read more</a></li>
                    <li>. <li>. {{ date('F d, Y', strtotime($blog->created_at))}}
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>