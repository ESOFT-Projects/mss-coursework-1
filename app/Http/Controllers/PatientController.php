<?php

namespace App\Http\Controllers;

use Dompdf\Exception;
use Illuminate\Http\Request;
use App\User;
use Auth;
use App\UserPrivilege;
use App\Patient;

use App\SpecializationArea;
use App\Employee;
use App\Doctor;

use Mail;
use File;
use PDF;



use Illuminate\Support\Facades\Session;

use Symfony\Component\HttpFoundation\Response;
//use App\Http\Resources\ConfigEnv;

class PatientController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('store','patient_search','specialization_area','doctors','update','cast_patients');
    }
	
	
	
   public function cast_patients(Request $request){
 
  
	   	
	    $patients = Patient::where($request->where_field,'like','%'.$request->keyword.'%')->paginate(5);	
	  

  
        foreach($patients as $patient){
		/*	
		  $doctor = Doctor::where('doctor_id',$appointment->doctor_id)->first();
		  $employee = Employee::where('employee_id',$doctor->employee_id)->first();		  
		  
		  $timeslot = TimeSlot::where('id',$appointment->time_slot_id)->first();
		  $appointment->timeslot_start = $timeslot->start_at;
		  $appointment->timeslot_end = $timeslot->end_at;
		  
		  $appointment->doctor_name =  $employee->first_name.' '.$employee->last_name;
		  $patient = Patient::where('patient_id',$appointment->patient_id)->first();
		  $appointment->patient =  $patient;	*/	  
		  
		}
 
 
		
	    echo json_encode($patients); 
  
    }		
	
	


public function patient_search(Request $request){

	$data =  Patient::orderBy('patient_id','ASC')->where($request->where_field, 'like', '%' . $request->keyword . '%')->get();
	foreach($data as $row){

	}
    echo json_encode($data);
}


    public function specialization_area()
    {
	     $data = array();
		 $areas = SpecializationArea::all();
		 $data['areas'] = $areas;
		 echo json_encode($data);
    }

    public function doctors(Request $request)
    {
	     $data = array();
		 $doctors = Doctor::where('specialization_id',$request->specialization_id)->get();;


		 foreach($doctors as $doctor){

			$employee = Employee::where('employee_id',$doctor->employee_id)->first();


			$doctor->first_name = $employee->first_name;
			$doctor->last_name =  $employee->last_name;
		 }


		 $data['doctors'] = $doctors;
		 echo json_encode($data);
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
	    $data = array();

	    try{
            $patient = new Patient();

            $patient->name = $request->name;
            if($request->age < 18){
                $patient->guardian_nic = $request->nic;
                $patient->nic = null;
            }else{
                $patient->nic = $request->nic;
                $patient->guardian_nic = null;
            }

            $patient->contact = $request->contact;
            $patient->gender = $request->gender;
            $patient->dob = $request->dob;

            $patient->address = $request->address;
            $patient->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Patient created successfully',
            ], 201);

        }catch(\Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong',
                'errors' => [
                    $e->getMessage(),
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


		$data = array();

        $patient = Patient::where('patient_id',$request->patient_id)->first();



		$patient->name = $request->name;
	    if($request->age < 18){
		$patient->guardian_nic = $request->nic;
		$patient->nic = null;
		}else{
		$patient->guardian_nic = null;
		$patient->nic = $request->nic;
		}
		$patient->contact = $request->contact;
		$patient->gender = $request->gender;
		$patient->dob = $request->dob;
		$patient->address = $request->address;
        $patient->save();
		$data['returnResponse'] = "Patient Updated";
        echo json_encode($data);



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
