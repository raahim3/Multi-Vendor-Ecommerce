<?php

use App\Http\Controllers\Frontend\BlogController;
use App\Http\Controllers\Frontend\HomeController;
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
Route::get('/blog/{slug}',[BlogController::class,'detail'])->name('blog.detail');
Route::get('/blog/like/store',[BlogController::class,'likeStore'])->name('blog.like.store');

Auth::routes(['verify' => true]);

Route::middleware('verified')->group(function () {

});
