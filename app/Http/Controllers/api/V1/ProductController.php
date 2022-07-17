<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\APITrait;
use App\Models\Product;
use App\Models\Category;
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
        return $this->response("Product data has been fetched.",['product_id'=>$productData],"succ");
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
            'product_description' => 'required|max:500',
            'product_avatar' => 'nullable|image|mimes:jpg,png,jpeg,gif,svg|max:2048'
        ]);

        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }

        try {
            DB::beginTransaction();
                $productData = Product::create($request->only(['product_name', 'product_price','category_id','product_description']));

                // Upload Product Avatar File
                if($productData && $request->product_avatar){
                    $filePath = $request->file('product_avatar')->store('public/images');

                    // Save Avatar path in product table
                    $productData->product_avatar = $filePath;
                    $productData->save();
                }
            DB::commit();
            return $this->response("Product data has been added successfully.",['product_id'=>$productData->id],"succ");
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
        return $this->response("Product data has been fetched.",['product_id'=>$productData],"succ");
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
            return $this->response("Product has been deleted succesfully",null,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }

    /** 
     * Category List API
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function getCategoryList(Request $request) {
        $categoryData = Category::select('id','category_name')->get();
        return $this->response("Category data has been fetched successfully",$categoryData,"succ");
    }
}
