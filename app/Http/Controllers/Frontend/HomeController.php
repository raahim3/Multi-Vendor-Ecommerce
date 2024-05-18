<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Product;
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
        $data['blogs'] = Blog::with('admin','blog_category','blog_sub_category','comments')->where('status',1)->latest()->take(3)->get();
        $data['supar_deals'] = Product::with('sub_category','category')->where('status',1)->take(6)->get();
        $data['top_selections'] = Product::with('sub_category','category')->where('status',1)->take(3)->get();
        $data['new_arrivals'] = Product::with('sub_category','category')->where('status',1)->take(3)->get();
        $data['flash_sales'] = Product::with('sub_category','category')->where('status',1)->take(8)->get();
        $data['trending_products'] = Product::with('sub_category','category')->where('status',1)->take(5)->get();
        return view('frontend.index',$data);
    }
}
