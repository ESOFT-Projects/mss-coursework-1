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
use Illuminate\Support\Arr;
//use App\Http\Resources\ConfigEnv;

class CategoryController extends Controller
{
	
    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('index','cast_categories','store','update','destroy');
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
	   $data['categories'] = ProductCategory::orderBy('category_id','ASC')->get();
       echo json_encode($data); 	
	 
    }
	

   public function cast_categories(Request $request){
 
  
	   	
	    $categories = ProductCategory::where('title','like','%'.$request->keyword.'%')->orderBy('category_id','ASC')->paginate(5);	
	   
 
 
		
	    echo json_encode($categories); 
  
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
             
			
            $category = $this->createCategory($request->only([
                'title'
            ]));

          

            return response()->json([
                'status' => 'success',
                'data' => compact('category'),
                'message' => 'Category created successfully',
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
             
			
           $category = ProductCategory::where('category_id',$id)->first(); 
           $category->title = $request->title;
           $category->save();

            return response()->json([
                'status' => 'success',
                'data' => compact('category'),
                'message' => 'Category updated successfully',
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
        ProductCategory::where('category_id',$id)->delete();
        return response()->json([
                'status' => 'success',
                
                'message' => 'Category deleted successfully',
            ], 200);
    }
	
	
    /**
     * @param $data
     * @return mixed
     */
    private function createCategory($data)
    {
        $productData = Arr::only($data, [
            'title' 
        ]);

        

        return ProductCategory::create($productData);
    }

    /**
     * @param Request $request
     * @param $patient
     */	
	
	
	
}
