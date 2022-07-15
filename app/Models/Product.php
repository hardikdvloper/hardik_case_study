<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        'created_at' => 'timestamp'
    ];
}
