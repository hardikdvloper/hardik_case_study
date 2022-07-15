<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        'created_at' => 'timestamp'
    ];
}
