<?php

namespace App\Traits;
use App\Models\User;

trait APITrait {

    /** 
     * API Responser
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function response($message,$data,$responseCode) {
        return response()->json(['message'=>$message, 'data'=>$data, 'status'=>1], 200);
    }
}