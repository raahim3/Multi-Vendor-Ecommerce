<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function index(Request $request)
    {
        
        $query = Product::with('sub_category','category','images','colors','sizes','addtional_infos','vendor','order')->where('status',1);
         
        if ($request->has('search') && $request->input('search') != '') {
            $query->where('title', 'LIKE', '%'.$request->input('search').'%');
        }
        if ($request->has('category')) {
            $query->whereHas('sub_category', function ($q) use ($request) {
                $q->whereIn('slug', $request->input('category', []));
            });
        }
        if ($request->has('min_price') && $request->input('min_price') != '') {
            $query->where('price', '>=', $request->input('min_price'));
        }
        if ($request->has('max_price') && $request->input('max_price') != '') {
            $query->where('price', '<=', $request->input('max_price'));
        }
        $data['products'] = $query->paginate(10); 

        $data['categoires'] = Category::with('sub_categories')->get();
        return view('frontend.shop.index',$data);
    }
}
