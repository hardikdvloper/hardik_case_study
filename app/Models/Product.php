<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;
use Storage;

class Product extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable for Product table.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'product_name',
        'product_price',
        'category_id',
        'product_description',
        'product_avatar',
        'status'
    ];

    /**
     * The attributes that should be cast for Product Table.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'user_id' => 'integer',
        'product_price' => 'decimal:2',
        'category_id' => 'integer',
        'status' => 'integer',
        'created_at' => 'timestamp',
        'updated_at' => 'timestamp'
    ];

    /**
     * The function get category record with relation
     *
     * @var object
     */
    public function category() {
        return $this->hasOne(Category::class, 'id', 'category_id')->select('id','category_name');
    }

    public function getProductAvatarAttribute($filePath){
        if($filePath) {
            return asset(Storage::disk('local')->url($filePath));
        } else {
            return null;
        }
    }
}
