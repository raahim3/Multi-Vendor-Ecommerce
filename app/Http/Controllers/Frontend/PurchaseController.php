<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    public function checkout()
    {
        $data['products'] = Cart::with('product')->where('user_id',auth()->user()->id)->get();
        return view('frontend.checkout',$data);
    }
    public function checkout_store(Request $request)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required | email',
            'phone' => 'required',
            'country' => 'required',
            'city' => 'required',
            'state' => 'required',
            'address' => 'required',
            'payment_method' => 'required',
            'total' => 'required',
            'delivery_charges' => 'required',
        ]);
    }
}
