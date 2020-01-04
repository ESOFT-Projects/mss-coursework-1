<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DoctorPatientController extends Controller
{
    public function index()
    {
        if(auth()->check()){
            $patients = auth()->user()->patient;

            return response()->json([
                'status' => 'success',
                'data' => compact('patients'),
            ], 200);
        }

        return response()->json([
            'status' => 'unauthorized',
            'message' => 'User not authorized',
        ], 403);
    }
}
