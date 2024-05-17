<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;

    public function blog_category(){
        return $this->belongsTo(BlogCategory::class);
    }

    public function blog_sub_category(){
        return $this->belongsTo(BlogSubCategory::class);
    }
    public function admin(){
        return $this->belongsTo(Admin::class);
    }
    public function likes(){
        return $this->hasMany(BlogLike::class);
    }
    public function comments(){
        return $this->hasMany(BlogComment::class);
    }
}
