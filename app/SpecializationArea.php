<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SpecializationArea extends Model {
    protected $table="specializations_areas";
    protected $primaryKey="specialization_id";
    public $timestamps=false;

    public function appointments()
    {
        return $this->hasManyThrough('App\Appointment', 'App\Doctor', 'specialization_id', 'doctor_id', 'specialization_id', 'doctor_id');
    }
}
