<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
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

        $cart_items = Cart::with('product')->where('user_id',auth()->user()->id)->get();

        if(count($cart_items) < 1){
            return redirect('/')->with('error','Please add product in cart First');
        }

        $total = 0;
        foreach ($cart_items as $key => $cart) {
            $total += $cart->sub_total;
        }

        $order = new Order();
        $order->first_name = $request->first_name;
        $order->user_id = auth()->user()->id;
        $order->last_name = $request->last_name;
        $order->email = $request->email;
        $order->phone = $request->phone;
        $order->country = $request->country;
        $order->city = $request->city;
        $order->state = $request->state;
        $order->address = $request->address;
        $order->payment_method = $request->payment_method;
        $order->zipcode = $request->zip_code;
        $order->delivery_charges = $request->delivery_charges;
        $order->total = $total;
        $order->status = 'Pending';
        $order->save();

        foreach ($cart_items as $key => $cart) {
            $order_item = new OrderItem();
            $order_item->order_id = $order->id;
            $order_item->product_id = $cart->product_id;
            $order_item->quantity = $cart->quantity;
            $order_item->color = $cart->color;
            $order_item->color_code = $cart->color_code;
            $order_item->sub_total = $cart->sub_total;
            $order_item->save();
        }

        Cart::where('user_id',auth()->user()->id)->delete();

        return redirect('/')->with('success','Order Placed Successfully!');
    }
}
