<?php

namespace App\Http\Controllers;

use App\Patient;
use App\PatientHistory;
use App\PatientReport;
use App\Prescription;
//use Dotenv\Validator;
//use Illuminate\Validation\Validator;
use Validator;
use Illuminate\Http\Request;
use PrescriptionItem;



class PatientHistoryController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:api','cors'])->except('update');
    }

    public function show(Request $request)
    {
        $patientWithHistory = Patient::with('history')
                                ->where('patient_id', $request->patient_id)
                                ->get();

        return response()->json([
            'status' => 'success',
            'data' => compact('patientWithHistory'),
        ], 200);
    }

    public function edit($id)
    {
        // Patient details
        $patient = Patient::find($id);

        if( ! $patient){
            return response()->json([
                'status' => 'not_found',
                'message' => 'Patient not found',
            ], 404);
        }

        // Symptoms, Diagnosis, Remarks
        $latestHistory = $patient
                            ->history()
                                ->where('doctor_id', auth()->id())
                                ->latest()
                                ->first();

        // prescriptions
        $latestPrescription = $patient
                                ->prescriptions()
                                    ->latest()
                                    ->first();

        // reports
        $latestReports = $patient
                            ->reports()
                                ->latest()
                                ->get(3);

        return response()->json([
            'status' => 'success',
            'data' => [
                'patient' => $patient,
                'history' => $latestHistory,
                'prescriptions' => $latestPrescription,
                'reports' => $latestReports,
            ],
        ], 200);

    }

    public function update(Request $request)
    {

        try{
            // update symptoms, diagnosis, remarks
            $data = $request->only(['symptoms', 'diagnosis', 'remarks']);
            $data['patient_id'] = $request->patient_id;
            $data['doctor_id'] = $request->doctor_id;

            $history = PatientHistory::create($data);

            // if prescription available -> save
            $this->createPrescription($request);

            // if reports available -> save
            $this->storeReports($request);

            return response()->json([
                'status' => 'success',
                'message' => 'Patient history updated successfully',
            ], 201);

        }catch(\Exception $e){
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong',
                'errors' => [
                    $e
                ]
            ], 500);

        }
    }

    /**
     * @param Request $request
     * @param array $data
     */
    private function createPrescription(Request $request)
    {
        if ($request->has('prescription')) {
            $prescription = Prescription::create([
                'patient_id' => $request->patient_id,
                'doctor_id' => auth()->id(),
                'prescribable_id' => $request->appointment_id,
                'prescribable_type' => Prescription::APPOINTMENT,
            ]);


            foreach ($request->medicine_items as $medicine) {
                $prescription->medicines()->create([
                    'title' => $medicine['sku'],
                    'qty' => $medicine['qty']
                ]);
            }
        }
    }

    /**
     * @param Request $request
     * @param array $data
     */
    private function storeReports(Request $request)
    {
        if ($request->has('medicine_reports')) {
            foreach ($request->medicine_reports as $report) {
                PatientReport::create([
                    'name' => $report['title'],
                    'patient_id' => $request->patient_id,
                    'doctor_id' => auth()->id(),
                    'received_at' => now(),
                ]);
            }
        }
    }
}
