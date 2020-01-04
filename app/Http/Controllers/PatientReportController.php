<?php

namespace App\Http\Controllers;

use App\PatientReport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PatientReportController extends Controller
{
    public function update(Request $request)
    {
        $validator = Validator::make($request, [
            'report_id' => 'required',
            'results' => 'required',
            'remarks' => 'required',
        ]);

        if($validator->fials()){
            return response()->json([
                'status' => 'validation_error',
                'errors' => [
                    $validator->errors(),
                ]
            ], 419);
        }

        $patientReport = PatientReport::find($request->report_id);

        if($patientReport->tested_at){
            return response()->json([
                'status' => 'error',
                'errors' => [
                    'This report has already updated'
                ]
            ], 200);
        }

        $patientReport->results = $request->results;
        $patientReport->remarks = $request->remarks;
        $patientReport->tested_by = auth()->id();
        $patientReport->tested_at = now();
        $patientReport->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Report updated successfully',
        ], 200);

    }

    public function generateReportPDF(Request $request, $id)
    {
        if (! $request->hasValidSignature()) {
//            abort(401);
            return response()->json([
                'status' => 'error',
                'message' => 'URL expired',
            ], 401);
        }

        $pdf = PDF::loadView('pdf.medical-report', []);
        $time = time();
        return $pdf->stream("report-{$time}.pdf");
    }
}
