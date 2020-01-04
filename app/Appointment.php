<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    protected $guarded = [];

    public function patient()
    {
        return $this->hasOne('App\Patient', 'id', 'patient_id');
    }

    public function doctor()
    {
        return $this->hasOne('App\Doctor', 'id', 'doctor_id');
    }

    public function timeSlot()
    {
        return $this->belongsTo('App\TimeSlot', 'id', 'time_slot_id');
    }

    public function invoice()
    {
        return $this->hasOne('App\AppointmentInvoice', 'id', 'appointment_id');
    }
}
