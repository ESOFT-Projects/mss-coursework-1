<?php

namespace App\Http\Controllers;

use App\Appointment;
use App\TimeSlot;
use Illuminate\Http\Request;

class TimeSlotController extends Controller
{
    public function getTimeSlotsWithAvailabilityForGivenDate(Request $request)
    {
        $timeSlots = TimeSlot::withCount(['appointments' => function($query) use($request) {
                $query->where('date', $request->date);
            }])
            ->get();

        $timeSlots = $timeSlots->map(function($slot){
            $slot->available = $slot->appointments_count <= 15;
            return $slot;
        });

        return response()->json([
            'status' => 'success',
            'data' => $timeSlots,
        ], 200);
    }
}
