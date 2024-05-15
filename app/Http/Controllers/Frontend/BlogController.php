<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\BlogSubCategory;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function detail($slug)
    {
        $data['blog'] = Blog::with('admin','blog_category','blog_sub_category')->where('slug',$slug)->first();
        $data['recent_blogs'] = Blog::latest()->take(4)->get();
        $data['sub_categories'] = BlogSubCategory::with('blog')->where('blog_category_id',$data['blog']->blog_category_id)->get();
        return view('frontend.blogs.detail',$data);
    }
}
