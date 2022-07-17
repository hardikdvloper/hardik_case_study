<?php

namespace App\Http\Controllers\API\V1;

use App\Traits\APITrait;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Validator, Auth, DB, Hash;

class AuthController extends Controller
{
    use APITrait;

    /** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(Request $request) {
        $validator = Validator::make($request->all(), [ 
            'email' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->response($validator->errors()->first(),null,"val");
        }

        $attempt = Auth::attempt(['email' => request('email'), 'password' => request('password')]);

        if($attempt){
            $userResponse = ["id"=>Auth::user()->id,"name"=>Auth::user()->name,"email"=>Auth::user()->email];
            $userResponse['token'] = Auth::user()->createToken('upayment')->accessToken;

            return $this->response("You have successfully logged-in.",$userResponse,"succ");
        } else{
            return $this->response("You have entered an invalid username or password.",null,"val");
        }
    }

    /** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    {
        $validator = Validator::make($request->all(), [ 
            'name' => 'required|max:100',
            'email' =>  'required|email|max:150',
            'phone' => 'required|max:10',
            'password' => 'required|min:6|max:30'
        ]);
  
        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }
        try {
            DB::beginTransaction();
                $request['password'] = Hash::make($request->password);
            
                $userData = User::create($request->all());
                $userResponse = ["id"=>$userData->id,"name"=>$userData->name,"email"=>$userData->email];
                $userResponse['token'] =  $userData->createToken('upayment')->accessToken;
            DB::commit();

            return $this->response("You have successfully register.",$userResponse,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }
}
