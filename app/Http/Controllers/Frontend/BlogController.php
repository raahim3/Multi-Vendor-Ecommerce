<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\Setting\General;
use App\Models\Blog;
use App\Models\BlogComment;
use App\Models\BlogLike;
use App\Models\BlogSubCategory;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function index()
    {
        $data['blogs'] = Blog::with('admin','blog_category','blog_sub_category','comments')->where('status',1)->latest()->paginate(10);
        $data['recent_blogs'] = Blog::latest()->take(4)->get();
        $subCategories = [];
        foreach ($data['blogs'] as $key => $blog) {
            array_push($subCategories , $blog->blog_sub_category_id);
        }
        $data['sub_categories'] = BlogSubCategory::with('blog')->whereIn('id',$subCategories)->get();
        return view('frontend.blogs.index',$data);
    }
    public function detail($slug)
    {
        $data['blog'] = Blog::with('admin','blog_category','blog_sub_category','likes','comments')->where('slug',$slug)->first();
        $data['recent_blogs'] = Blog::latest()->take(4)->get();
        $data['sub_categories'] = BlogSubCategory::with('blog')->where('blog_category_id',$data['blog']->blog_category_id)->get();
        if (auth()->guard('vendor')->user()) {
            $data['isLike'] = auth()->guard('vendor')->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }else if (auth()->guard('admin')->user()) {
            $data['isLike'] = auth()->guard('admin')->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }else if (auth()->user()){
            $data['isLike'] = auth()->user()->likes()->where('blog_id',$data['blog']->id)->first();
        }else{
            $data['isLike'] = "";
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
    public function commentStore(Request $request){

        $settings = General::first();

        if($request->name == null || $request->name == "" && $request->email == null || $request->email == "" && $request->comment == null || $request->comment == ""){
            return response()->json(['status'=>'error','message'=>'All Fields is required']);  
        }
        $comment = new BlogComment();
        $comment->blog_id = $request->blog_id;
        if (auth()->guard('vendor')->user()) {
            $comment->vendor_id = $request->vendor_id;
        }else if (auth()->guard('admin')->user()) {
            $comment->admin_id = $request->admin_id;
        }else{
            $comment->user_id = $request->user_id;
        }
        $comment->name = $request->name;
        $comment->email = $request->email;
        $comment->comment = $request->comment;
        if($settings->comment_approaval == 1){
            $comment->status = 0;
        }else{
            $comment->status = 1;
        }
        $comment->save();

        $blog = Blog::with('likes')->find($request->blog_id);
        $commentCount = $blog->comments()->where('status',1)->get();

        if($comment->status == 1){
        $html = '<li class="d-flex gap-2  pb-3 mb-3"><div><img src="'.asset('default_avatar.jpg') .'" width="50px" height="50px" class="rounded-circle" alt="">';
        $html .= '</div><div><p class="m-0"><strong>'.$comment->name.'</strong></p><p class="m-0 text-muted">'.$comment->comment.'</p></div></li>';
        }
        else{
            $html = '';
        }
        return response()->json(['status'=>'success','html'=>$html,'comment_status'=>$comment->status,'comment_count'=>count($commentCount)]);  


    }
}
