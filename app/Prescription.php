<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prescription extends Model
{
    protected $guarded = [];

    const APPOINTMENT = 'App\Appointment';

    public function patient()
    {
        return $this->belongsTo('App\Patient', 'patient_id', 'patient_id');
    }

    public function doctor()
    {
        return $this->belongsTo('App\Doctor', 'doctor_id', 'doctor_id');
    }

    public function medicines()
    {
        return $this->hasMany('App\PrescriptionItem', 'prescription_id', 'id');
    }

    public function isForAppointment()
    {
        return $this->prescribable_type == APPOINTMENT;
    }
}
