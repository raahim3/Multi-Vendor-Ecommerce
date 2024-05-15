<?php

namespace App\Http\Controllers\Admin\Blog;

use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BlogCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['categories'] = BlogCategory::with('blog_sub_categories')->simplePaginate(10);
        return view('admin.blog.category.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.blog.category.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'=>'required | unique:categories',
        ]);


        $category = new BlogCategory();
        $category->title = $request->title;
        $category->slug = Str::slug($request->title);
        $category->save();
        return redirect()->route('admin.blog.category.index')->with('success', 'Blog Category has been created successfully');
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
        $data['category'] = BlogCategory::find($id);
        return view('admin.blog.category.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title'=>'required ',
        ]);

        $category = BlogCategory::find($id);
        $category->title = $request->title;
        $category->slug = Str::slug($request->title);
        $category->update();
        return redirect()->route('admin.blog.category.index')->with('success', 'Blog Category has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = BlogCategory::find($id);
        $category->delete();
        return redirect()->back()->with('success', 'Blog Category has been deleted successfully');
    }
}
