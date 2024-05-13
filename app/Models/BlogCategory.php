<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BlogCategory extends Model
{
    use HasFactory;
    public function blog_sub_categories()
    {
        return $this->hasMany(BlogSubCategory::class);
    }
}
