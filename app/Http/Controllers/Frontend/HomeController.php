<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    
    public function index()
    {
        $data['blogs'] = Blog::with('admin','blog_category','blog_sub_category')->where('status',1)->latest()->take(3)->get();
        return view('frontend.index',$data);
    }
}
