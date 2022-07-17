<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class Cart extends Model
{
    use HasFactory;

    /**
     * The attributes that contain table name.
     *
     * @var string
     */
    protected $table = 'cart';

    /**
     * The attributes that are mass assignable for Cart table.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'session_id',
        'user_id',
        'product_id',
        'product_qty'
    ];

    /**
     * The attributes that should be cast for Cart Table.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'user_id' => 'integer',
        'product_id' => 'integer',
        'product_qty' => 'integer',
        'created_at' => 'timestamp',
        'updated_at' => 'timestamp'
    ];

    /**
     * The function get product record with relation
     *
     * @var object
     */
    public function product() {
        return $this->hasOne(Product::class, 'id', 'product_id')->select('id','product_name','product_price','product_description','product_avatar','category_id');
    }
}
