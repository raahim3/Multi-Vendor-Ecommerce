<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BlogComment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index()
    {
        $data['comments'] = BlogComment::with('blog')->latest()->paginate(10);
        return view('admin.blog.comment.index',$data);
    }

    public function change_status(Request $request)
    {
        $comment = BlogComment::find($request->comment_id);
        if($comment->status == 1){
            $comment->status = 0;
        }else{
            $comment->status = 1;
        }
        $comment->update();
        return response()->json(['status'=>$comment->status]);
    }
    public function destroy($id){
        $comment = BlogComment::find($id);
        $comment->delete();
        return redirect()->back()->with('success','Comment Deleted Successfully!');
    }
}
