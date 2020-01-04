<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Redirect;
use Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;

class RegisterController extends Controller
{
   public function store()
    {
        $this->validate(request(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
			'address' => 'required'
        ]);
        
        $user = User::create(request(['name', 'email', 'password', 'address']));
        
        //auth()->login($user);
        
        return redirect()->to('/register');
    }
	
   public function login()
    {
$rules = array(
    'email'    => 'required', // make sure the email is an actual email
    'password' => 'required' // password can only be alphanumeric and has to be greater than 3 characters
);

// run the validation rules on the inputs from the form
$validator = Validator::make(Input::all(), $rules);

// if the validator fails, redirect back to the form
if ($validator->fails()) {
    return Redirect::to('/in')
        ->withErrors($validator) // send back all errors to the login form
        ->withInput(Input::except('password')); // send back the input (not the password) so that we can repopulate the form
} else {

    // create our user data for the authentication
    $userdata = array(
        'email'     => Input::get('email'),
        'password'  => Input::get('password')
    );

    // attempt to do the login
    if (Auth::attempt($userdata)) {

         echo 'in';
        //return Redirect::to('/');

    } else {        

        echo 'out';
        //return Redirect::to('login');

    }

}   
    }	
	
}
