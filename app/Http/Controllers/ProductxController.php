<?php

namespace App\Http\Controllers;

use App\Appointment;
use App\HospitalCharge;
use Illuminate\Http\Request;
use App\User;
use Auth;
use App\UserPrivilege;
use App\Patient;
use App\Product;
use App\ProductCategory;
use App\ProductBrand;
use App\SpecializationArea;
use App\Employee;
use App\Doctor;
use App\TimeSlot;


use Illuminate\Support\Arr;
use Mail;
use File;
use PDF;



use Illuminate\Support\Facades\Session;

use Symfony\Component\HttpFoundation\Response;
//use App\Http\Resources\ConfigEnv;

class ProductxController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('index','store','createProduct','search_product','cast_products','destroy','update');
    }

    
public function search_product(Request $request){
    $request_data=array();
    foreach($request->all() as $property => $value){
      $request_data[$property]=json_decode($value);
    }
	$data =  Product::orderBy('product_id','ASC')->where([['title','like','%'.$request_data['keyword'].'%'],['status_id','=','1']])->get();
	foreach($data as $row){

	}
    echo json_encode($data);
}	


   public function cast_products(Request $request){
 
  
	   	
	    $products = Product::where('title','like','%'.$request->keyword.'%')->orderBy('product_id','ASC')->paginate(5);	
	  

  
        foreach($products as $product){
			
		  $category = ProductCategory::where('category_id',$product->category_id)->first();
		  $brand = ProductBrand::where('brand_id',$product->brand_id)->first();		  
		  $product->category_title = $category->title;
		  $product->brand_title = $brand->title;		  
		}
 
 
		
	    echo json_encode($products); 
  
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
             
			
            $product = $this->createProduct($request->only([
                'category_id', 'brand_id', 'units', 'title', 'model', 'price'
            ]));

          

            return response()->json([
                'status' => 'success',
                'data' => compact('product'),
                'message' => 'Product created successfully',
            ], 200);

        }catch(\Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong',
                'errors' => [
                    $e->getMessage()
                ]
            ], 500);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
             
			
           $product = Product::where('product_id',$id)->first(); 
           $product->title = $request->title;
           $product->save();

            return response()->json([
                'status' => 'success',
                'data' => compact('product'),
                'message' => 'Product updated successfully',
            ], 200);

        }catch(\Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong',
                'errors' => [
                    $e->getMessage()
                ]
            ], 500);
        }		
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Product::where('product_id',$id)->delete();
        return response()->json([
                'status' => 'success',
                
                'message' => 'Product deleted successfully',
            ], 200);		
    }

    /**
     * @param $data
     * @return mixed
     */
    private function createProduct($data)
    {
        $productData = Arr::only($data, [
            'category_id', 'brand_id', 'units', 'title', 'model', 'price'
        ]);

        

        return Product::create($productData);
    }

    /**
     * @param Request $request
     * @param $patient
     */
    


}
