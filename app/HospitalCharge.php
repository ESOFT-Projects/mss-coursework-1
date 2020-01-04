<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HospitalCharge extends Model
{
    protected $guarded = [];

    public function type()
    {
        // APPOINTMENT
        // SERVICE_CHARGE
        // ADMISSION
        return $this->belongsTo('App\HospitalChargeType', 'charge_type_id', 'id');
    }
}
