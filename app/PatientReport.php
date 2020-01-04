<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PatientReport extends Model
{
    protected $guarded = [];
    public $timestamps = [
        'received_at',
        'tested_at',
    ];

    public function patient()
    {
        return $this->belongsTo('App\Patient', 'patient_id', 'patient_id');
    }

    public function doctor()
    {
        return $this->belongsTo('App\Doctor', 'doctor_id', 'doctor_id');
    }

    public function type()
    {
        return $this->belongsTo('App\PatientReportType', 'type_id', 'id');
    }
}
