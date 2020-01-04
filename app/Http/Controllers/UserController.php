<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Company;
use App\Department;
use Auth;
use App\UserPrivilege;
use App\Violation;
use App\Hazard;
use App\OAuthClient;
use Illuminate\Support\Facades\Session;
use Hash;
use Symfony\Component\HttpFoundation\Response;
//use App\Http\Resources\ConfigEnv;

class UserController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('index','create','store','show','edit','update','destroy','in','oauth_client_me');
		//new ConfigEnv();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		echo auth()->guard('api')->user();
    }


    public function oauth_client_me(Request $request)
    {
		$user = User::where('email',$request->username)->first();

        if($user){
            if(Hash::check($request->password, $user->password)){

                    $client = OAuthClient::where('password_client',1)->first();
                    $data = array();
                    $data['client'] = array((object)['client_id'=>$client->id,'client_secret'=>$client->secret]);
                    echo json_encode($data);
            }
		}

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







    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
}
