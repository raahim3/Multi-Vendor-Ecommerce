<?php

namespace App\Http\Controllers\Admin\Blog;

use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use App\Models\BlogSubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class BlogSubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['sub_categories'] = BlogSubCategory::with('blog_category')->simplePaginate(10);
        return view('admin.blog.sub_category.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data['categories'] = BlogCategory::all();
        return view('admin.blog.sub_category.create',$data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        
        $request->validate([
            'title'=>'required',
            'category_id'=>'required',
        ]);
        foreach($request->title as $key => $title)
        {
            $sub_category = new BlogSubCategory();
            $sub_category->title = $title;
            $sub_category->slug = Str::slug($title);
            $sub_category->blog_category_id = $request->category_id;
            $sub_category->save();
        }
        return redirect()->route('admin.blog.sub_category.index')->with('success', 'Blog Sub Category has been created successfully');
    
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
        $data['sub_category'] = BlogSubCategory::find($id);
        $data['categories'] = BlogCategory::all();
        return view('admin.blog.sub_category.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        
        $request->validate([
            'title'=>'required',
            'category_id'=>'required',
        ]);


        $sub_category = BlogSubCategory::find($id);
        $sub_category->title = $request->title;
        $sub_category->slug = Str::slug($request->title);
        $sub_category->blog_category_id = $request->category_id;
        $sub_category->update();
        return redirect()->route('admin.blog.sub_category.index')->with('success', 'Blog Sub Category has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sub_category = BlogSubCategory::find($id);
        $sub_category->delete();
        return redirect()->back()->with('success', 'Blog Sub Category has been deleted successfully');
    }
}
