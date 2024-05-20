<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function cart_store(Request $request)
    {
        if(!auth()->check()){
            return response()->json(['status'=>'unauthenticated']);    
        }

        $product_exist = auth()->user()->carts()->where('product_id',$request->product_id)->first();
        if($product_exist){
            return response()->json(['status'=>'error','message'=>'Product already in cart']);    
        }

        $product = Product::find($request->product_id);
        $cart = new Cart();
        $cart->quantity = $request->quantity;    
        $cart->color = $request->color;    
        $cart->sub_total = $request->quantity * $product->actual_price;    
        $cart->product_id = $request->product_id;    
        $cart->user_id = auth()->user()->id;
        $cart->save();
        $cart_count = auth()->user()->carts->count();
        return response()->json(['status'=>'success','count'=>$cart_count]);    
    }
    public function get_data(){
        $cart_data = Cart::with('product')->where('user_id',auth()->user()->id)->get();
        return response()->json(['status'=>'success','data'=>$cart_data]);    
    }
}
