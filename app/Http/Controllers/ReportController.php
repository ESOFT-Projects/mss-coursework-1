<?php

namespace App\Http\Controllers;

use App\Doctor;
use App\SpecializationArea;
use Illuminate\Http\Request;
use PDF;
class ReportController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except('appointmentsForSpecializationAreaReport','export_report_appointment_specialization_area');
    }


    public function appointmentsForSpecializationAreaReport(Request $request)
    {

		$data = $this->getAppointmentsForSpecializationAreaReport($request->date_from, $request->date_to);

        return response()->json([
            'status' => 'success',
            'data' => $data,
        ], 200);

    }

    public function doctorPaymentReport()
    {
        $doctorsWithInvoices = Doctor::with(['employee', 'invoices' => function($q){
            $q->whereNotNull('paid_at');
        }])->get();

        foreach($doctorsWithInvoices as &$doctor){
            $total = 0;
            foreach($doctor->invoices as $invoice){
                $total = $total + $invoice->total / 100;
            }
            $doctor->amount = $total * 80 / 100;
            unset($doctor->invoices);
        }

        return response()->json([
            'status' => 'success',
            'data' => $doctorsWithInvoices,
        ], 200);

    }

	private function getAppointmentsForSpecializationAreaReport($dateFrom=null, $dateTo=null, $keyword=null)
	{

		/*print_r([
		$dateFrom, $dateTo, $keyword
		]);*/

		$builder = SpecializationArea::withCount(['appointments as active_count' => function($query){
                                $query->whereNull('cancelled_at');
                            }])
                            ->withCount(['appointments as cancelled_count' => function($query){
                                $query->whereNotNull('cancelled_at');
                            }]);

        if($dateFrom && $dateTo){
            $builder->whereHas('appointments', function($query) use($dateFrom, $dateTo){
                $query->where('date', '>=', $dateFrom);
                $query->where('date', '<=', $dateTo);
            });
        }else if($dateFrom){
            $builder->whereHas('appointments', function($query) use($dateFrom, $dateTo){
                $query->where('date', '>=', $dateFrom);
            });
        }else if($dateTo){
            $builder->whereHas('appointments', function($query) use($dateFrom, $dateTo){
                $query->where('date', '<=', $dateTo);
            });
        }

		if($keyword){
            $builder->where('area', 'LIKE', "%$keyword");
        }

        return $builder->get();

	}


    public function export_report_appointment_specialization_area(Request $request){
         $reports =  $this->getAppointmentsForSpecializationAreaReport(null,null,$request->keyword);

		 //$accidents = Accident::where('accident_id',$request->accident_id)->get();

         $pdf = PDF::loadView('pdf-report-appointments', compact('reports'));
         return $pdf->download("report.pdf");

    }




}
