<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use Log;

class AuthTest extends TestCase
{
    /**
     * Register feature test case.
     *
     * @return void
     */
    public function testRegister()
    {
        $response = $this->json('POST', '/api/v1/auth/register', [
            'name'  =>  $name = 'Test',
            'email'  =>  $email = time().'test@example.com',
            'phone' => rand(1111111111,9999999999),
            'password'  =>  $password = '123456789',
        ]);

        //Write the response in laravel.log
        Log::info(1, [$response->getContent()]);

        $response->assertStatus(200);

        // Receive our token
        $this->assertArrayHasKey('token',$response->json()['data']);
    }

    /**
     * Login feature test case.
     *
     * @return void
     */
    public function testLogin()
    {
        // Creating Users
        User::create([
            'name' => 'Test',
            'email'=> $email = time().'@example.com',
            'password' => bcrypt ($password = '123456789')
        ]);

        // Simulated landing
        $response = $this->json('POST','/api/v1/auth/login',[
            'email' => $email,
            'password' => $password,
        ]);

        //Write the response in laravel.log
        Log::info(1, [$response->getContent()]);

        // Determine whether the login is successful and receive token 
        $response->assertStatus(200);

        $this->assertArrayHasKey('token',$response->json()['data']);

        // Delete users
        User::where('email','test@gmail.com')->delete();
    }
}
