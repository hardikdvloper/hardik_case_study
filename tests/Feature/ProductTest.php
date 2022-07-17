<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Log, Auth;

class ProductTest extends TestCase
{
    /**
     * Authenticate user.
     *
     * @return void
     */
    protected function authenticate()
    {
        $user = User::create([
            'name' => 'test',
            'email' => rand(12345,678910).'test@gmail.com',
            'password' => bcrypt ($password = '123456789'),
        ]);

        if (!auth()->attempt(['email'=>$user->email, 'password'=>$password])) {
            return response(['message' => 'Login credentials are invaild']);
        }

        return $accessToken = Auth::user()->createToken('upayment')->accessToken;
    }

    /**
     * test create product.
     *
     * @return void
     */
    public function test_create_product()
    {
        $token = $this->authenticate();

        $categoryData = Category::where('category_name','Test Case')->first();
        if(!$categoryData) {
            $categoryData = Category::create([
                'category_name' => 'Test Case',
                'status' => '1'
            ]);
        }

        $response = $this->withHeaders([
            'Authorization' => 'Bearer '. $token,
        ])->json('POST','api/v1/product',[
            'product_name' => 'Lorem Ipsum',
            'product_price' => '50.20',
            'category_id' => $categoryData->id,
            'product_description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a libero orci. Quisque vehicula tempus elit. Maecenas viverra consequat enim sed ullamcorper. Phasellus maximus felis mauris, id laoreet purus pharetra vel.'
        ]);

        //Write the response in laravel.log
        Log::info(1, [$response->getContent()]);

        $response->assertStatus(200);
    }

    /**
     * test find product.
     *
     * @return void
     */
    public function test_find_product()
    {
        $token = $this->authenticate();

        $productData = Product::where('product_name','Lorem Ipsum')->first();

        $response = $this->withHeaders([
            'Authorization' => 'Bearer '. $token,
        ])->json('GET','api/v1/product/'.$productData->id);

        //Write the response in laravel.log
        Log::info(1, [$response->getContent()]);

        $response->assertStatus(200);
    }

    /**
     * test get all products.
     *
     * @return void
     */
    public function test_get_all_product()
    {
        $token = $this->authenticate();
        
        $response = $this->withHeaders([
            'Authorization' => 'Bearer '. $token,
        ])->json('GET','api/v1/product');

        //Write the response in laravel.log
        Log::info(1, [$response->getContent()]);

        $response->assertStatus(200);
    }
}
