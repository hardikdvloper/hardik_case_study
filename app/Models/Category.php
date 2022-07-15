<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable for Categories table.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'category_name',
        'status'
    ];

    /**
     * The attributes that should be cast for Categories Table.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'status' => 'integer',
        'created_at' => 'timestamp'
    ];
}
