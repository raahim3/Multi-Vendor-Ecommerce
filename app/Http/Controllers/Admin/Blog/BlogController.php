<?php

namespace App\Http\Controllers\Admin\Blog;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\BlogSubCategory;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['blogs'] = Blog::with('blog_category','blog_sub_category')->orderByDesc('id')->simplePaginate(10);
        return view('admin.blog.blog.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['categories'] = BlogCategory::all();
        $data['vendors'] = Vendor::all();
        return view('admin.blog.blog.create',$data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'=>'required',
            'description'=>'required',
            'content'=>'required',
            'category_id'=>'required',
            'status'=>'required',
            'image'=>'required | image',
        ]);

        $blog = new Blog();
        $blog->title = $request->title;
        $blog->slug = Str::slug($request->title);
        $blog->description = $request->description;
        $blog->content = $request->content;
        $blog->blog_category_id = $request->category_id;
        $blog->blog_sub_category_id = 1;
        $blog->admin_id = auth()->guard('admin')->user()->id;
        $blog->status = $request->status;
        $blog->meta_title = $request->meta_title;
        $blog->meta_description = $request->meta_description;
        $blog->meta_keywords = $request->meta_keywords;
        $img = $request->file('image');
        $ext = rand().".".$img->getClientOriginalName();
        $img->move("blog_image/",$ext);
        $blog->image = $ext;
        $blog->save();

        return redirect()->route('admin.blogs.index')->with('success','Blog Created Successfully!');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data['blog'] = Blog::find($id);
        $data['categories'] = BlogCategory::all();
        return view('admin.blog.blog.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
       
        $request->validate([
            'title'=>'required',
            'description'=>'required',
            'content'=>'required',
            'category_id'=>'required',
            'status'=>'required',
        ]);

        $blog = Blog::find($id);
        $blog->title = $request->title;
        $blog->slug = Str::slug($request->title);
        $blog->description = $request->description;
        $blog->content = $request->content;
        $blog->blog_category_id = $request->category_id;
        $blog->blog_sub_category_id = 1;
        $blog->admin_id = auth()->guard('admin')->user()->id;
        $blog->status = $request->status;
        $blog->meta_title = $request->meta_title;
        $blog->meta_description = $request->meta_description;
        $blog->meta_keywords = $request->meta_keywords;
        if($request->image)
        {
            $mainimagePath = public_path("blog_image/{$blog->image}");
            if (file_exists($mainimagePath)) {
                unlink($mainimagePath);
            }

            $img = $request->file('image');
            $ext = rand().".".$img->getClientOriginalName();
            $img->move("blog_image/",$ext);
            $blog->image = $ext;
        }
        $blog->update();

        return redirect()->route('admin.blogs.index')->with('success','Blog Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $blog = Blog::findOrFail($id);
        $mainimagePath = public_path("blog_image/{$blog->image}");
        if (file_exists($mainimagePath)) {
            unlink($mainimagePath);
        }
        $blog->delete();
        return redirect()->back()->with('success', 'Blog and associated images deleted successfully!');

    }

    public function get_sub_categories(Request $request)
    {
        $sub_cate_id = $request->sub_cate_id ?? 0 ;
        $sub_categories = BlogSubCategory::where('blog_category_id', $request->id)->get();
        if($sub_cate_id != 0)
        {
            $html = "";
        }else{
            $html = "<option selected disabled>Select Sub Category</option>";
        }
        foreach ($sub_categories as $sub_category) {
            $html .= '<option value="' . $sub_category->id . '" ' . ($sub_category->id == $sub_cate_id ? "selected" : "") . '>' . $sub_category->title . '</option>';
        }

        return response()->json($html);
    }

    public function change_blog_status(Request $request)
    {
        $blog = Blog::find($request->id);
        $blog->status = $request->status;
        $blog->update();
        return response()->json(['success'=>'Blog Status Updated Successfully']);
    }
}
