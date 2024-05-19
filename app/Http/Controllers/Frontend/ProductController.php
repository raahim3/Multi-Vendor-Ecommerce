<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function detail($slug)
    {
        $data['product'] = Product::with('sub_category','category','images','colors','sizes','addtional_infos')->where('slug',$slug)->first();
        $data['recommended_products'] = Product::with('sub_category','category','images','vendor')->latest()->take(4)->get();
        return view('frontend.products.detail',$data);
    }
}
