<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\APITrait;
use App\Models\Cart;
use Validator, DB, Auth;

class CartController extends Controller
{
    use APITrait;

    /** 
     * Get all items of cart for authenticated user
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function index(Request $request) {
        $cartData = Cart::with('product','product.category')
                        ->where('user_id',$request->user('api')->id)
                        ->select("id","session_id","user_id","product_id","product_qty")
                        ->get();
        return $this->response("Cart data has been fetched successfully.",$cartData,"succ");
    }

    /** 
     * Get all items of cart for guest user.
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function show(Request $request,$id) {
        $cartData = Cart::with('product','product.category')
                        ->where('session_id',$id)
                        ->select("id","session_id","user_id","product_id","product_qty")
                        ->get();
        return $this->response("Cart data has been fetched successfully.",$cartData,"succ");
    }

    /** 
     * Add items to cart
     * 
     * @return \Illuminate\Http\Response 
     */
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [ 
            'session_id' => 'required|max:30',
            'product_id' => 'required|exists:products,id',
            'product_qty' => 'required|integer'
        ]);

        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }

        try {
            DB::beginTransaction();
                $cartArrData = $request->only(['session_id', 'product_id','product_qty']);
                if (Auth::check()) {
                    $cartArrData['user_id'] = Auth::user()->id;
                }

                $cartData = Cart::create($cartArrData);
            DB::commit();
            return $this->response("Product has been successfully added on cart",null,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }

    /** 
     * Update cart details
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function update(Request $request,$id) {
        $validator = Validator::make($request->all(), [
            'session_id' => 'required|exists:cart',
            'product_id' => 'required|exists:products,id',
            'product_qty' => 'required|integer'
        ]);

        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }

        try {
            DB::beginTransaction();
                $userId = ($request->user('api'))?$request->user('api')->id:null;
                $cartItemData = Cart::updateOrCreate(
                                    ['session_id'=>$request->session_id,'user_id'=>$userId,'product_id'=>$request->product_id],
                                    ['product_qty'=>$request->product_qty]
                                );
            DB::commit();
            return $this->response("Cart item has been updated successfully.",null,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }

    /** 
     * Delete cart item
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function destroy(Request $request,$sessionId) {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id'
        ]);

        if ($validator->fails()) { return $this->response($validator->errors()->first(),null,"val"); }

        try {
            DB::beginTransaction();
                $userId = ($request->user('api'))?$request->user('api')->id:null;
                $cartItemData = Cart::where(['session_id'=>$sessionId,'user_id'=>$userId,'product_id'=>$request->product_id])->first();
                if($cartItemData) {
                    $cartItemData->delete();
                }
            DB::commit();
            return $this->response("Product has been deleted from cart.",null,"succ");
        } catch (\Exception $e) {
            DB::rollback();
            return $this->response($e->getMessage(),null,"err");
        }
    }
}
