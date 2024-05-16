<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\BlogLike;
use App\Models\BlogSubCategory;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function detail($slug)
    {
        $data['blog'] = Blog::with('admin','blog_category','blog_sub_category','likes')->where('slug',$slug)->first();
        $data['recent_blogs'] = Blog::latest()->take(4)->get();
        $data['sub_categories'] = BlogSubCategory::with('blog')->where('blog_category_id',$data['blog']->blog_category_id)->get();
        if (auth()->guard('vendor')->user()) {
            $data['isLike'] = auth()->guard('vendor')->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }else if (auth()->guard('admin')->user()) {
            $data['isLike'] = auth()->guard('admin')->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }else{
            $data['isLike'] = auth()->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }
        return view('frontend.blogs.detail',$data);
    }

    public function likeStore(Request $request)
    {
        if($request->like_id)
        {
            $like = BlogLike::find($request->like_id);
            $like->delete();
            $blog = Blog::with('likes')->find($request->blog_id);
            return response()->json(['status'=>'unlike','likes'=>count($blog->likes)]);  
        }
        else
        {
            $like = new BlogLike();
            $like->blog_id = $request->blog_id;
            if (auth()->guard('vendor')->user()) {
                $like->vendor_id = $request->vendor_id;
            }else if (auth()->guard('admin')->user()) {
                $like->admin_id = $request->admin_id;
            }else{
                $like->user_id = $request->user_id;
            }
            $like->save();
            $blog = Blog::with('likes')->find($request->blog_id);
            return response()->json(['status'=>'store','like_id'=>$like->id,'likes'=>count($blog->likes)]);  
        }
    }
}
