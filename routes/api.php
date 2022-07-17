<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\V1\AuthController;
use App\Http\Controllers\API\V1\ProductController;
use App\Http\Controllers\API\V1\CartController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route Group define version of API
Route::group(['prefix' => 'v1'], function(){

    // All Auth related routes
    Route::group(['prefix' => 'auth'], function(){
        Route::post('login', [AuthController::class, 'login']);
        Route::post('register', [AuthController::class, 'register']);
    });

    // Cart's APIs Route - Without Auth
    Route::apiResource('cart', CartController::class);

    // All routes which required authentication
    Route::group(['middleware' => 'auth:api'], function(){
        // Product's APIs Route
        Route::apiResource('product', ProductController::class);
        Route::post('product/{id}', [ProductController::class, 'show']);

        // Profile APIs Route
        Route::get('profile', [UserController::class, 'profile']);
    });
});