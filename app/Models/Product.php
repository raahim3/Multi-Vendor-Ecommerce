<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function sub_category()
    {
        return $this->belongsTo(SubCategory::class);
    }
    
    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }
    public function colors()
    {
        return $this->hasMany(ProductColor::class);
    }
    public function sizes()
    {
        return $this->hasMany(ProductSize::class);
    }
    public function addtional_infos()
    {
        return $this->hasMany(ProductAdditionalInfo::class);
    }
    public function carts(){
        return $this->hasMany(Cart::class);
    }
    public function order(){
        return $this->hasMany(OrderItem::class);
    }

    public function percentageSold()
    {
        $totalOrdered = $this->order()->sum('quantity');
        $totalStock = $this->quantity;

        if ($totalStock > 0) {
            return ($totalOrdered / $totalStock) * 100;
        }

        return 0;
    }
}
