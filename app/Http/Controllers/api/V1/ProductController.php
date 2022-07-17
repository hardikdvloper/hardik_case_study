<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\APITrait;
use App\Models\Product;
use Validator, DB, Auth;

class ProductController extends Controller
{
    use APITrait;

    /** 
     * Get all product
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function index(Request $request) {
        $productData = Product::with('category')
                                ->select('id','product_name','product_price','category_id','product_description','product_avatar')
                                ->where('status','1')
                                ->paginate(10);
        return $this->response("You have successfully register.",['product_id'=>$productData],"succ");
    }

    /** 
     * Add product
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [ 
            'product_name' => 'required|max:100',
            'product_price' =>  'required|max:255',
            'category_id' => 'required|exists:categories,id',
            'product_description' => 'required|max:500'
        ]);

        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }

        try {
            DB::beginTransaction();
                $productData = Product::create($request->only(['product_name', 'product_price','category_id','product_description']));
            DB::commit();
            return $this->response("You have successfully register.",['product_id'=>$productData->id],"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }

    /** 
     * Show particular product detail
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function show(Request $request,$id) {
        $productData = Product::with('category')
                                ->select('id','product_name','product_price','category_id','product_description','product_avatar')
                                ->find($id);
        return $this->response("You have successfully register.",['product_id'=>$productData],"succ");
    }

    /** 
     * Delete product permanently 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function destroy(Request $request,$id) {
        try {
            DB::beginTransaction();
                $productData = Product::find($id);
                if($productData) {
                    $productData->delete();
                }
            DB::commit();
            return $this->response("You have successfully register.",null,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }
}
