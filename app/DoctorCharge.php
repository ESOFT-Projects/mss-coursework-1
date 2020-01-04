<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DoctorCharge extends Model
{
    protected $guarded = [];

    public function doctor()
    {
        return $this->belongsTo('App\Doctor', 'doctor_id', 'doctor_id');
    }
}
