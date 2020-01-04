<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Company;
use App\Department;
use Auth;
use App\UserPrivilege;
use App\ProductCategory;
use App\ProductBrand;
use App\OAuthClient;
use Illuminate\Support\Facades\Session;
use Hash; 
use Symfony\Component\HttpFoundation\Response;
//use App\Http\Resources\ConfigEnv;
use Illuminate\Support\Arr;


class BrandController extends Controller
{
	
    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('index','cast_brands','store','update','destroy');
		//new ConfigEnv(); 
    }	
	
	
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


	 public function index()
    {

       $data = array();
	   $data['brands'] = ProductBrand::orderBy('brand_id','ASC')->get();
       echo json_encode($data); 	
	 
    }
	

   public function cast_brands(Request $request){
 
  
	   	
	    $brands = ProductBrand::where('title','like','%'.$request->keyword.'%')->orderBy('brand_id','ASC')->paginate(5);	
	   
 
 
		
	    echo json_encode($brands); 
  
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
             
			
            $brand = $this->createBrand($request->only([
                'title'
            ]));

          

            return response()->json([
                'status' => 'success',
                'data' => compact('brand'),
                'message' => 'Brand created successfully',
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
             
			
           $brand = ProductBrand::where('brand_id',$id)->first(); 
           $brand->title = $request->title;
           $brand->save();

            return response()->json([
                'status' => 'success',
                'data' => compact('brand'),
                'message' => 'Brand updated successfully',
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
        ProductBrand::where('brand_id',$id)->delete();
        return response()->json([
                'status' => 'success',
                
                'message' => 'Brand deleted successfully',
            ], 200);
    }
	
	
    /**
     * @param $data
     * @return mixed
     */
    private function createBrand($data)
    {
        $productData = Arr::only($data, [
            'title' 
        ]);

        

        return ProductBrand::create($productData);
    }

    /**
     * @param Request $request
     * @param $patient
     */	
}
