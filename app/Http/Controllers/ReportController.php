<?php

namespace App\Http\Controllers;

use App\Doctor;
use App\Product;
use App\SpecializationArea;
use Carbon\Carbon;
use Illuminate\Http\Request;
use PDF;
class ReportController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:api','cors'])->except(
            'appointmentsForSpecializationAreaReport',
            'doctorPaymentReport',
            'export_report_appointment_specialization_area',
            'export_report_doctor_payment',
            'productsInReorderLevel',
            'export_report_products_level',
            'mostPrescribedProductsOfThisWeek',
            'export_report_most_prescribed_products_in_last_week'
        );
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
        $doctorsWithInvoices = $this->getDoctorPaymentReportData();

        return response()->json([
            'status' => 'success',
            'data' => $doctorsWithInvoices,
        ], 200);

    }

    public function productsInReorderLevel()
    {
        $products = $this->getProductsInReorderLevel();

        return response()->json([
            'status' => 'success',
            'data' => $products,
        ], 200);
    }

    public function mostPrescribedProductsOfThisWeek()
    {
        $products = $this->getMostPrescribedProductsData();

        return response()->json([
            'status' => 'success',
            'data' => $products,
        ], 200);
    }

    public function export_report_appointment_specialization_area(Request $request){
         $reports =  $this->getAppointmentsForSpecializationAreaReport(null,null,$request->keyword);

		 //$accidents = Accident::where('accident_id',$request->accident_id)->get();

         $pdf = PDF::loadView('pdf-report-appointments', compact('reports'));
         return $pdf->download("report.pdf");

    }

    public function export_report_doctor_payment(Request $request){
        $reportData =  $this->getDoctorPaymentReportData();

        $pdf = PDF::loadView('pdf-report-doctor-payment', compact('reportData'));
        return $pdf->download("report-doctor-payment.pdf");

    }

    public function export_report_products_level(Request $request){
        $reportData =  $this->getProductsInReorderLevel();

        $pdf = PDF::loadView('pdf-report-products-level', compact('reportData'));
        return $pdf->download("report-products-level.pdf");

    }

    public function export_report_most_prescribed_products_in_last_week(Request $request){
        $reportData = $this->getMostPrescribedProductsData();

        $pdf = PDF::loadView('pdf-report-most-prescribed-products', compact('reportData'));
        return $pdf->download("report-most-prescribed-products.pdf");

    }

    private function getAppointmentsForSpecializationAreaReport($dateFrom=null, $dateTo=null, $keyword=null)
    {
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

    private function getDoctorPaymentReportData()
    {
        $doctorsWithInvoices = Doctor::with(['employee', 'invoices' => function($q){
            $q->whereNotNull('paid_at');
        }])->get();

        foreach($doctorsWithInvoices as &$doctor){
            $total = 0;
            foreach($doctor->invoices as $invoice){
                $total = $total + $invoice->total / 100;
            }
            $doctor->amount = number_format($total * 80 / 100, 2, '.', '');
            unset($doctor->invoices);
        }

        return $doctorsWithInvoices;
    }

    private function getProductsInReorderLevel()
    {
        return Product::whereRaw('units <= reorder_level')->get();
    }

    private function getMostPrescribedProductsData()
    {
        return Product::withCount(['prescriptions' => function($query){
                            $startDate = Carbon::now()->startOfWeek()->format('Y-m-d');
                            $endDate = Carbon::now()->endOfWeek()->format('Y-m-d');
                            $query->whereRaw("DATE(created_at) >= '$startDate' ");
                            $query->whereRaw("DATE(created_at) <= '$endDate' ");
                        }])
                        ->orderBy('prescriptions_count', 'DESC')
                        ->get();
    }
}
