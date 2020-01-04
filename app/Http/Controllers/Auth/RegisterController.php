<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use File;
use Illuminate\Support\Facades\Input;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
			'address' => 'required',
			'nic' => 'required',
            'company' => 'required',
            'department' => 'required',
			'designation' => 'required',
            'contact' => 'required',
            'employee_number' => 'required',
            'shift' => 'required',
            'avatar' => 'required' 
 
			 
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
     /*   return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
			'address' => $data['address'],			 
			'nic' => $data['nic'],
			'company_id' => $data['company'],
			'department_id' => $data['department'],
			'designation' => $data['designation'],
			'contact' => $data['contact'],
			'employee_number' => $data['employee_number'],
			'shift' => $data['shift']			
			  
			 
        ]);  */
		
		
    $fileName = 'null';
    if (Input::file('avatar')->isValid()) {       
        $extension = Input::file('avatar')->getClientOriginalExtension();
        $fileName = uniqid().'.'.$extension;
    }		
		
		
		
$userModel = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
			'address' => $data['address'],			 
			'nic' => $data['nic'],
			'company_id' => $data['company'],
			'department_id' => $data['department'],
			'designation' => $data['designation'],
			'contact' => $data['contact'],
			'employee_number' => $data['employee_number'],
			'shift' => $data['shift'],
			'avatar' => $fileName			
			   
			 
        ]);
$userModel->save();
$id = $userModel->id;		
File::makeDirectory('images/users/'.$id, 0755, true);		
Input::file('avatar')->move('images/users/'.$id, $fileName);		
 	
		
		
		
		
    }
}
