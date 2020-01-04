<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Patient extends Model {
    protected $table="patients";
    protected $primaryKey="patient_id";

    protected $guarded = [];
    //public $timestamps=false;

    public function history()
    {
        return $this->hasMany('App\PatientHistory', 'doctor_id', 'patient_id');
    }
}
