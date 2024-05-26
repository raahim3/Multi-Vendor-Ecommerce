<?php

use App\Http\Controllers\Frontend\BlogController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\PurchaseController;
use App\Http\Controllers\Frontend\ShopController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/logout', function () {
    return view('welcome');
});

Route::get('/',[HomeController::class,'index']);
Route::get('/blogs',[BlogController::class,'index'])->name('blog.index');
Route::get('/blog/{slug}',[BlogController::class,'detail'])->name('blog.detail');
Route::get('/blog/like/store',[BlogController::class,'likeStore'])->name('blog.like.store');
Route::get('/blog/comment/store',[BlogController::class,'commentStore'])->name('blog.comment.store');
Route::get('/product/{slug}',[ProductController::class,'detail'])->name('product.detail');
Route::get('/get/cart/data',[CartController::class,'get_data'])->name('cart.data');
Route::post('/remove/cart/data',[CartController::class,'remove_cart'])->name('cart.remove');
Route::get('/shop',[ShopController::class,'index'])->name('shop.index');

Auth::routes(['verify' => true]);

Route::middleware('auth')->group(function () {
    Route::post('cart',[CartController::class,'cart_store'])->name('cart.store');
    Route::get('/checkout',[PurchaseController::class,'checkout'])->name('checkout');
    Route::post('/checkout',[PurchaseController::class,'checkout_store'])->name('checkout.store');
});
