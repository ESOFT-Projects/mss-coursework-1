<?php

namespace App\Http\Controllers;

use App\Appointment;
use App\HospitalCharge;
use Illuminate\Http\Request;
use App\User;
use Auth;
use App\UserPrivilege;
use App\Patient;

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

class AppointmentController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('index','show','time_slots','store');
    }

    public function time_slots()
    {
		 $data = array();
		 $data['slots'] = TimeSlot::orderBy('id','ASC')->get();
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
		 
		 
        try{
            // save patient first
            $patient = $this->createAppointmentPatient($request->only([
                'name', 'nic', 'guardian_nic', 'gender', 'dob', 'contact', 'address'
            ]),$request->age);

            /// Place appointment
            $appointment = $this->createAppointment($request->only([
                'date', 'time_slot_id', 'doctor_id',
            ]), $patient);

            // create invoice
            $invoice = $this->createInvoice($appointment);  

            return response()->json([
                'status' => 'success',
                'data' => compact('patient', 'appointment', 'invoice'),
                'message' => 'Appointment created successfully',
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

    /**
     * @param $data
     * @return mixed
     */
    private function createAppointmentPatient($data,$age)
    {
        $patientData = Arr::only($data, [
            'name', 'nic', 'gender', 'dob', 'contact', 'address',
        ]);

        if (  $age < 18 ) {
            $patientData['nic'] = $data['guardian_nic'];
        }

        return Patient::create($patientData);
    }

    /**
     * @param Request $request
     * @param $patient
     */
    private function createAppointment($data, $patient)
    {
        $appointmentData = Arr::only($data, [
            'date', 'time_slot_id', 'doctor_id',
        ]);

        $appointmentData['patient_id'] = $patient->id;

        $todaysLastAppointment = Appointment::where('date', date('Y-m-d'))
            ->latest()
            ->first();

        if ($todaysLastAppointment) {
            $appointmentData['number'] = $todaysLastAppointment->number + 1;
        } else {
            $appointmentData['number'] = 1;
        }

        return Appointment::create($appointmentData);
    }

    private function createInvoice($appointment)
    {
        // Calculate doctor charges
        $totalDoctorCharge = $this->calculateDoctorCharges($appointment);

        // Calculate hospital charges
        $totalHospitalCharge = $this->calculateHospitalCharges();

        return $appointment->invoice()->create([
            'total' => ($totalDoctorCharge + $totalHospitalCharge) * 100,
        ]); 
    }


    private function calculateHospitalCharges()
    {
        $totalHospitalCharge = 0;

        $hospitalCharges = HospitalCharge::whereHas(['type' => function ($query) {
                $query->where('type', 'APPOINTMENT');
                $query->orWhere('type', 'SERVICE_CHARGE');
            }])
            ->get();

        $hospitalCharges->map(function ($charge) use ($totalHospitalCharge) {
            return $totalHospitalCharge = $totalHospitalCharge + $charge;
        });

        return $totalHospitalCharge;
    }

    private function calculateDoctorCharges($appointment)
    {
        $doctorCharges = $appointment->doctor->charges;

        $totalDoctorCharge = 0;

        $doctorCharges->map(function ($charge) use ($totalDoctorCharge) {
            return $totalDoctorCharge = $totalDoctorCharge + $charge;
        });

        return $totalDoctorCharge;
    }


}
