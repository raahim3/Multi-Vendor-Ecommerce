<?php

use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\Blog\BlogCategoryController;
use App\Http\Controllers\Admin\Blog\BlogController;
use App\Http\Controllers\Admin\Blog\BlogSubCategoryController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CommentController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\Setting\GeneralController;
use App\Http\Controllers\Admin\Setting\SmtpController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\VendorController;
use App\Http\Controllers\Vendor\ProductController as VendorProductController;
use Illuminate\Support\Facades\Route;


Route::get('admin/login', [LoginController::class, 'index'])->name('admin.login.get');
Route::post('admin/login', [LoginController::class, 'login'])->name('admin.login');
Route::post('admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

Route::prefix('admin')->middleware('isAdmin')->group(function () {

    Route::get('/dashboard', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::name('admin.')->group(function () {

        // Vendor Routes
        Route::resource('vendors', VendorController::class);
        Route::get('change_status',[VendorController::class, 'change_status'])->name('vendors.change_status');

        // Customer Routes
        Route::resource('customers', UserController::class);

        //Category Route
        Route::resource('categories', CategoryController::class);

        //Sub Category Route
        Route::resource('sub_categories', SubCategoryController::class);

        // Product Route
        Route::resource('product',ProductController::class);
        Route::get('get_sub_categories',[ProductController::class,'get_sub_categories'])->name('product.get_sub_categories');
        Route::get('change_product_status',[ProductController::class,'change_product_status'])->name('product.change_product_status');
        Route::get('delete_sub_cate_image',[ProductController::class,'delete_sub_cate_image'])->name('product.delete_sub_cate_image');

        //Blog Category Route
        Route::resource('post/blogs', BlogController::class);
        Route::get('get_blog_sub_categories',[BlogController::class,'get_sub_categories'])->name('blog.get_sub_categories');
        Route::get('change_blog_status',[BlogController::class,'change_blog_status'])->name('blog.change_product_status');

        Route::resource('/comments', CommentController::class);
        Route::get('/change_status/comments',[CommentController::class,'change_status'])->name('comments.change_status');

        Route::name('blog.')->group(function(){
            Route::resource('post/blog/category', BlogCategoryController::class);
            Route::resource('post/blog/sub_category', BlogSubCategoryController::class);
        });

    });


    Route::prefix('settings')->group(function(){
        // General Setting Routes
        Route::get('/general',[GeneralController::class, 'index'])->name('admin.settings.general');
        Route::post('/general/update',[GeneralController::class, 'update'])->name('admin.settings.general.update');
        Route::get('/general/logo/delete',[GeneralController::class, 'logo_delete'])->name('admin.settings.general.logo');
        Route::get('/general/favicon/delete',[GeneralController::class, 'favicon_delete'])->name('admin.settings.general.favicon');

        // General SMTP Routes
        Route::get('/smtp',[SmtpController::class, 'index'])->name('admin.settings.smtp');
        Route::post('/smtp/update',[SmtpController::class, 'update'])->name('admin.settings.smtp.update');

        // Blog Setting
        Route::get('/blog_settings',[GeneralController::class, 'blog_settings'])->name('admin.settings.blog_settings');
        Route::post('/blog_settings',[GeneralController::class, 'blog_settings_post'])->name('admin.settings.blog_settings.post');


    });
});

