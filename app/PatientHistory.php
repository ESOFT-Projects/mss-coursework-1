<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PatientHistory extends Model
{
    protected $table = 'patient_history';
    protected $guarded = [];

    public function patient()
    {
        return $this->belongsTo('App\Patient', 'patient_id', 'patient_id');
    }

    public function doctor()
    {
        return $this->belongsTo('App\Doctor', 'doctor_id', 'doctor_id');
    }
}
